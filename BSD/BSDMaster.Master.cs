using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BSD
{
    public partial class BSDMaster : MasterPage
    {
        public static DataTable dataLangTable = new DataTable();
        private DataView contactDV;
        private DataSet contactsDS = new DataSet();

        public static string Get(string abbreviation)
        {
            return dataLangTable.Select("Master = '" + abbreviation + "'")[0][1].ToString().Trim();
        }

        public static string GetSession(string name)
        {
            var x = HttpContext.Current.Session["BSD"] as DataTable;
            return (HttpContext.Current.Session["BSD"] as DataTable).Select("SessionName = '" + name + "'")[0][1].ToString().Trim();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    dataLangTable = (DataTable)Session["userLangData"];
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        private DataSet BindContacts()
        {
            contactsDS = Snippets.GetDataSet("GenerateContactsList", new[]
            {
                new SqlParameter("@doID",GetSession("DoID")),
                new SqlParameter("@search", SearchContactBox.Value)
            }, true);

            contactsDS.Tables[0].TableName = "ContactsHeader";
            contactsDS.Tables[1].TableName = "ContactsDetail";
            return contactsDS;
        }

        private DataView BindContactDetails(string filter)
        {
            var whereClause = $"contact_id = {filter}";
            var dv = new DataView(contactsDS.Tables["ContactsDetail"], whereClause, "", DataViewRowState.CurrentRows);
            return dv;
        }

        protected void DownloadMasterFile(object sender, EventArgs e)
        {
            try
            {
                var filePath = (sender as LinkButton).CommandArgument;
                Response.ContentType = Page.ContentType;
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.WriteFile(filePath);
                Response.End();
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void ExitBSD_OnClick(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void ContactMaster_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var category = ((HiddenField)e.Item.FindControl("ID")).Value;
                var rep = (Repeater)e.Item.FindControl("ContactDetails");
                contactDV = BindContactDetails(category);
                rep.DataSource = contactDV;
                rep.DataBind();
            }
        }

        protected void SearchCont_OnClick(object sender, EventArgs e)
        {
            try
            {
                ContactMaster.DataSource = BindContacts();
                ContactMaster.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}