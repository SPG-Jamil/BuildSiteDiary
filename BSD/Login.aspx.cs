using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace BSD
{
    public partial class Login : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Abandon();
                Session.Clear();
            }
        }

        public DataTable SesssionTable = new DataTable()
        {
            Columns = { new DataColumn("SessionName"), new DataColumn("SessionValue") }
        };

        protected void LoginBTN_OnClick(object sender, EventArgs e)
        {

            if (UName_Box.Value.Trim() == string.Empty)
            {
                UName_Box.Focus();
                return;
            }
            if (PWD_Box.Text.Trim() == string.Empty)
            {
                PWD_Box.Focus();
                return;
            }

            using (DataTable dt = Snippets.GetData(Snippets.Query("Login", "ValidateCredentials"), new[]
            {
                new SqlParameter("@userName", UName_Box.Value.Trim())
            }))
            {
                if (dt.Rows.Count > 0)
                {
                    var userName = dt.Rows[0]["user_user_Name"].ToString().Trim();
                    var password = dt.Rows[0]["user_password"].ToString();
                    var flag = Snippets.Decrypt(password);

                    if (string.Equals(userName, UName_Box.Value, StringComparison.CurrentCultureIgnoreCase) && PWD_Box.Text == flag)
                    {
                        SesssionTable.Rows.Add("UserID", dt.Rows[0]["user_user_id"].ToString());
                        SesssionTable.Rows.Add("UserPrefix", dt.Rows[0]["user_prefix"].ToString());
                        SesssionTable.Rows.Add("UserName", Snippets.UpperCaseFirstCharacter(dt.Rows[0]["user_first_name"].ToString().Trim() + " " + dt.Rows[0]["user_middle_name"].ToString().Trim()));

                        if (dt.Rows[0]["user_prefix"].ToString().Trim().ToLower() == "vend_admin" || Convert.ToBoolean(dt.Rows[0]["IsPremiumUser"].ToString().Trim()))
                        {
                            SesssionTable.Rows.Add("DoID", dt.Rows[0]["user_do_id"].ToString());
                            SesssionTable.Rows.Add("UserLang", dt.Rows[0]["user_lang"].ToString());
                            SesssionTable.Rows.Add("IsPremiumUser", dt.Rows[0]["IsPremiumUser"].ToString());
                            SesssionTable.Rows.Add("BusinessName", dt.Rows[0]["bs_name"].ToString());

                            Notify("Please wait while redirecting you to application.", "success");
                            Session["BSD"] = SesssionTable;
                            Response.Redirect("Roadmap.aspx");
                        }
                        else
                        {
                            if (Convert.ToBoolean(dt.Rows[0]["IsOwnStaff"].ToString().Trim()))
                            {
                                LogPanel.Visible = false;
                                OwnStaffPanel.Visible = true;
                                DataOwnerPanel.Visible = false;

                                SesssionTable.Rows.Add("DoID", dt.Rows[0]["user_do_id"].ToString());
                                SesssionTable.Rows.Add("UserLang", dt.Rows[0]["user_lang"].ToString());
                                SesssionTable.Rows.Add("IsPremiumUser", dt.Rows[0]["IsPremiumUser"].ToString());
                                SesssionTable.Rows.Add("BusinessName", dt.Rows[0]["bs_name"].ToString());
                                Session["BSD"] = SesssionTable;

                                using (DataTable childDt = Snippets.GetData(Snippets.Query("Login", "BindDropDownForOwnStaff"), new[]
                                {
                                    new SqlParameter("@userID",dt.Rows[0]["user_user_id"].ToString()),
                                    new SqlParameter("@doID",dt.Rows[0]["user_do_id"].ToString())
                                }))
                                {
                                    ProjectDrpOwnStaff.DataSource = childDt;
                                    ProjectDrpOwnStaff.DataTextField = "ProjectName";
                                    ProjectDrpOwnStaff.DataValueField = "ProjectID";
                                    ProjectDrpOwnStaff.DataBind();
                                    AddDefaultItemOnZeroIndex(ProjectDrpOwnStaff);
                                }
                            }
                            else
                            {
                                LogPanel.Visible = false;
                                OwnStaffPanel.Visible = false;
                                DataOwnerPanel.Visible = true;

                                using (DataTable childDt = Snippets.GetData(Snippets.Query("Login", "BindDataOwnerDropDown"), new[]
                               {
                                     new SqlParameter("@userID",dt.Rows[0]["user_user_id"].ToString())
                               }))
                                {
                                    DataOwner.DataSource = childDt;
                                    DataOwner.DataTextField = "DataOwnerBusinessName";
                                    DataOwner.DataValueField = "DataOwnerID";
                                    DataOwner.DataBind();
                                    AddDefaultItemOnZeroIndex(DataOwner);
                                }
                            }
                        }
                    }
                    else
                    {
                        Notify("You have entered wrong username or password", "danger");
                    }
                }
                else
                {
                    Notify("You have entered wrong username or password", "danger");
                }
            }
        }

        protected void forgotEmail_OnClick(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(EmailBox.Text))
            {
                Notify("Please enter email address.", "danger");
                EmailBox.Focus();
                return;
            }

            #region If request to forgot your password already exists then fetch the rescue link and resend the email

            using (var dt = Snippets.GetData(Snippets.Query("Login", "CheckPasswordResetRequestAndGetRequestLink"), new[] { new SqlParameter("@Email", EmailBox.Text) }))
            {
                if (dt.Rows.Count > 0)
                {
                    var link =
                        $"<a href = '{Request.Url.AbsoluteUri.ToLower().Replace("login.aspx", "ForgotYourPassword.aspx?RescueCode=" + dt.Rows[0]["RescueLink"])}'>Click here</a>";
                    var list = Snippets.GetEmail("English", "UserForgotHisPasswordAndEnteredRecoveryEmail");
                    Snippets.SendEmail(EmailBox.Text, list[0].ToString(), list[1].ToString().Replace("@link", link).Replace("[LB]", "<br/>").Replace("@guid", dt.Rows[0]["RescueLink"].ToString()));
                    Notify("Link to recover password sent successfully", "success");
                }
                else
                {
                    var resetKey = Guid.NewGuid().ToString();

                    Snippets.SetData(Snippets.Query("Login", "GenerateNewPasswordResetLink"), new[]
                    {
                        new SqlParameter("@Email", EmailBox.Text),
                        new SqlParameter("@GUID", resetKey)
                    });

                    var link =
                       $"<a href = '{Request.Url.AbsoluteUri.ToLower().Replace("login.aspx", "ForgotYourPassword.aspx?RescueCode=" + resetKey)}'>Click here</a>";
                    var list = Snippets.GetEmail("English", "UserForgotHisPasswordAndEnteredRecoveryEmail");
                    Snippets.SendEmail(EmailBox.Text, list[0].ToString(), list[1].ToString().Replace("@link", link).Replace("[LB]", "<br/>").Replace("@guid", resetKey));
                    Notify("Link to recover password sent successfully", "success");
                }
            }

            #endregion
        }

        protected void forgotUserName_OnClick(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(EmailBox2.Text))
            {
                Notify("Please enter email address.", "danger");
                EmailBox2.Focus();
                return;
            }

            #region If email exist then send email with username
            using (var dt = Snippets.GetData(Snippets.Query("Login", "GetUserNameByUserEmail"), new[] { new SqlParameter("@Email", EmailBox2.Text) }))
            {
                if (dt.Rows.Count > 0)
                {
                    var list = Snippets.GetEmail("English", "UserForgotHisUserNameAndEnteredRecoveryEmail");
                    Snippets.SendEmail(EmailBox2.Text, list[0].ToString(), list[1].ToString()
                        .Replace("@userName", "<strong>"+ dt.Rows[0][0].ToString() + "</strong>")
                        .Replace("[LB]", "<br/>")
                        );
                    Notify("Link to recover username sent successfully", "success");
                }
                else
                {
                    Notify("Invalid email address.", "danger");
                    EmailBox2.Focus();
                }
            }
            #endregion
        }

        protected void ProjectDrpOwnStaff_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ProjectDrpOwnStaff.SelectedIndex > 0)
            {
                if (Session["BSD"] != null)
                {
                    DataTable dt = Session["BSD"] as DataTable;
                    Notify("Please wait while redirecting you to application.", "success");
                    dt.Rows.Add("ProjectID", ProjectDrpOwnStaff.SelectedValue);
                    Session["BSD"] = dt;
                    var y = (Session["BSD"] as DataTable).Rows.Count;
                    var x = (Session["BSD"] as DataTable).Select("SessionName = 'DoID'")[0][1].ToString().Trim();
                    Response.Redirect("RoadMap.aspx", false);
                }
              
            }
        }

        protected void DataOwner_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (DataOwner.SelectedIndex > 0)
            {
                SesssionTable.Rows.Add("BusinessName", DataOwner.SelectedItem.Text);


                using (DataTable dt = Snippets.GetData(Snippets.Query("Login", "GenerateProjectsOfDataOwner"), new[]
                {
                    new SqlParameter("@userID",Snippets.GetSession("UserID")),
                    new SqlParameter("@doID",DataOwner.SelectedItem.Value)
                }))
                {
                    DataOwnerProject.DataSource = dt;
                    DataOwnerProject.DataValueField = "ProjectID";
                    DataOwnerProject.DataTextField = "ProjectName";
                    DataOwnerProject.DataBind();
                    AddDefaultItemOnZeroIndex(DataOwnerProject);
                }
            }
        }

        protected void DataOwnerProject_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (DataOwnerProject.SelectedIndex > 0)
            {
                if (Session["BSD"] != null)
                {
                    Notify("Please wait while redirecting you to application.", "success");
                    DataTable dt = Session["BSD"] as DataTable;
                    dt.Rows.Add("ProjectID", DataOwnerProject.SelectedValue);
                    Session["BSD"] = dt;
                    Response.Redirect("RoadMap.aspx", false);
                }

               
            }
        }
    }
}