using System;

namespace BSD
{
    public partial class BillingStages : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["BSD"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                ChangeTo();
            }
        }

        public string screen = "BillingStages";

        public void ChangeTo()
        {
            ButtonSubmit.Text = Get("SUBMIT");
            ButtonClear.Text = Get("Clear");
            SearchButton.Text = Get("Search");
            SearchBox.Attributes.Add("Placeholder", Get("SearchHere"));
            ReportError.Text = Get("RptErr");
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
                BillAmountBox.Text = string.Empty;
                BillDescriptionBox.Text = string.Empty;
                BillSequenceNumBox.Text = string.Empty;
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
    }
}