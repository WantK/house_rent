using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// DB 的摘要说明
/// </summary>
public class DB
{
    private static string MySqlCon = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=house_rent;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
    private static SqlConnection con = new SqlConnection(@MySqlCon);

    public static DataTable ExecuteQuery(string sqlStr)      //用于查询；其实是相当于提供一个可以传参的函数，到时候写一个sql语句，存在string里，传给这个函数，就会自动执行。
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = sqlStr;
        DataTable dt = new DataTable();
        SqlDataAdapter msda;
        msda = new SqlDataAdapter(cmd);
        msda.Fill(dt);
        con.Close();
        return dt;
    }
    public static int ExecuteUpdate(string sqlStr)      //用于增删改;
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = sqlStr;
        int iud = 0;
        iud = cmd.ExecuteNonQuery();
        con.Close();
        return iud;
    }
}