using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class orderPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string houseId = Request["houseId"];
            DataTable dt = DB.ExecuteQuery("SELECT * FROM [dbo].[HOUSE] WHERE houseId = " + houseId);
            txtHomeId.Text = houseId;
            txtHomeAdd.Text = dt.Rows[0]["City"].ToString();
            txtHomePay.Text = dt.Rows[0]["Price"].ToString();
            txtHomeDes.Text = dt.Rows[0]["description"].ToString();

            string userId = Request["userId"];
            DataTable dt1 = DB.ExecuteQuery("SELECT * FROM [dbo].[USERS] WHERE userId = " + userId);
            txtHomeOwnerPhone.Text = dt1.Rows[0]["Phone"].ToString();
        }
        
    }
    
}