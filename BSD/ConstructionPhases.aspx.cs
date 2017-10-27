using System;

namespace BSD
{
    public partial class ConstructionPhases : BasePage
    {
        public string screen = "ConstructionPhases";

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
            ButtonSubmit.Text = Get("SUBMIT");
            ButtonClear.Text = Get("Clear");
            SearchButton.Text = Get("Search");
            SearchBox.Attributes.Add("Placeholder", Get("SearchHere"));
            ReportError.Text = Get("RptErr");
        }

        protected void ButtonSubmit_OnClick(object sender, EventArgs e)
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

        protected void ButtonClear_OnClick(object sender, EventArgs e)
        {
            try
            {
                PhaseSequenceBox.Text = string.Empty;
                PhaseDescriptionBox.Text = string.Empty;
                PhaseCodeBox.Text = string.Empty;
                if (ConstrcutionSubCategoryTypeDpd.Items.Count > 0)
                {
                    ConstrcutionSubCategoryTypeDpd.SelectedIndex = 0;
                }
                if (ConstructionSubCategoryDpd.Items.Count > 0)
                {
                    ConstructionSubCategoryDpd.SelectedIndex = 0;
                }
                if (ConstructionCategoryDpd.Items.Count > 0)
                {
                    ConstructionCategoryDpd.SelectedIndex = 0;
                }
            }
            catch (Exception exception)
            {
                ErrorDescription.Text = exception.Message;
                ErrorPanel.Visible = true;
                ViewState["Msg"] = exception.Message;
                ViewState["Stk"] = exception.StackTrace;
            }
        }

        protected void SearchButton_OnClick(object sender, EventArgs e)
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

        protected void ConstrcutionSubCategoryTypeDpd_OnSelectedIndexChanged(object sender, EventArgs e)
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

        protected void ConstructionSubCategoryDpd_OnSelectedIndexChanged(object sender, EventArgs e)
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

        protected void ConstructionCategoryDpd_OnSelectedIndexChanged(object sender, EventArgs e)
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

        protected void ReportError_OnClick(object sender, EventArgs e)
        {
            Snippets.ReportError(ViewState["Msg"].ToString(), ViewState["Stk"].ToString());
            ErrorPanel.Visible = false;
        }
    }
}