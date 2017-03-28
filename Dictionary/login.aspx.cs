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
    public partial class login : System.Web.UI.Page
    {
        #region Data Members
       
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void done_ServerClick(object sender, EventArgs e)
        {
            if(user.Value.Trim()==string.Empty || pass.Value.Trim()==string.Empty)
            {
                msg.InnerText = "Enter all fields !"; return;
            }

            SqlDataAdapter sda = new SqlDataAdapter("select * from LoginT where lower(username)='"+user.Value.Trim().ToLower()+"' and pass='"+pass.Value+"'",con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["adminname"] = user.Value;
                Response.Redirect("AdminPanel.aspx");
            }
            else
            { msg.InnerText = "Invalid Credentials !"; }

        }
    }
}