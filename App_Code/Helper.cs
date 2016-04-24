using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Data;
using System.IO;

/// <summary>
/// Summary description for Helper
/// </summary>
public class Helper
{
    OleDbConnection conn;
    OleDbCommand cmd;
    OleDbDataAdapter adap;
    public Helper()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    private void Connect()
    {
        conn = new OleDbConnection(@"Provider = Microsoft.Jet.OLEDB.4.0; Data Source = C:\Users\Sumeet Bahadkar\Documents\Visual Studio 2015\WebSites\OMRS\biscuit.mdb");
        conn.Open();
    }
    public void Concat()
    {
        Connect();
        OleDbCommand cmd = new OleDbCommand("update Songs set path=path + '.mp3'");
        cmd.CommandType = CommandType.Text;
        cmd.Connection = conn;
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    public void Generate()
    {
        Connect();
        OleDbCommand cmd = new OleDbCommand("select path from songs where artist is null or title is null", conn);
        cmd.CommandType = CommandType.Text;
        OleDbDataAdapter adap = new OleDbDataAdapter(cmd.CommandText, conn);
        DataSet ds = new DataSet();
        adap.Fill(ds, "Songs");
        DataTable dt = ds.Tables["Songs"];
        DataRow dr;
        for(int i = 0; i < dt.Rows.Count; i++)
        {
            dr = dt.Rows[i];
            TagLib.File f = TagLib.File.Create(@"C:\Users\Sumeet Bahadkar\Documents\Visual Studio 2015\WebSites\OMRS\" + dr["path"].ToString());
            
            String tit = f.Tag.Title;
            String artist="";
            try {
                artist = f.Tag.Artists[0];
            }catch(IndexOutOfRangeException e)
            {

            }
            String cm="update Songs set Title='" + tit + "',Artist='" + artist + "' where path='" + dr["path"].ToString() + "'";
            OleDbCommand cmd1 = new OleDbCommand(cm);
            cmd1.CommandType = CommandType.Text;
            cmd1.Connection = conn;
            cmd1.ExecuteNonQuery();
        }
        conn.Close();
    }
}
