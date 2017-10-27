using System;

namespace BSD
{
    public partial class ActivitiesByPhases : BasePage
    {
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
        public string screen = "ActivitiesByPhases";
        public void ChangeTitle()
        {
            IsHandOverCheckListItem.Text = Get("IsHandoverChecklistItem");
            RequireInspection.Text = Get("RequireInspection");
            RequireCertification.Text = Get("RequireCertification");
            ButtonSubmit.Text = Get("SUBMIT");
            ButtonClear.Text = Get("Clear");
            SearchBox.Attributes.Add("placeholder", Get("SearchHere"));
            ButtonSearch.Text = Get("Search");
            ReportError.Text = Get("RptErr");
        }

        protected void ReportError_OnClick(object sender, EventArgs e)
        {
            Snippets.ReportError(ViewState["Msg"].ToString(), ViewState["Stk"].ToString());
            ErrorPanel.Visible = false;
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

        protected void ConstructionSubCategoryTypeDpd_OnSelectedIndexChanged(object sender, EventArgs e)
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

        protected void BillSequenceDpd_OnSelectedIndexChanged(object sender, EventArgs e)
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

        protected void ConstructionPhaseDpd_OnSelectedIndexChanged(object sender, EventArgs e)
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
                RequireCertification.Checked = false;
                RequireInspection.Checked = false;
                IsHandOverCheckListItem.Checked = false;
                ActivitySequenceBox.Text = string.Empty;
                ActivityDescriptionBox.Text = string.Empty;
                ActivityCodeBox.Text = string.Empty;
                if (ConstructionPhaseDpd.Items.Count > 0)
                {
                    ConstructionPhaseDpd.SelectedIndex = 0; 
                }
                if (BillSequenceDpd.Items.Count > 0)
                {
                    BillSequenceDpd.SelectedIndex = 0; 
                }
                if (ConstructionSubCategoryTypeDpd.Items.Count > 0)
                {
                    ConstructionSubCategoryTypeDpd.SelectedIndex = 0; 
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
    }
}