/*
 Name - Satish Birajdar
 Description- This File will show front page for Login Page.
 * */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Security;

//add a reference to the sql client library so we can connect
using System.Data.SqlClient;

//add a reference so we can read settings from web.config
using System.Configuration;

namespace project
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            using (BookSaleEntities Entities = new BookSaleEntities())
            {
                pnlInvalidUser.Visible = false;
                /*check for user name with corresponding password in the database*/
                User user = Entities.Users.FirstOrDefault(u => u.username.ToLower() == TxtUsername.Text.ToLower());
                if (user != null)
                {
                    if (PasswordHash.ValidatePassword(TxtPassword.Text, user.password))
                    {
                        Session["EmailID"] = user.email_id;
                        Session["UserName"] = user.username;
                        Response.Redirect("home.aspx");
                    }
                }
                else
                {
                    pnlInvalidUser.Visible = true;
                }
            }
        }

        protected void TxtUsername_TextChanged(object sender, EventArgs e)
        {

        }
    }
}