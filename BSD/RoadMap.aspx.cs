using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace BSD
{
    public partial class RoadMap : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Title = "Road Map";

            if (Session["BSD"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (Request.QueryString.Count > 0)
            {
                var option = Request.QueryString["Option"];
                var page = Request.QueryString["RPage"];
                var rV = Request.QueryString["RV"];

                if (string.IsNullOrEmpty(page))
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), UniqueID,
                        "OpenModalWithOptions_X('" + option + "');", true);
                    return;
                }

                if (!string.IsNullOrEmpty(rV))
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), UniqueID,
                        "OpenModalWithOptions(" + option + ",'" + page +
                        "');$('#ListView').show();$('#ThumbView').hide(); $('#lView').css('color', 'yellow'); $('#TView').css('color', 'white');",
                        true);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), UniqueID,
                        "OpenModalWithOptions(" + option + ",'" + page + "');", true);
                }

                string[] bProfile = {"D", "B", "CO", "CN", "S", "BI", "PC", "QS", "FI", "BO", "BS"};
                foreach (var x in bProfile)
                {
                    if (x.Equals(page))
                    {
                        bsdMap.Text = "&nbsp;&nbsp;||&nbsp;&nbsp;" +
                                      dataLangTable.Select("Master = 'BusinessProfile'")[0][1];
                    }
                }


                string[] miscPara = {"BSC", "GR"};
                foreach (var x in miscPara)
                {
                    if (x.Equals(page))
                    {
                        bsdMap.Text = "&nbsp;&nbsp;||&nbsp;&nbsp;" + dataLangTable.Select("Master = 'MiscParam'")[0][1];
                    }
                }
                string[] mngQLinks = {"AT", "STND"};
                foreach (var x in mngQLinks)
                {
                    if (x.Equals(page))
                    {
                        bsdMap.Text = "&nbsp;&nbsp;||&nbsp;&nbsp;" +
                                      dataLangTable.Select("Master = 'mngQuickLinks'")[0][1];
                    }
                }

                string[] sysAccsManag = {"MSUG", "MGTF"};
                foreach (var x in sysAccsManag)
                {
                    if (x.Equals(page))
                    {
                        bsdMap.Text = "&nbsp;&nbsp;||&nbsp;&nbsp; " +
                                      dataLangTable.Select("Master = 'SysAccManag'")[0][1];
                    }
                }
            }

            if (!IsPostBack)
            {
                try
                {
                    var query =
                        "DECLARE @ID BIT; SELECT @ID = availPDL FROM bsd_licensee_information  WITH (NOLOCK) where id = " +
                        Snippets.GetSession("DoID") + "; IF @ID = 1 BEGIN SELECT '1' END ELSE BEGIN SELECT '2' END";

                    using (var dt = Snippets.GetData(query))
                    {
                        if (dt.Rows[0][0].ToString() == "2")
                        {
                            PDailL.HRef = "javascript:void(0);";
                            PDailL.Attributes.Add("class", "disabledAnc");
                            PDailL.Attributes.Add("title", "NOT PURCHASED");
                        }
                    }

                    if (bool.Parse(Snippets.GetSession("IsPremiumUser").ToString()) != true)
                    {
                        if (Snippets.GetSession("ProjectID")!= null)
                        {
                            var cquery =
                            @"select functionURL AS URL  from sys_functions WITH (NOLOCK) WHERE functionURL NOT IN (SELECT DISTINCT TOP (100) PERCENT dbo.sys_functions.functionURL AS URL FROM dbo.sys_functions WITH (NOLOCK) INNER JOIN
                            dbo.MapGrpsToSysFunctions WITH (NOLOCK)  ON dbo.sys_functions.sys_func_id = dbo.MapGrpsToSysFunctions.SysFunct_ID INNER JOIN
                            dbo.MapGrpsToSysFunctions_ByUser WITH (NOLOCK)  ON dbo.MapGrpsToSysFunctions.Do_ID = dbo.MapGrpsToSysFunctions_ByUser.DoID AND 
                            dbo.MapGrpsToSysFunctions.ProjID = dbo.MapGrpsToSysFunctions_ByUser.PrjID AND dbo.MapGrpsToSysFunctions.Grp_Usr_ID = dbo.MapGrpsToSysFunctions_ByUser.GrpID WHERE (dbo.MapGrpsToSysFunctions_ByUser.UsrID = @UID) AND 
                            (dbo.MapGrpsToSysFunctions_ByUser.IsDell IS  NULL) AND (dbo.MapGrpsToSysFunctions_ByUser.PrjID = @PID) AND MapGrpsToSysFunctions_ByUser.doID = @doID and dbo.sys_functions.functionURL is not null)";

                            var allControls = new List<HtmlAnchor>();
                            GetControlList(Page.Controls, allControls);


                            using (var dt = Snippets.GetData(cquery, new[]
                            {
                                new SqlParameter("@UID", Snippets.GetSession("UserID").ToString()),
                                new SqlParameter("@PID", Snippets.GetSession("ProjectID").ToString()),
                                new SqlParameter("@doID", Snippets.GetSession("DoID").ToString())
                            }))
                            {
                                foreach (var childControl in allControls)
                                {
                                    if (childControl.HRef.ToLower().Contains(".aspx"))
                                    {
                                        if (childControl.HRef.Contains("Report.aspx"))
                                        {
                                            var x = childControl.HRef.ToLower().Trim();

                                            if (x.ToLower().Contains("&r"))
                                            {
                                                x = x.Substring(0, x.IndexOf("&r", StringComparison.Ordinal));
                                            }

                                            var sExpression = "URL = '" + x + "'";
                                            DataRow[] drFound;
                                            drFound = dt.Select(sExpression);

                                            foreach (var dr in drFound)
                                            {
                                                childControl.HRef = "javascript:void(0);";
                                                childControl.Attributes.Add("class", "disabledAnc");
                                            }
                                        }
                                        else
                                        {
                                            var x = childControl.HRef.ToLower().Trim();
                                            var sExpression = "URL = '" + x + "'";
                                            var drFound = dt.Select(sExpression);

                                            foreach (var dr in drFound)
                                            {
                                                childControl.HRef = "javascript:void(0);";
                                                childControl.Attributes.Add("class", "disabledAnc");
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        else
                        {
                            var cquery =
                                @"SELECT DISTINCT TOP (100) PERCENT dbo.sys_functions.functionURL AS URL FROM   dbo.sys_functions WITH (NOLOCK) INNER JOIN
                         dbo.MapGrpsToSysFunctions WITH (NOLOCK)  ON dbo.sys_functions.sys_func_id = dbo.MapGrpsToSysFunctions.SysFunct_ID INNER JOIN
                         dbo.MapGrpsToSysFunctions_ByUser WITH (NOLOCK)  ON dbo.MapGrpsToSysFunctions.Do_ID = dbo.MapGrpsToSysFunctions_ByUser.DoID AND 
                         dbo.MapGrpsToSysFunctions.ProjID = dbo.MapGrpsToSysFunctions_ByUser.PrjID AND dbo.MapGrpsToSysFunctions.Grp_Usr_ID = dbo.MapGrpsToSysFunctions_ByUser.GrpID WHERE (dbo.MapGrpsToSysFunctions_ByUser.UsrID = @UID) AND 
                        (dbo.MapGrpsToSysFunctions_ByUser.IsDell IS NULL) AND MapGrpsToSysFunctions_ByUser.doID = @doID  and dbo.sys_functions.functionURL is not null ORDER BY dbo.sys_functions.functionURL";

                            var allControls = new List<HtmlAnchor>();
                            GetControlList(Page.Controls, allControls);


                            using (var dt = Snippets.GetData(cquery, new[]
                            {
                                new SqlParameter("@UID", Snippets.GetSession("UserID").ToString()),
                                new SqlParameter("@doID", Snippets.GetSession("DoID").ToString())
                            }))
                            {
                                foreach (var childControl in allControls)
                                {
                                    if (childControl.HRef.ToLower().Contains(".aspx"))
                                    {
                                        var x = childControl.HRef.ToLower().Trim();
                                        var sExpression = "URL = '" + x + "'";
                                        var drFound = dt.Select(sExpression);

                                        foreach (var dr in drFound)
                                        {
                                            childControl.HRef = "javascript:void(0);";
                                            childControl.Attributes.Add("class", "disabledAnc");
                                        }
                                    }
                                }
                            }
                        }

                        LPr.HRef = "javascript:void(0);";
                        LPr.Attributes.Add("class", "disabledAnc");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message + " " + ex.StackTrace);
                }
            }
        }

        private void GetControlList<T>(ControlCollection controlCollection, List<T> resultCollection) where T : Control
        {
            foreach (Control control in controlCollection)
            {
                if (control is T)
                    resultCollection.Add((T) control);

                if (control.HasControls())
                    GetControlList(control.Controls, resultCollection);
            }
        }
    }
}