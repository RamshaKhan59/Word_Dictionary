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
    public partial class AdminPanel : System.Web.UI.Page
    {
        #region Data Members
        public static List<string> words = new List<string>();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        #endregion

        #region Load
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                meaningAdd.Value = meaningAdd.Value.Trim();
                if (string.IsNullOrEmpty(Session["adminname"].ToString()))
                { Response.Redirect("login.aspx"); return; }
            }
            catch { Response.Redirect("login.aspx"); return; }
            if (!Page.IsPostBack)
            {
                getTotalWords();
                getTodaysWords();
            }
        }
        #endregion

        #region Methods

        public void getTotalWords()
        {
            SqlCommand cmd = new SqlCommand("CountTotalWords", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
           int words=Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            Totalwords.InnerText = words.ToString();
        
        }
        public void getTodaysWords()
        {
            SqlCommand cmd = new SqlCommand("TodayWords", con);
            cmd.Parameters.Add("@dated", SqlDbType.VarChar).Value = DateTime.Now.Date.ToShortDateString(); 
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            int words = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            TodayWords.InnerText = words.ToString();

        }





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

        public decimal returnedIndex()
        {

            SqlCommand cmd = new SqlCommand("CurrentIndex", con);
           
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
           decimal value= Convert.ToInt64(cmd.ExecuteScalar());
            con.Close();
            return value;
        }

        #endregion
        
        #region Events
        protected void AdminLogin_ServerClick(object sender, EventArgs e)
        {

            if (userValue.Value == string.Empty || passValue.Value == string.Empty)
            {
                Errormsglogin.InnerText = "Enter all fields to update !";

                return;

            }

            if (userValue.Value.Length<5 || passValue.Value.Length<7)
            {
                Errormsglogin.InnerText = "Username and password should contain atleast 5 and 7 characters respectively !";

                return;

            }

            SqlCommand cmd = new SqlCommand("LoginInfo", con);
            cmd.Parameters.Add("@user", SqlDbType.VarChar).Value = userValue.Value;
            cmd.Parameters.Add("@pass", SqlDbType.VarChar).Value = passValue.Value;
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Errormsglogin.InnerText = "Profile updated !";
            userValue.Value = ""; passValue.Value = "";
        }


        protected void logout_ServerClick(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Dictionary.aspx");
        }
        protected void addWordButton_ServerClick(object sender, EventArgs e)
        {
            if(words.Contains(Aword.Text.Trim()))
            {
                errormsgAddWord.InnerText = "Word already exists !";

                return;
            }

            if (Aword.Text.Trim() == string.Empty || Anto.Value.Trim() == string.Empty || Sync.Value.Trim() == string.Empty || meaningAdd.Value.Trim() == string.Empty)
            {
                errormsgAddWord.InnerText = "Enter all fields to add a word !";

                return;

            }
            if (Aword.Text.Trim().Length < 1 || Anto.Value.Trim().Length < 3 || Sync.Value.Trim().Length < 3 || meaningAdd.Value.Trim().Length < 5)
            {
                errormsgAddWord.InnerText = "Please enter proper data with atleast 3 characters !";

                return;

            }

            decimal IdGenerated = returnedIndex() + 1;

            SqlCommand cmd = new SqlCommand("AddWord", con);
            cmd.Parameters.Add("@id", SqlDbType.Decimal).Value = IdGenerated;
            cmd.Parameters.Add("@word", SqlDbType.VarChar).Value = Aword.Text;
            cmd.Parameters.Add("@meanings", SqlDbType.VarChar).Value = meaningAdd.Value;
            cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = DateTime.Now.Date.ToShortDateString();
            cmd.Parameters.Add("@antonyms", SqlDbType.VarChar).Value =Anto.Value;
            cmd.Parameters.Add("@synonyms", SqlDbType.VarChar).Value = Sync.Value;
            cmd.Parameters.Add("@adj", SqlDbType.VarChar).Value = adj.Value;
            cmd.Parameters.Add("@verb", SqlDbType.VarChar).Value = verb.Value;
            cmd.Parameters.Add("@abbr", SqlDbType.VarChar).Value = abbr.Value;
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            errormsgAddWord.InnerText = "Word Added !";
            Aword.Text = ""; meaningAdd.Value = ""; Anto.Value = ""; Sync.Value = "";

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
           // getTotalWords();
          //  getTodaysWords();

        }

        protected void editButton_ServerClick(object sender, EventArgs e)
        {


            if (Aword.Text.Trim() == string.Empty || Anto.Value.Trim() == string.Empty || Sync.Value.Trim() == string.Empty || meaningAdd.Value.Trim() == string.Empty)
            {
                errormsgAddWord.InnerText = "Enter all fields to update a word !";

                return;

            }
            if (Aword.Text.Trim().Length < 1 || Anto.Value.Trim().Length < 3 || Sync.Value.Trim().Length < 3 || meaningAdd.Value.Trim().Length < 5)
            {
                errormsgAddWord.InnerText = "Please enter proper data with atleast 3 characters !";

                return;

            }
            if (!words.Contains(Aword.Text.Trim()))
            {
                errormsgAddWord.InnerText = "Word doesn't exists !";

                return;
            }


            SqlCommand cmdD = new SqlCommand("DeleteWord", con);

            cmdD.Parameters.Add("@word", SqlDbType.VarChar).Value = Aword.Text;

            cmdD.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmdD.ExecuteNonQuery();
            con.Close();
            decimal IdGenerated = returnedIndex() + 1;
            SqlCommand cmd = new SqlCommand("AddWord", con);
            cmd.Parameters.Add("@id", SqlDbType.Decimal).Value = IdGenerated;
            cmd.Parameters.Add("@word", SqlDbType.VarChar).Value = Aword.Text;
            cmd.Parameters.Add("@meanings", SqlDbType.VarChar).Value = meaningAdd.Value;
            cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = DateTime.Now.Date.ToShortDateString();
            cmd.Parameters.Add("@antonyms", SqlDbType.VarChar).Value = Anto.Value;
            cmd.Parameters.Add("@synonyms", SqlDbType.VarChar).Value = Sync.Value;
            cmd.Parameters.Add("@adj", SqlDbType.VarChar).Value = adj.Value;
            cmd.Parameters.Add("@verb", SqlDbType.VarChar).Value = verb.Value;
            cmd.Parameters.Add("@abbr", SqlDbType.VarChar).Value = abbr.Value;
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            errormsgAddWord.InnerText = "Word Updated !";
            Aword.Text = ""; meaningAdd.Value = ""; Anto.Value = ""; Sync.Value = "";

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
           // getTotalWords();
           // getTodaysWords();
        }

        protected void deleteButton_ServerClick(object sender, EventArgs e)
        {
            if (Aword.Text.Trim() ==string.Empty)  {
                errormsgAddWord.InnerText = "Enter a word to delete !";

                return;

            }



            string value = string.Empty;
            SqlCommand cmd = new SqlCommand("DeleteWord", con);
         
            cmd.Parameters.Add("@word", SqlDbType.VarChar).Value = Aword.Text;
           
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    value=sdr["FResult"].ToString();
                }
            }

           
            con.Close();
            if(value.ToLower()=="false")
            { errormsgAddWord.InnerText = "Word doesn't exists in the database !"; }
            else if (value.ToLower() == "true")
            { errormsgAddWord.InnerText = "Word Deleted !"; }
          
            Aword.Text = ""; meaningAdd.Value = ""; Anto.Value = ""; Sync.Value = "";
           // getTotalWords();
           // getTodaysWords();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void Aword_TextChanged(object sender, EventArgs e)
        {
            errormsgAddWord.InnerText = string.Empty;
            meaningAdd.InnerText = string.Empty;
            adj.Value = string.Empty;
            verb.Value = string.Empty;
            abbr.Value = string.Empty;
            Anto.Value = string.Empty;
            Sync.Value = string.Empty;
            if(Aword.Text!=null &&Aword.Text!=string.Empty)
            {


                SqlCommand cmd = new SqlCommand("FillFieldsByWord", con);
                cmd.Parameters.Add("@word", SqlDbType.VarChar).Value = Aword.Text;
            
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                adapter.Fill(ds);
                DataTable means = ds.Tables["Table"];
                DataTable ants = ds.Tables["Table1"];
                DataTable syncs = ds.Tables["Table2"];

                if(means!=null)
                {
                    foreach (DataRow dr in means.Rows)
                    {
                        meaningAdd.InnerText = dr["gloss"].ToString();
                        adj.Value = dr["adjective_noun"].ToString();
                        verb.Value = dr["verb"].ToString();
                        abbr.Value = dr["abbreviation"].ToString();
                    } 
                
                }

                if (ants != null)
                {
                    string datavalue = string.Empty;
                  foreach(DataRow dr in ants.Rows)
                  {
                      datavalue += dr["Antonym"].ToString() + " , ";
                  }
                  Anto.Value = datavalue;

                }
                if (syncs != null)
                {
                    string datavalue = string.Empty;
                    foreach (DataRow dr in syncs.Rows)
                    {
                        datavalue += dr["Synonym"].ToString() + " , ";
                    }
                    Sync.Value = datavalue;

                }
                con.Close();
            
            
            }
        }
#endregion

       
    }
}