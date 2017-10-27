using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

/// <summary>
///     Summary description for BasePage
/// </summary>
public class BasePage : Page
{
    public static DataTable dataLangTable = new DataTable();

    public void Notify(string message, string type, string focusOn)
    {
        ScriptManager.RegisterStartupScript(Page, GetType(), UniqueID,
            "Notify('" + message + "','" + type + "','" + focusOn + "')", true);
    }

    public void Notify(string message, string type)
    {
        ScriptManager.RegisterStartupScript(Page, GetType(), UniqueID, "Notify('" + message + "','" + type + "')", true);
    }

    public static bool IsZero(DropDownList drp)
    {
        if (drp.SelectedIndex == 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public static bool IsNull(Control txt)
    {
        if (txt is TextBox)
        {
            if (string.IsNullOrEmpty(((TextBox)txt).Text.Trim()))
            {
                return true;
            }
        }
        if (txt is HtmlInputText)
        {
            if (string.IsNullOrEmpty(((HtmlInputText)txt).Value.Trim()))
            {
                return true;
            }
        }
        return false;
    }

    public static string Text(Control txt)
    {
        if (txt is TextBox)
        {
            return ((TextBox)txt).Text.Trim();
        }

        return ((HtmlInputText)txt).Value.Trim();
    }

    public static string TextLower(Control txt)
    {
        if (txt is TextBox)
        {
            return ((TextBox)txt).Text.Trim().ToLower();
        }

        return ((HtmlInputText)txt).Value.Trim().ToLower();
    }

    public static bool IsEmpty(string txt)
    {
        if (string.IsNullOrEmpty(txt))
        {
            return true;
        }
        return false;
    }



    public static void AddDefaultItemOnZeroIndex(DropDownList drp)
    {
        drp.Items.Insert(0,
            GetCurrentPageName().ToLower().Trim() == "login.aspx"
                ? new ListItem("-- Select Here --", "-1")
                : new ListItem(Get("SelctHere"), "-1"));
    }

    public static void AddItem(DropDownList drp, int index, string text, string value)
    {
        drp.Items.Insert(index, new ListItem(text, value));
    }

    public static void SelectItemByValue(DropDownList Drp, string value)
    {
        Drp.SelectedIndex = Drp.Items.IndexOf(Drp.Items.FindByValue(value));
    }

    public static void SelectItemByText(DropDownList Drp, string text)
    {
        Drp.SelectedIndex = Drp.Items.IndexOf(Drp.Items.FindByText(text));
    }

    public static string Get(string abbreviation)
    {
        return dataLangTable.Select("Master = '" + abbreviation + "'")[0][1].ToString().Trim();
    }





    public static string GetCurrentPageName()
    {
        var sPath = HttpContext.Current.Request.Url.AbsolutePath;
        var oInfo = new FileInfo(sPath);
        var sRet = oInfo.Name;
        return sRet;
    }

    public void GoToException()
    {
        ScriptManager.RegisterStartupScript(Page, GetType(), UniqueID, "GoToException()", true);
    }

    protected override void OnError(EventArgs e)
    {
        GoToException();
        base.OnError(e);
        var ex = Server.GetLastError().GetBaseException();

        if (Session["BSD"] == null)
        {
            var query =
                "INSERT INTO [dbo].[Error_Log]([ErrorMesg],[ErrorStackTrace],[ErrorDateTime],[UserID],[UserPrefx],[User_Do_ID],URL) VALUES(@message,@stackTrace,getdate(),NULL,NULL,NULL,@url)";
            Snippets.SetData(query, new[]
            {
                new SqlParameter("message", ex.Message),
                new SqlParameter("stackTrace", ex.StackTrace),
                new SqlParameter("url", HttpContext.Current.Request.Url.AbsoluteUri)
            });
        }
        else
        {
            var query =
                "INSERT INTO [dbo].[Error_Log]([ErrorMesg],[ErrorStackTrace],[ErrorDateTime],[UserID],[UserPrefx],[User_Do_ID],URL) VALUES (@message,@stackTrace,getdate(),@userID,@prefix,@doID,@url)";
            Snippets.SetData(query, new[]
            {
                new SqlParameter("message", ex.Message),
                new SqlParameter("stackTrace", ex.StackTrace),
                new SqlParameter("@userID", Snippets.GetSession("UserID")),
                new SqlParameter("@prefix", Snippets.GetSession("UserPrefix")),
                new SqlParameter("@doID", Snippets.GetSession("DoID")),
                new SqlParameter("url", HttpContext.Current.Request.Url.AbsoluteUri)
            });
        }

        GoToException();
    }

    protected override void InitializeCulture()
    {
        if (GetCurrentPageName().ToLower().Trim() != "login.aspx")
        {
            if (Session["BSD"] != null)
            {

                dataLangTable = Snippets.GetData("sp_getUserLang_showData",
                    new[]
                    {
                    new SqlParameter("@do_id", Snippets.GetSession("DoID")),
                    new SqlParameter("@user_id", Snippets.GetSession("UserID"))
                    }, true);

                Session["userLangData"] = dataLangTable;
            }

            if (Session["BSD"] != null && Snippets.GetSession("UserPrefix").Trim().ToLower() != "vend_admin")
            {
                if (GetCurrentPageName().ToLower().Trim() != "roadmap.aspx")
                {
                    if (GetCurrentPageName().ToLower().Trim() != "notallowed.aspx")
                    {
                        if (GetCurrentPageName().ToLower().Trim() != "licenseregistration.aspx")
                            if (Session["BSD"] != null)
                            {
                                #region Coding for Non-Premium user

                                if (bool.Parse(Snippets.GetSession("IsPremiumUser")) != true)

                                {
                                    // Check for road map

                                    if (GetCurrentPageName().ToLower().Trim() == "report.aspx")
                                    {
                                        if (Request.QueryString.Count > 0)
                                        {
                                            if (Request.QueryString["Report"] != null)
                                            {
                                                var pageUrl = GetCurrentPageName() + "?Report=" +
                                                              Request.QueryString["Report"].Trim();

                                                var rowsCount = Snippets.GetData("CheckPermissionReportsPage", new[]
                                                {
                                                    new SqlParameter("@userid",Snippets.GetSession("UserID")),
                                                    new SqlParameter("@pid", Snippets.GetSession("ProjectID")),
                                                    new SqlParameter("@pgname", pageUrl),
                                                    new SqlParameter("@doid", Snippets.GetSession("DoID"))
                                                }, true).Rows.Count;

                                                if (rowsCount == 0)
                                                {
                                                    Response.Redirect("NotAllowed.aspx");
                                                }
                                            }
                                        }
                                    }
                                    else
                                    {
                                        // Check for others
                                        var rowsCount = Snippets.GetData("CheckPermissionReportsPage", new[]
                                        {
                                            new SqlParameter("@userid", Snippets.GetSession("UserID")),
                                            new SqlParameter("@pid", Snippets.GetSession("ProjectID")),
                                            new SqlParameter("@pgname", GetCurrentPageName()),
                                            new SqlParameter("@doid", Snippets.GetSession("DoID"))
                                        }, true).Rows.Count;

                                        if (rowsCount == 0)
                                        {
                                            Response.Redirect("NotAllowed.aspx");
                                        }
                                    }
                                }
                                #endregion

                                #region Coding for Premium user

                                else
                                {
                                    var rowsCount =
                                        Snippets.GetData(
                                            "SELECT user_active from user_master WHERE user_user_id = @userid AND user_do_id = @doid and user_active = 1 and IsPremiumUser = 1",
                                            new[]
                                            {
                                                new SqlParameter("@userid", Snippets.GetSession("UserID")),
                                                new SqlParameter("@doid", Snippets.GetSession("DoID"))
                                            }).Rows.Count;

                                    if (rowsCount == 0)
                                    {
                                        Response.Redirect("NotAllowed.aspx");
                                    }
                                }

                                #endregion
                            }
                    }
                }
            }
        }

    }

    #region This coding will separate the headers from tbody to thead and tfoot inside gridview // Emad // 12-July-17

    private void GetControlList<T>(ControlCollection controlCollection, List<T> resultCollection) where T : Control
    {
        foreach (Control control in controlCollection)
        {
            var item = control as T;
            if (item != null)
                resultCollection.Add(item);

            if (control.HasControls())
                GetControlList(control.Controls, resultCollection);
        }
    }

    protected override void OnPreRender(EventArgs e)
    {
        var allControls = new List<GridView>();
        GetControlList(Page.Controls, allControls);
        foreach (var childControl in allControls)
        {
            if ((childControl.ShowHeader && childControl.Rows.Count > 0) || childControl.ShowHeaderWhenEmpty)
            {
                childControl.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            if (childControl.ShowFooter && childControl.Rows.Count > 0)
            {
                childControl.FooterRow.TableSection = TableRowSection.TableFooter;
            }
            childControl.AutoGenerateColumns = false;
            childControl.PagerStyle.CssClass = "custompaging";
            childControl.PagerStyle.HorizontalAlign = HorizontalAlign.Center;
            childControl.AllowPaging = true;
            childControl.FooterStyle.CssClass = "panel-heading";
            childControl.EmptyDataText = Get("NoRecFound");
            childControl.ShowHeaderWhenEmpty = true;
        }
        base.OnPreRender(e);
    }

    #endregion
}