using System;
using System.Collections;
using System.Web.UI;
using System.Xml;

namespace BSD
{
    public partial class Test : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var doc = new XmlDocument();
                doc.Load(Server.MapPath("~/App_Data/EmailTemplates.xml"));
                var root = doc.DocumentElement;
                var nodes = root.SelectNodes("//Email/English/ForgotPasswordChangedSuccess");
                ArrayList ar = new ArrayList();
                foreach (XmlNode node in nodes)
                {
                    ar.Add("The subject is: " + node["Subject"].InnerText.ToString());
                    ar.Add("The subject is: " + node["Message"].InnerText.ToString());
                }
                Response.Write(ar[0] + "    " + ar[1]);
            }
        }
    }
}