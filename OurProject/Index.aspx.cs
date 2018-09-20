using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;

public partial class Index : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    static string userName;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            userName = Request["userName"];
            lb_userName.Text = userName;

        }
        catch
        {
            userName = null;
        }
        if (!IsPostBack)
        {
            
            string sqls = "SELECT * FROM [dbo].[HOUSE] WHERE state = 0";
            dt = DB.ExecuteQuery(sqls);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string sqls_houster = "SELECT userName FROM [dbo].[USERS] WHERE userId = " + dt.Rows[i]["userId"].ToString();
                Label lb_Houster = (Label)this.Repeater1.Items[i].FindControl("lb_Hoster");
                lb_Houster.Text = DB.ExecuteQuery(sqls_houster).Rows[0]["userName"].ToString();
            }

        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        bool xian = Xian.Checked;
        bool chengdu = Chengdu.Checked;
        bool chongqing = Chongqing.Checked;
        float Price1 = 0, Price2 = 1000000;
        try
        {
            Price1 = float.Parse(fromPrice.Text);
            Price2 = float.Parse(toPrice.Text);
        }
        catch
        {

        }

        dt = null;
        if (xian)
        {
            string sqls = "SELECT * FROM [dbo].[HOUSE] WHERE state = 0 and City = 'xian' and Price >= " + Price1 + " and Price <= " + Price2;
            DataTable dt1 = DB.ExecuteQuery(sqls);

            if (dt1 != null)
            {
                if (dt == null)
                {
                    dt = dt1.Clone();
                }
                foreach (DataRow dr in dt1.Rows)
                {
                    object[] obj = new object[dt1.Columns.Count];
                    dr.ItemArray.CopyTo(obj, 0);
                    dt.Rows.Add(obj);
                }
            }
        }
        if (chengdu)
        {
            string sqls = "SELECT * FROM [dbo].[HOUSE] WHERE state = 0 and City = 'chengdu'and Price >= " + Price1 + " and Price <= " + Price2; ;
            DataTable dt1 = DB.ExecuteQuery(sqls);
            if (dt1 != null)
            {
                if (dt == null)
                {
                    dt = dt1.Clone();
                }
                foreach (DataRow dr in dt1.Rows)
                {
                    object[] obj = new object[dt1.Columns.Count];
                    dr.ItemArray.CopyTo(obj, 0);
                    dt.Rows.Add(obj);
                }
            }
        }
        if (chongqing)
        {
            string sqls = "SELECT * FROM [dbo].[HOUSE] WHERE state = 0 and City = 'chongqing' and Price >= " + Price1 + " and Price <= " + Price2;
            DataTable dt1 = DB.ExecuteQuery(sqls);
            if (dt1 != null)
            {
                if (dt == null)
                {
                    dt = dt1.Clone();
                }
                foreach (DataRow dr in dt1.Rows)
                {
                    object[] obj = new object[dt1.Columns.Count];
                    dr.ItemArray.CopyTo(obj, 0);
                    dt.Rows.Add(obj);
                }
            }
        }
        if (!(xian || chengdu || chongqing))
        {
            string sqls = "SELECT * FROM [dbo].[HOUSE] WHERE state = 0 and Price >= " + Price1 + " and Price <= " + Price2;
            DataTable dt1 = DB.ExecuteQuery(sqls);
            if (dt1 != null)
            {
                if (dt == null)
                {
                    dt = dt1.Clone();
                }
                foreach (DataRow dr in dt1.Rows)
                {
                    object[] obj = new object[dt1.Columns.Count];
                    dr.ItemArray.CopyTo(obj, 0);
                    dt.Rows.Add(obj);
                }
            }
        }


        Repeater1.DataSource = dt;
        Repeater1.DataBind();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string sqls_houster = "SELECT userName FROM [dbo].[USERS] WHERE userId = " + dt.Rows[i]["userId"].ToString();
            Label lb_Houster = (Label)this.Repeater1.Items[i].FindControl("lb_Hoster");
            lb_Houster.Text = DB.ExecuteQuery(sqls_houster).Rows[0]["userName"].ToString();
        }

    }

    protected void Login_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
    protected void Signup_Click(object sender, EventArgs e)
    {
        Response.Redirect("Signup.aspx");
    }
    protected void Mainpg_Click(object sender, EventArgs e)
    {
        if(userName!=null)
           Response.Redirect("PersonalInfo.aspx?userName="+userName);
    }
    protected void Logout_Click(object sender, EventArgs e)
    {
        Response.Redirect("Index.aspx");

    }
}