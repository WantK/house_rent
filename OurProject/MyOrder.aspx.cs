using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class MyOrder : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    static string userName;
    protected void Page_Load(object sender, EventArgs e)
    {
        string userId;
        userName = Request["userName"];
        if (!IsPostBack)
        {
            DataTable dt1 = DB.ExecuteQuery("SELECT * FROM [dbo].[USERS] WHERE userName = '" + userName + "'");
            username.Text = userName;
            phone.Text = "Phone:" + dt1.Rows[0]["Phone"].ToString();
            userId = dt1.Rows[0]["userId"].ToString();

            dt = DB.ExecuteQuery("SELECT * FROM [dbo].[ORDER] WHERE userId = " + userId);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

            for (int i = 0; i < dt.Rows.Count; i++)   //数据转换
            {
                string houseId = dt.Rows[i]["houseId"].ToString();
                DataTable dt2 = DB.ExecuteQuery("SELECT Price from [dbo].[HOUSE] where houseId = " + houseId);
                Label lb_Price = (Label)this.Repeater1.Items[i].FindControl("lb_Price");
                lb_Price.Text = dt2.Rows[0]["Price"].ToString();
            }
        }
       
    }
    protected void MyMainpg_Click(object sender, EventArgs e)
    {
        Response.Redirect("PersonalInfo.aspx?userName=" + userName);
    }
}