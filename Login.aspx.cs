using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    OleDbConnection conn;
    OleDbCommand cmd;
    OleDbDataAdapter adap;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String email = tEmail.Text;
        String ps = tPS.Text;
        Connect();
        OleDbCommand cmd = new OleDbCommand("select * from Login where eMail='" + email + "' and Password='" + ps + "'", conn);
        cmd.CommandType = CommandType.Text;
        OleDbDataAdapter adap = new OleDbDataAdapter(cmd.CommandText, conn);
        DataSet ds = new DataSet();
        adap.Fill(ds, "Login");
        DataTable dt = ds.Tables["Login"];
        if (dt.Rows.Count > 0)
        {
            DataRow dr = dt.Rows[0];
            this.Session["ID"] = (int)dr["ID"];
            Response.Redirect("Home.aspx");
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Username and Password')</script>");
        }
        conn.Close();
    }
    private void Connect()
    {
        conn = new OleDbConnection(@"Provider = Microsoft.Jet.OLEDB.4.0; Data Source = C:\Users\Sumeet Bahadkar\Documents\Visual Studio 2015\WebSites\OMRS\biscuit.mdb");
        conn.Open();
    }
}