using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class PersonalInfo : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    static string userName;
    protected void Page_Load(object sender, EventArgs e)
    {

        userName = Request["userName"];
        if (!IsPostBack)
        {
            DataTable dt1 = DB.ExecuteQuery("SELECT * FROM [dbo].[USERS] WHERE userName = '" + userName +"'");
            username.Text = userName;
            phone.Text = "Phone:" + dt1.Rows[0]["Phone"].ToString();

            string userId = dt1.Rows[0]["userId"].ToString();
            string sqls = "SELECT * FROM [dbo].[HOUSE] WHERE userId = "+userId;
            dt = DB.ExecuteQuery(sqls);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

            try
            {
                string s = Request["action"].ToString();
                string startTime = Request["startTime"].ToString();
                string endTime = Request["endTime"].ToString();
                string houseId = Request["txtHomeId"].ToString();
                string homeOwner = Request["txtHomeOwner"].ToString();
                string sss = "SELECT userId FROM [dbo].[USERS] WHERE userName ='" + userName + "'";
                DataTable dt2 = DB.ExecuteQuery(sss);
                string userId1 = dt2.Rows[0]["userId"].ToString();
                string sqls1 = "INSERT INTO [dbo].[ORDER] (houseId,userId,startTime,endTime) VALUES (" + houseId + "," + userId1 + ",'" + startTime + "','" + endTime + "')";
                int n = DB.ExecuteUpdate(sqls1);

                if (n != 0)
                {
                    string sqls2 = "UPDATE [dbo].[HOUSE] SET state = 1 WHERE houseId = " + houseId;
                    n = DB.ExecuteUpdate(sqls2);
                }
                

            }catch
            {

            }
        }
    }
    protected void backMainpg_Click(object sender,EventArgs e)
    {
        Response.Redirect("index.aspx?userName=" + userName);
    }
    protected void addHouse_Click(object sender, EventArgs e)
    {
        Response.Redirect("addHouse.aspx?userName="+userName);
    }
    protected void myOrder_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyOrder.aspx?userName=" + userName);
    }
}