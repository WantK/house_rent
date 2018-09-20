using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;
using System.Text;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["userName"] != null)
            { 
                string userName = Request["userName"];
                string LoginPwd = Request["pwd"];
                string Address = Request["address"];
                string phone = Request["tel"];
                string email = Request["email"];
                int n = DB.ExecuteUpdate("INSERT INTO [dbo].[USERS] (userName,LoginPwd,Address,Phone,email) VALUES('" + userName + "','" + LoginPwd + "','" + Address + "','" + phone + "','" + email + "')");
            }
        }
    }
    protected string GetMD5String(string str)
    {
        MD5 md5 = MD5.Create();
        byte[] data = Encoding.UTF8.GetBytes(str);
        byte[] data2 = md5.ComputeHash(data);

        return GetbyteToString(data2);
        //return BitConverter.ToString(data2).Replace("-", "").ToLower();
    }

    private string GetbyteToString(byte[] data)
    {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < data.Length; i++)
        {
            sb.Append(data[i].ToString("x2"));
        }
        return sb.ToString();
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        String str = "SELECT userId,userName,LoginPwd FROM [dbo].[USERS]";
        DataTable d1 = DB.ExecuteQuery(str);
        int i = 0;
        for (; i < d1.Rows.Count; i++)
        {
            if (d1.Rows[i]["userName"].ToString().Equals(txtUserName.Value))
            {
                if (d1.Rows[i]["loginPwd"].ToString().Equals(this.GetMD5String(txtUserPWD.Value)))
                {
                    string userName = d1.Rows[i]["userName"].ToString();
                    Response.Redirect("index.aspx?userName=" + userName);
                    break;
                }
                else
                {
                    Response.Write("<script>alert('密码不正确')</script>");
                    break;
                }
            }
        }
        if (i == d1.Rows.Count)
        {
            Response.Write("<script>alert('用户名不正确')</script>");
        }
    }
}