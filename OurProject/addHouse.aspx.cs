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
    static string userName;

    static string userId;
    protected void Page_Load(object sender, EventArgs e)
    {
        userName = Request["userName"];
        if (!IsPostBack)
        {
            
            DataTable dt1 = DB.ExecuteQuery("SELECT * FROM [dbo].[USERS] WHERE userName = '" + userName + "'");
            username.Text = userName;
            phone.Text = "Phone:" + dt1.Rows[0]["Phone"].ToString();
            userId = dt1.Rows[0]["userId"].ToString();
        }
    }

    protected void summit_Click(object sender, EventArgs e)
    {
        TextBox tb_province = this.Page.FindControl("province") as TextBox;
        string Province = tb_province.Text;
        string City = city.Value;
        string Street = street.Value;
        float Price = float.Parse(price.Value);
        string Description = description.Value;
        int n = DB.ExecuteUpdate("INSERT INTO [dbo].[HOUSE] (Province,City,Street,Price,userId,state,description) VALUES ('" + Province + "','" + City + "','" + Street + "'," + Price + "," + userId + ",0,'" + Description + "')");
        if (n != 0)
        {
            Response.Redirect("PersonalInfo.aspx?userName=" + userName);
        }
        else
        {  
            Response.Write("<script>alert('房屋信息录入失败')</script>");
        }
    }
    protected void Mainpg_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx?userName=" + userName);
    }
}