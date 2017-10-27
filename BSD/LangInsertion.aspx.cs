using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BSD
{
    public partial class LangInsertion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMyGrid(1);

            }
            err.Visible = suc.Visible = false;
        }

        protected void recGridView_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            recGridView.PageIndex = e.NewPageIndex;
            if (!String.IsNullOrEmpty(SearchBox.Text.Trim()))
            {
                BindMyGrid(2);
            }
            else
            {
                BindMyGrid(1);
            }

        }

        private void BindMyGrid(int option)
        {
            SqlCommand com = new SqlCommand();
            if (option == 1)
            {
                com.CommandText = "SELECT * FROM master_lang WHERE  is_del = 0  ORDER BY crtd_date DESC";
                DataTable dt = Snippets.GetData(com.CommandText);
                recGridView.DataSource = dt;
                recGridView.DataBind();
                //            hfound.Text = dataLangTable.Select("Master = 'Total'")[0][1].ToString() + ":  " +dt.Rows.Count;


            }

            else
            {
                com.CommandText = "SELECT * FROM master_lang WHERE is_del = 0 AND  master + english + german LIKE '%" + SearchBox.Text.Trim().Replace("'", "") + "%' ORDER BY crtd_date DESC";
                DataTable dt = Snippets.GetData(com.CommandText);
                recGridView.DataSource = dt;
                recGridView.DataBind();
                hfound.Text = dt.Rows.Count + " found";
            }
        }

        protected void SearchButton_OnClick(object sender, EventArgs e)
        {
            try
            {

                BindMyGrid(!string.IsNullOrEmpty(SearchBox.Text) ? 2 : 1);



            }
            catch (Exception excep)
            {

                err.Visible = true;
                ErrLabel.Text = excep.Message;
            }
        }

        protected void SubmitBtn_OnClick(object sender, EventArgs e)
        {

            try
            {
                if (masterLabel.Text != string.Empty && EngLabel.Text != string.Empty && GermanLabel.Text != string.Empty)
                {
                    SqlCommand com = new SqlCommand();
                    com.CommandText = "SELECT * FROM master_lang WHERE is_del = 0 AND master = '" + masterLabel.Text.Trim().Replace("'", "") + "' OR english = N'" + EngLabel.Text.Trim().Replace("'", "") + "' OR german = N'" + GermanLabel.Text.Trim().Replace("'", "") + "'";
                    DataTable dt = Snippets.GetData(com.CommandText);
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        err.Visible = true;
                        ErrLabel.Text = "This phrase already exist";
                        return;
                    }

                    string query = "INSERT INTO master_lang (master,english,german) VALUES ('" + masterLabel.Text.Trim() +
                                   "','" + EngLabel.Text.Trim() + "','" + GermanLabel.Text.Trim() + "')";
                  
                    Snippets.SetData(query);
                    BindMyGrid(1);
                    suc.Visible = true;
                    SucLabel.Text = "Record Inserted Successfully";
                    ScriptManager.RegisterStartupScript(Page, GetType(), UniqueID, "ClearTextBox()", true);
                }
            }
            catch (Exception excep)
            {

                err.Visible = true;
                ErrLabel.Text = excep.Message;
            }
        }

        protected void ClearBtn_OnClick(object sender, EventArgs e)
        {
            BindMyGrid(1);
        }

        protected void recGridView_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState == DataControlRowState.Normal)
            {
                if (!string.IsNullOrEmpty(SearchBox.Text.Trim()))
                {
                    Label a = (Label)e.Row.FindControl("mlabl");
                    Label b = (Label)e.Row.FindControl("englabl");
                    Label c = (Label)e.Row.FindControl("germlabl");

                    a.Text = Regex.Replace(a.Text, SearchBox.Text.Trim(), delegate (Match match)
                    {
                        return string.Format("<span style = 'background-color:yellow;font-weight: bold;'>{0}</span>", match.Value);
                    }
                     , RegexOptions.IgnoreCase);

                    b.Text = Regex.Replace(b.Text, SearchBox.Text.Trim(), delegate (Match match)
                    {
                        return string.Format("<span style = 'background-color:yellow;font-weight: bold;'>{0}</span>", match.Value);
                    }
                   , RegexOptions.IgnoreCase);

                    c.Text = Regex.Replace(c.Text, SearchBox.Text.Trim(), delegate (Match match)
                    {
                        return string.Format("<span style = 'background-color:yellow;font-weight: bold;'>{0}</span>", match.Value);
                    }
                   , RegexOptions.IgnoreCase);
                }
            }
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != recGridView.EditIndex)
            {
                (e.Row.Cells[0].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                recGridView.EditIndex = e.NewEditIndex;
                BindMyGrid(!string.IsNullOrEmpty(SearchBox.Text) ? 2 : 1);
            }
            catch (Exception excep)
            {

                err.Visible = true;
                ErrLabel.Text = excep.Message;
            }


        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            try
            {
                string mID = recGridView.DataKeys[e.RowIndex].Values[0].ToString();
                string mastLabel = ((TextBox)recGridView.Rows[e.RowIndex].FindControl("mlabl_EDIT")).Text;
                string english = ((TextBox)recGridView.Rows[e.RowIndex].FindControl("englabl_EDIT")).Text;
                string german = ((TextBox)recGridView.Rows[e.RowIndex].FindControl("germlabl_EDIT")).Text;

                string query = "UPDATE master_lang SET master = '" + mastLabel + "' , english = '" + english + "' , german = '" + german + "' WHERE master = '" + mID + "' ";
            
                Snippets.SetData(query);


                recGridView.EditIndex = -1;
                BindMyGrid(!string.IsNullOrEmpty(SearchBox.Text) ? 2 : 1);
            }
            catch (Exception excep)
            {

                err.Visible = true;
                ErrLabel.Text = excep.Message;
            }
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            recGridView.EditIndex = -1;
            BindMyGrid(!string.IsNullOrEmpty(SearchBox.Text) ? 2 : 1);
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string mID = recGridView.DataKeys[e.RowIndex].Values[0].ToString();
                string query = "UPDATE master_lang SET is_del = 1 , del_date_tim = getdate() WHERE  master = '" + mID + "'";
                       Snippets.SetData(query);
                BindMyGrid(!string.IsNullOrEmpty(SearchBox.Text) ? 2 : 1);
            }
            catch (Exception excep)
            {

                err.Visible = true;
                ErrLabel.Text = excep.Message;
            }
        }
    }
}