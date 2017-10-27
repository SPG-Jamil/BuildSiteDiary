using System;

namespace BSD
{
    public partial class SMSAndEmailParameters : BasePage
    {
        public string screen = "SMSAndEmailParameters";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["BSD"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                ChangeTitle();
            }
        }

        public void ChangeTitle()
        {
            ButtonSearch.Text = Get("Search");
            SearchBox.Attributes.Add("placeholder", Get("SearchHere"));
            ButtonSearch2.Text = Get("Search");
            SearchBox2.Attributes.Add("Placeholder", Get("SearchHere"));
            ReportError.Text = Get("RptErr");
        }

        protected void ReportError_OnClick(object sender, EventArgs e)
        {
            Snippets.ReportError(ViewState["Msg"].ToString(), ViewState["Stk"].ToString());
            ErrorPanel.Visible = false;
        }

        protected void ButtonSearch_OnClick(object sender, EventArgs e)
        {
            try
            {
            }
            catch (Exception exception)
            {
                ErrorDescription.Text = exception.Message;
                ErrorPanel.Visible = true;
                ViewState["Msg"] = exception.Message;
                ViewState["Stk"] = exception.StackTrace;
            }
        }

        protected void ProjectDrp1_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
            }
            catch (Exception exception)
            {
                ErrorDescription.Text = exception.Message;
                ErrorPanel.Visible = true;
                ViewState["Msg"] = exception.Message;
                ViewState["Stk"] = exception.StackTrace;
            }
        }

        protected void SelectProject_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
            }
            catch (Exception exception)
            {
                ErrorDescription.Text = exception.Message;
                ErrorPanel.Visible = true;
                ViewState["Msg"] = exception.Message;
                ViewState["Stk"] = exception.StackTrace;
            }
        }


        protected void ButtonSearch2_OnClick(object sender, EventArgs e)
        {
            try
            {
            }
            catch (Exception exception)
            {
                ErrorDescription.Text = exception.Message;
                ErrorPanel.Visible = true;
                ViewState["Msg"] = exception.Message;
                ViewState["Stk"] = exception.StackTrace;
            }
        }
    }
}