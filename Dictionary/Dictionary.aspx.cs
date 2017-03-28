using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Dictionary
{
    public partial class Dictionary : System.Web.UI.Page
    { 
        #region Data Members
        public static List<string> words = new List<string>();
     
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        #region Methods



        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> SearchWords(string prefixText, int count)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from wn_synset where " +
                    "word like @SearchText + '%'";
                    cmd.Parameters.AddWithValue("@SearchText", prefixText);
                    cmd.Connection = conn;
                    conn.Open();
                    words.Clear();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            words.Add(sdr["word"].ToString());
                        }
                    }
                    conn.Close();
                    return words;
                }
            }
        }
        public void fillTable(string where)
        {

            SqlCommand cmd = new SqlCommand("SearchProcedure", con);
            cmd.Parameters.Add("@where", SqlDbType.VarChar).Value = where;

            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                rptTable.DataSource = ds;
                rptTable.DataBind();
            }
            catch (Exception ex)
            {
                //...
            }
            finally
            {
                con.Close();
            }
        
        }
        #endregion

        protected void Stext_TextChanged(object sender, EventArgs e)
        {
            if (Stext != null && Stext.Text != string.Empty)
            {

                if (starting.Checked)
                { fillTable("" + Stext.Text.Trim().ToLower() + "%"); }
                else  if (ending.Checked)
                { fillTable("%" + Stext.Text.Trim().ToLower() + ""); }
                else  if (exact.Checked)
                { fillTable("" + Stext.Text.Trim().ToLower() + ""); }
                else  
                { fillTable("%" + Stext.Text.Trim().ToLower() + "%"); }
            
            
            }
          
        }

        protected void starting_CheckedChanged(object sender, EventArgs e)
        {
            ending.Checked = false;
            exact.Checked = false;
            anywhere.Checked = false;

            if (Stext != null && Stext.Text != string.Empty)
                fillTable("" + Stext.Text.Trim().ToLower() + "%");
        }

        protected void ending_CheckedChanged(object sender, EventArgs e)
        {
            starting.Checked = false;
            exact.Checked = false;
            anywhere.Checked = false;

            if (Stext != null && Stext.Text != string.Empty)
                fillTable("%" + Stext.Text.Trim().ToLower() + "");
        }

        protected void exact_CheckedChanged(object sender, EventArgs e)
        {
            ending.Checked = false;
            starting.Checked = false;
            anywhere.Checked = false;


            if (Stext != null && Stext.Text != string.Empty)
                fillTable("" + Stext.Text.Trim().ToLower() + "");
        }

        protected void anywhere_CheckedChanged(object sender, EventArgs e)
        {
            ending.Checked = false;
            exact.Checked = false;
            starting.Checked = false;

            if (Stext != null && Stext.Text != string.Empty)
                fillTable("%" + Stext.Text.Trim().ToLower() + "%");
        }

        protected void searchtop_TextChanged(object sender, EventArgs e)
        {
            if (searchtop != null && searchtop.Text != string.Empty)
                fillTable("%" + searchtop.Text.Trim().ToLower() + "%");
        }

        protected void topButton_ServerClick(object sender, EventArgs e)
        {

            if (searchtop != null && searchtop.Text != string.Empty)
                fillTable("%" + searchtop.Text.Trim().ToLower() + "%");
        }
    }
}