using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;

public static class Snippets
{
    public static SqlConnection Connection =
        new SqlConnection(ConfigurationManager.ConnectionStrings["BSDConnectionString"].ConnectionString);

    public static bool DirectoryIsEmpty(string path)
    {
        try
        {
            var fileCount = Directory.GetFiles(path).Length;
            if (fileCount > 0)
            {
                return false;
            }
            return true;
        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }

    }

    public static void ReportError(string message, string stack)
    {

        try
        {
            var list = GetEmail("English", "ExceptionOccured");

            var emailMessage =
                list[1].ToString()
                    .Replace("@[", "<strong>")
                    .Replace("]@", "</strong>")
                    .Replace("[LB]", "<br/>")
                    .Replace("@Message", message)
                    .Replace("@Stack", stack)
                    .Replace("@Url", HttpContext.Current.Request.Url.AbsoluteUri)
                    .Replace("@Date", DateTime.Now.ToString());

            SendEmail(ConfigurationManager.AppSettings["ToEmail"], list[0].ToString(), emailMessage);
        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }
    }

    public static string GetSession(string name)
    {
        var x = (HttpContext.Current.Session["BSD"] as DataTable).Rows.Count;
        return (HttpContext.Current.Session["BSD"] as DataTable).Select("SessionName = '" + name + "'")[0][1].ToString().Trim();
    }


    public static string UpperCaseFirstCharacter(string text)
    {
        return Regex.Replace(text, "^[a-z]", m => m.Value.ToUpper());
    }

    public static string Decrypt(string cipherText)
    {

        try
        {
            var EncryptionKey = "MAKV2SPBNI99212";
            var cipherBytes = Convert.FromBase64String(cipherText);
            using (var encryptor = Aes.Create())
            {
                var pdb = new Rfc2898DeriveBytes(EncryptionKey,
                    new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (var ms = new MemoryStream())
                {
                    using (var cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }
    }

    #region Sending Data To Database

    public static int SetData(string commandText)
    {
        try
        {
            using (var cmd = new SqlCommand(commandText, Connection))
            {
                cmd.CommandType = CommandType.Text;
                Connection.Open();
                var result = cmd.ExecuteNonQuery();
                Connection.Close();
                return result;
            }
        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }
    }

    public static int SetData(string commandText, SqlParameter[] param)
    {
        try
        {
            using (var cmd = new SqlCommand(commandText, Connection))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddRange(param);
                Connection.Open();
                var result = cmd.ExecuteNonQuery();
                Connection.Close();
                return result;
            }
        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }
    }

    public static int SetData(string commandText, SqlParameter[] param, bool isStoredProcedure)
    {
        try
        {
            using (var cmd = new SqlCommand(commandText, Connection))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddRange(param);
                Connection.Open();
                var result = cmd.ExecuteNonQuery();
                Connection.Close();
                return result;
            }
        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }
    }

    public static int SetData(string commandText, bool isStoredProcedure)
    {
        try
        {
            using (var cmd = new SqlCommand(commandText, Connection))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                Connection.Open();
                var result = cmd.ExecuteNonQuery();
                Connection.Close();
                return result;
            }
        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }
    }

    #endregion

    #region Getting Data From Database

    public static DataTable GetData(string commandText)
    {
        try
        {
            using (var cmd = new SqlCommand(commandText, Connection))
            {
                Connection.Open();
                using (var da = new SqlDataAdapter(cmd))
                {
                    using (var dt = new DataTable())
                    {
                        da.Fill(dt);
                        Connection.Close();
                        return dt;
                    }
                }
            }
        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }
    }

    public static DataTable GetData(string commandText, SqlParameter[] param)
    {
        try
        {
            using (var cmd = new SqlCommand(commandText, Connection))
            {
                cmd.Parameters.AddRange(param);
                Connection.Open();
                using (var da = new SqlDataAdapter(cmd))
                {
                    using (var dt = new DataTable())
                    {
                        da.Fill(dt);
                        Connection.Close();
                        return dt;
                    }
                }
            }
        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }
    }

    public static DataTable GetData(string commandText, bool isStoredProcedure)
    {
        try
        {
            using (var cmd = new SqlCommand(commandText, Connection))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                Connection.Open();
                using (var da = new SqlDataAdapter(cmd))
                {
                    using (var dt = new DataTable())
                    {
                        da.Fill(dt);
                        Connection.Close();
                        return dt;
                    }
                }
            }
        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }
    }

    public static DataTable GetData(string commandText, SqlParameter[] param, bool isStoredProcedure)
    {
        try
        {
            using (var cmd = new SqlCommand(commandText, Connection))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddRange(param);
                Connection.Open();
                using (var da = new SqlDataAdapter(cmd))
                {
                    using (var dt = new DataTable())
                    {
                        da.Fill(dt);
                        Connection.Close();
                        return dt;
                    }
                }
            }
        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }
    }

    public static DataSet GetDataSet(string commandText, bool isStoredProcedure)
    {
        try
        {
            using (var cmd = new SqlCommand(commandText, Connection))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                Connection.Open();
                using (var da = new SqlDataAdapter(cmd))
                {
                    using (var ds = new DataSet())
                    {
                        da.Fill(ds);
                        Connection.Close();
                        return ds;
                    }
                }
            }
        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }
    }

    public static DataSet GetDataSet(string commandText, SqlParameter[] param)
    {
        try
        {
            using (var cmd = new SqlCommand(commandText, Connection))
            {
                cmd.Parameters.AddRange(param);
                Connection.Open();
                using (var da = new SqlDataAdapter(cmd))
                {
                    using (var ds = new DataSet())
                    {
                        da.Fill(ds);
                        Connection.Close();
                        return ds;
                    }
                }
            }
        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }
    }

    public static DataSet GetDataSet(string commandText, SqlParameter[] param, bool isStoredProcedure)
    {
        try
        {
            using (var cmd = new SqlCommand(commandText, Connection))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddRange(param);
                Connection.Open();
                using (var da = new SqlDataAdapter(cmd))
                {
                    using (var ds = new DataSet())
                    {
                        da.Fill(ds);
                        Connection.Close();
                        return ds;
                    }
                }
            }
        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }
    }

    #endregion

    #region Sending Email

    public static ArrayList GetEmail(string language, string whichNode)
    {

        try
        {
            var doc = new XmlDocument();
            doc.Load(HttpContext.Current.Server.MapPath("~/App_Data/EmailTemplates.xml"));
            var root = doc.DocumentElement;
            var nodes = root.SelectNodes("//Email/" + language + "/" + whichNode);
            var list = new ArrayList();

            foreach (XmlNode node in nodes)
            {
                list.Add(node["Subject"].InnerText.Trim().Replace("\r", string.Empty).Replace("\n", string.Empty));
                list.Add(node["Message"].InnerText.Trim().Replace("\r", string.Empty).Replace("\n", string.Empty));
            }
            return list;
        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }
    }

    public static string Query(string screenName, string whichNode)
    {

        try
        {
            var doc = new XmlDocument();
            doc.Load(HttpContext.Current.Server.MapPath("~/App_Data/DatabaseQueries.xml"));
            var root = doc.DocumentElement;
            var nodes = root.SelectNodes("//Queries/" + screenName);
            var list = new ArrayList();

            foreach (XmlNode node in nodes)
            {
                list.Add(node[whichNode].InnerText.Trim().Replace("\r", string.Empty).Replace("\n", string.Empty));
            }
            return list[0].ToString();
        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }
    }

    public static void SendEmail(string to, string subject, string message)
    {
        var mailMessage = new MailMessage();
        mailMessage.To.Add(to);
        mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["UserName"]);
        mailMessage.Body = message;
        mailMessage.Subject = subject;
        mailMessage.IsBodyHtml = true;
        try
        {
            var smtpClient = new SmtpClient(ConfigurationManager.AppSettings["Host"]);

            var networkCredential = new NetworkCredential
            {
                UserName = ConfigurationManager.AppSettings["UserName"],
                Password = ConfigurationManager.AppSettings["Password"]
            };

            smtpClient.Credentials = networkCredential;

            if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["Port"]))
            {
                smtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"]);
            }

            smtpClient.EnableSsl = true;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

            var email = new Thread(delegate () { smtpClient.Send(mailMessage); }) { IsBackground = true };

            email.Start();

        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }
    }

    public static void SendEmail(string to, string subject, string message, FileUpload postedFile)
    {
        var mailMessage = new MailMessage();
        mailMessage.To.Add(to);
        mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["UserName"]);
        mailMessage.Body = message;
        mailMessage.Subject = subject;
        mailMessage.IsBodyHtml = true;

        var fileName = Path.GetFileName(postedFile.FileName);
        mailMessage.Attachments.Add(new Attachment(postedFile.FileContent, fileName));

        try
        {
            var smtpClient = new SmtpClient(ConfigurationManager.AppSettings["Host"]);

            var networkCredential = new NetworkCredential
            {
                UserName = ConfigurationManager.AppSettings["UserName"],
                Password = ConfigurationManager.AppSettings["Password"]
            };

            smtpClient.Credentials = networkCredential;

            if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["Port"]))
            {
                smtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"]);
            }

            smtpClient.EnableSsl = true;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

            var email = new Thread(delegate () { smtpClient.Send(mailMessage); }) { IsBackground = true };

            email.Start();


        }
        catch (Exception)
        {
            Connection.Close();
            throw;
        }
    }

    #endregion


}