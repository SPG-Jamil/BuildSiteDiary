﻿using System;

namespace BSD
{
    public partial class FinancialInstitution : BasePage
    {
        public string screen = "FinancialInstitution";

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
                    ChangeTilte();
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

        public void ChangeTilte()
        {
            ButtonSubmit.Text = Get("SUBMIT");
            ButtonClear.Text = Get("Clear");
            SubmitButton.Text = Get("SUBMIT");
            ClearButton.Text = Get("Clear");
            SearchBox.Attributes.Add("Placeholder", Get("SearchHere"));
            SearchButton.Text = Get("Search");
            ReportError.Text = Get("RptErr");
        }

        protected void SubmitButton_OnClick(object sender, EventArgs e)
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

        protected void ClearButton_OnClick(object sender, EventArgs e)
        {
            try
            {
                CommentsBoxDBC.Text = string.Empty;
                EmailDBC.Text = string.Empty;
                PhoneDBC.Text = string.Empty;
                MobileDBC.Text = string.Empty;
                NameDBC.Text = string.Empty;
                BusinessTradingAsDBC.Text = string.Empty;
                BusinessNameDBC.Text = string.Empty;
                if (SelectFinancialInstitution.Items.Count > 0)
                {
                    SelectFinancialInstitution.SelectedIndex = 0;
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

        protected void GstAppDpd_OnSelectedIndexChanged(object sender, EventArgs e)
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

        protected void CountryBox_OnSelectedIndexChanged(object sender, EventArgs e)
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
                if (CountryBox.Items.Count > 0)
                {
                    CountryBox.SelectedIndex = 0;
                }
                PostalCodeBox.Text = string.Empty;
                StateBox.Text = string.Empty;
                CityOrSubarbanAddressBox.Text = string.Empty;
                StreetNameBox.Text = string.Empty;
                StreetNumBox.Text = string.Empty;
                WebAddressBox.Text = string.Empty;
                EmailBox.Text = string.Empty;
                FaxNumBox.Text = string.Empty;
                PhoneNumBox.Text = string.Empty;
                GstPercentageBox.Text = string.Empty;
                GstRegBox.Text = string.Empty;
                if (GstAppDpd.Items.Count > 0)
                {
                    GstAppDpd.SelectedIndex = 0;
                }
                AcnBox.Text = string.Empty;
                AbnBox.Text = string.Empty;
                BusinessTradingAsBox.Text = string.Empty;
                BusinessNameBox.Text = string.Empty;
                FinancialInstitutionStatusBox.Text = string.Empty;
            }
            catch (Exception exception)
            {
                ErrorDescription.Text = exception.Message;
                ErrorPanel.Visible = true;
                ViewState["Msg"] = exception.Message;
                ViewState["Stk"] = exception.StackTrace;
            }
        }

        protected void SelectFinancialInstitution_OnSelectedIndexChanged(object sender, EventArgs e)
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