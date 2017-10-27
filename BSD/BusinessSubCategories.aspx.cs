using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;


namespace BSD
{
    public partial class BusinessSubCategories : BasePage
    {
        public string screen = "BusinessSubCategories";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["BSD"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {

                try
                {
                    ExistingSubCategories.PageSize = 20;
                    Title = screen;
                    ChangeTitles();
                    BindCategory();
                    BindExistingSubCategories();
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

        public void BindCategory()
        {
            using (DataTable dt = Snippets.GetData(Snippets.Query(screen, "BindConstructionCategory"),
                new[]
                {
                    new SqlParameter("@do_id",Snippets.GetSession("DoID")),
                    new SqlParameter("@user_id",Snippets.GetSession("UserID"))
                }, true))
            {
                BusinessCategory.Items.Clear();
                BusinessCategory.DataSource = dt;
                BusinessCategory.DataTextField = "description";
                BusinessCategory.DataValueField = "id";
                BusinessCategory.DataBind();
                AddDefaultItemOnZeroIndex(BusinessCategory);
            }
        }

        public void ChangeTitles()
        {
            ButtonSubmit.Text = Get("SUBMIT");
            ButtonSearch.Text = Get("Search");
            SearchBox.Attributes.Add("placeholder", Get("SearchHere"));
            ButtonClear.Text = Get("Clear");
        }

        protected void ReportError_OnClick(object sender, EventArgs e)
        {
            Snippets.ReportError(ViewState["Msg"].ToString(), ViewState["Stk"].ToString());
            ErrorPanel.Visible = false;
        }

        protected void ButtonSubmit_OnClick(object sender, EventArgs e)
        {
            try
            {
                if (IsZero(BusinessCategory))
                {
                    Notify(Get("PlsChsSmCateg"), "danger");
                    return;
                }
                if (IsNull(BusinessSubCategoryCode))
                {
                    Notify(Get("PlsEntrSbCategCode"), "danger");
                    return;
                }
                if (IsNull(SubCategoryDescription))
                {
                    Notify(Get("PlsEnterSubCateg"), "danger");
                    return;
                }

                #region UPDATE MODE CODING

                if (ViewState["OldSubCategCode"].ToString() != null) // Means User is in update mode
                {
                    if (ViewState["OldSubCategCode"].ToString().ToLower() == TextLower(BusinessSubCategoryCode)
                        &&
                        ViewState["OldSubDesc"].ToString().ToLower() == TextLower(SubCategoryDescription))
                    {
                        ButtonClear_OnClick(null, null);
                        Notify(Get("RecUpdateSuccess"), "success");
                        return;
                    }

                    if (ViewState["OldSubCategCode"].ToString().ToLower() != TextLower(BusinessSubCategoryCode)
                        &&
                        ViewState["OldSubDesc"].ToString().ToLower() == TextLower(SubCategoryDescription))
                    {

                        using (DataTable dt = Snippets.GetData(Snippets.Query(screen, "CheckIfBusinessCodeExistOnThisCategory"), new[]
                            {
                                 new SqlParameter("@doID",Snippets.GetSession("doID")),
                                 new SqlParameter("@categ",BusinessCategory.SelectedValue),
                                 new SqlParameter("@code",BusinessSubCategoryCode.Text)
                            }))
                        {
                            if (dt.Rows.Count > 0)
                            {
                                Notify(Get("BsnsSubCategCodAlrdExst"), "danger", "BusinessSubCategoryCode");
                                return;
                            }

                            Snippets.SetData(Snippets.Query(screen, "UpdateBusinessSubCategories"), new[]
                            {
                                new SqlParameter("@categText",BusinessCategory.SelectedItem.Text.Trim()),
                                new SqlParameter("@code",Text(BusinessSubCategoryCode)),
                                new SqlParameter("@descr",Text(SubCategoryDescription)),
                                new SqlParameter("@abbr",Text(Abbreviation)),
                                new SqlParameter("@categ",BusinessCategory.SelectedValue),
                                new SqlParameter("@seq",ViewState["UpdateID"])
                            });

                            ButtonClear_OnClick(null, null);
                            Notify(Get("RecUpdateSuccess"), "success");
                        }
                    }

                    if (ViewState["OldSubCategCode"].ToString().ToLower() != TextLower(BusinessSubCategoryCode)
                        &&
                        ViewState["OldSubDesc"].ToString().ToLower() != TextLower(SubCategoryDescription))
                    {

                        using (DataTable dt = Snippets.GetData(Snippets.Query(screen, "CheckIfBusinessCodeExistOnThisCategory"), new[]
                        {
                             new SqlParameter("@doID",Snippets.GetSession("doID")),
                             new SqlParameter("@categ",BusinessCategory.SelectedValue),
                             new SqlParameter("@code",BusinessSubCategoryCode.Text)
                        }))
                        {
                            if (dt.Rows.Count > 0)
                            {
                                Notify(Get("BsnsSubCategCodAlrdExst"), "danger", "BusinessSubCategoryCode");
                                return;
                            }

                            // CHECK IF DESCRIPTION ALREADY EXIST OR NOT IF YES THEN RETURN FALSE ELSE UPDATE CHALAO
                            using (DataTable dt2 = Snippets.GetData(Snippets.Query(screen, "CheckIfBusinessDescriptionExistOnThisCategory"), new[]
                                 {
                                            new SqlParameter("@doID",Snippets.GetSession("doID")),
                                            new SqlParameter("@categ",BusinessCategory.SelectedValue),
                                            new SqlParameter("@desc",SubCategoryDescription.Text)
                                    }))
                            {
                                if (dt2.Rows.Count > 0)
                                {
                                    Notify(Get("BsnsSubCategCodAlrdExst"), "danger", "BusinessSubCategoryCode");
                                    return;
                                }

                                Snippets.SetData(Snippets.Query(screen, "UpdateBusinessSubCategories"), new[]
                                {
                                    new SqlParameter("@categText",BusinessCategory.SelectedItem.Text.Trim()),
                                    new SqlParameter("@code",Text(BusinessSubCategoryCode)),
                                    new SqlParameter("@descr",Text(SubCategoryDescription)),
                                    new SqlParameter("@abbr",Text(Abbreviation)),
                                    new SqlParameter("@categ",BusinessCategory.SelectedValue),
                                    new SqlParameter("@seq",ViewState["UpdateID"])
                                 });

                                ButtonClear_OnClick(null, null);
                                Notify(Get("RecUpdateSuccess"), "success");
                            }
                        }
                    }

                    if (ViewState["OldSubCategCode"].ToString().ToLower() == TextLower(BusinessSubCategoryCode)
                       &&
                       ViewState["OldSubDesc"].ToString().ToLower() != TextLower(SubCategoryDescription))
                    {

                        using (DataTable dt = Snippets.GetData(Snippets.Query(screen, "CheckIfBusinessDescriptionExistOnThisCategory"), new[]
                        {
                             new SqlParameter("@doID",Snippets.GetSession("doID")),
                             new SqlParameter("@categ",BusinessCategory.SelectedValue),
                             new SqlParameter("@desc",SubCategoryDescription.Text)
                        }))
                        {
                            if (dt.Rows.Count > 0)
                            {
                                Notify(Get("BsnsSubCategCodAlrdExst"), "danger", "BusinessSubCategoryCode");
                                return;
                            }

                            Snippets.SetData(Snippets.Query(screen, "UpdateBusinessSubCategories"), new[]
                            {
                                new SqlParameter("@categText",BusinessCategory.SelectedItem.Text.Trim()),
                                new SqlParameter("@code",Text(BusinessSubCategoryCode)),
                                new SqlParameter("@descr",Text(SubCategoryDescription)),
                                new SqlParameter("@abbr",Text(Abbreviation)),
                                new SqlParameter("@categ",BusinessCategory.SelectedValue),
                                new SqlParameter("@seq",ViewState["UpdateID"])
                            });

                            ButtonClear_OnClick(null, null);
                            Notify(Get("RecUpdateSuccess"), "success");
                        }
                    }
                }

                #endregion

                #region SUBMIT CODING

                // Check if business code or description exist before inserting this record

                using (DataTable dt = Snippets.GetData(Snippets.Query(screen, "CheckIfBusinessCodeOrDescExistBeforeSubmit"), new[]
                {
                    new SqlParameter("@code",Text(BusinessSubCategoryCode)),
                    new SqlParameter("@descr",Text(SubCategoryDescription)),
                    new SqlParameter("@abbr",Text(Abbreviation)),
                    new SqlParameter("@categ",BusinessCategory.SelectedValue)
                }))
                {
                    if (dt.Rows.Count > 0)
                    {
                        Notify(Get("SubCategAlrdExst"), "danger");
                        return;
                    }

                    Snippets.SetData(Snippets.Query(screen, "InsertNewSubCategory"), new[]
                    {
                            new SqlParameter("@code",Text(BusinessSubCategoryCode)),
                            new SqlParameter("@desc",Text(SubCategoryDescription)),
                            new SqlParameter("@abbr",Text(Abbreviation)),
                            new SqlParameter("@categID",BusinessCategory.SelectedValue),
                            new SqlParameter("@buss_categ",BusinessCategory.SelectedItem.Text),
                            new SqlParameter("@crtd_by",Snippets.GetSession("UserID")),
                            new SqlParameter("@crtd_by_prfx",Snippets.GetSession("UserPrefix")),
                            new SqlParameter("@crtd_date",BusinessCategory.SelectedValue),
                            new SqlParameter("@is_active",BusinessCategory.SelectedValue),
                            new SqlParameter("@do_id",Snippets.GetSession("DoID")),
                            new SqlParameter("@lang",Snippets.GetSession("UserLang")),
                            new SqlParameter("@categID",BusinessCategory.SelectedValue)
                        });

                    ButtonClear_OnClick(null, null);
                    Notify(Get("SubCategAlrdExst"), "success");
                }

                #endregion
            }
            catch (Exception exception)
            {
                ErrorDescription.Text = exception.Message;
                ErrorPanel.Visible = true;
                ViewState["Msg"] = exception.Message;
                ViewState["Stk"] = exception.StackTrace;
            }
        }

        public void BindExistingSubCategories()
        {
            using (DataTable dt = Snippets.GetData(Snippets.Query(screen, "BindGridViewForSubCategories"), new[]
            {
                 new SqlParameter("@doID",Snippets.GetSession("DoID")),
                 new SqlParameter("@search",Text(SearchBox))
            }))
            {
                ExistingSubCategories.DataSource = dt;
                ExistingSubCategories.DataBind();
            }
            DataUP.Update();
        }

        protected void ButtonClear_OnClick(object sender, EventArgs e)
        {
            try
            {
                BusinessCategory.SelectedIndex = 0;
                BusinessSubCategoryCode.Text = string.Empty;
                SubCategoryDescription.Text = string.Empty;
                Abbreviation.Text = string.Empty;
                BindExistingSubCategories();
            }
            catch (Exception exception)
            {
                ErrorDescription.Text = exception.Message;
                ErrorPanel.Visible = true;
                ViewState["Msg"] = exception.Message;
                ViewState["Stk"] = exception.StackTrace;
            }
        }

        protected void BusinessCategory_OnSelectedIndexChanged(object sender, EventArgs e)
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

        protected void ButtonSearch_OnClick(object sender, EventArgs e)
        {
            try
            {
                BindExistingSubCategories();
            }
            catch (Exception exception)
            {
                ErrorDescription.Text = exception.Message;
                ErrorPanel.Visible = true;
                ViewState["Msg"] = exception.Message;
                ViewState["Stk"] = exception.StackTrace;
            }
        }


        protected void ExistingSubCategories_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                ExistingSubCategories.PageIndex = e.NewPageIndex;
                BindExistingSubCategories();
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}