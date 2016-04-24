using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

public partial class Home : System.Web.UI.Page
{
    OleDbConnection conn;
    OleDbCommand cmd;
    OleDbDataAdapter adap;
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper h = new Helper();
        h.Generate();
        int ID = (int)this.Session["ID"];
        Connect();
        OleDbCommand cmd = new OleDbCommand("select eMail from Login where ID=" + ID, conn);
        cmd.CommandType = CommandType.Text;
        OleDbDataAdapter adap = new OleDbDataAdapter(cmd.CommandText, conn);
        DataSet ds = new DataSet();
        adap.Fill(ds, "Login");
        DataTable dt = ds.Tables["Login"];
        DataRow dr = dt.Rows[0];
        String a = dr["eMail"].ToString();
        UserLabel.Text = "Welcome, " + a;/*
        OleDbCommand cmd1 = new OleDbCommand("select title as title,artist as artist,path as path,rating as rating from (select * from songs left outer join ratings) as t where songs.ID=Ratings.songs_id and ratings.user_id=" + ID, conn);
        cmd1.CommandType = CommandType.Text;
        OleDbDataAdapter adap1 = new OleDbDataAdapter(cmd.CommandText, conn);
        DataSet ds1 = new DataSet();
        adap.Fill(ds1, "t");
        DataTable dt1 = ds1.Tables["t"];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            dr = dt.Rows[i];
            Response.Write(dr.ToString());
            ListView1.DataSource = dt1;
        }
        ListView1.DataSourceID = null;
        ListView1.DataBind();*/
        conn.Close();
    }
    private void Connect()
    {
        conn = new OleDbConnection(@"Provider = Microsoft.Jet.OLEDB.4.0; Data Source = C:\Users\Sumeet Bahadkar\Documents\Visual Studio 2015\WebSites\OMRS\biscuit.mdb");
        conn.Open();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String key = bSearch.Text;
        Connect();
        OleDbCommand cmd = new OleDbCommand("select title,artist,path from songs where artist like '%" + key + "%' or title like '%" + key + "%'", conn);
        cmd.CommandType = CommandType.Text;
        OleDbDataAdapter adap = new OleDbDataAdapter(cmd.CommandText, conn);
        DataSet ds = new DataSet();
        adap.Fill(ds, "Songs");
        DataTable dt = ds.Tables["Songs"];
        ListView1.DataSource =dt;
        ListView1.DataSourceID = null;
        ListView1.DataBind();
        conn.Close();
    }
    
}
