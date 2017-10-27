using System;

namespace BSD
{
    public partial class GSTRate : BasePage
    {
        public string screen = "GSTRate";

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
                    Title = screen;
                    ChangeTitle();
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

        protected void ReportError_OnClick(object sender, EventArgs e)
        {
            Snippets.ReportError(ViewState["Msg"].ToString(), ViewState["Stk"].ToString());
            ErrorPanel.Visible = true;
        }

        public void ChangeTitle()
        {
            ButtonSubmit.Text = Get("SUBMIT");
            ButtonClear.Text = Get("Clear");
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
                ImplementationDateBox.Text = string.Empty;
                GSTRatePercentageBox.Text = string.Empty;
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