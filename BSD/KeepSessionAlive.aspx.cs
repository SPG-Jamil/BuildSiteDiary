using System;

namespace BSD
{
    public partial class KeepSessionAlive : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Add refresh header to refresh the page 60 seconds before session timeout
                Response.AddHeader("Refresh", Convert.ToString(Session.Timeout*60 - 60));
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}