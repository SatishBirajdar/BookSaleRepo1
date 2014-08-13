/*
 Name - Satish Birajdar
 Description- This File will be used for creating new distinct user.
 * */


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//add a reference to the sql client library so we can connect
using System.Data.SqlClient;

//add a reference so we can read settings from web.config
using System.Configuration;

namespace project
{
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_Submit_Click(object sender, EventArgs e)
        {
            using (BookSaleEntities Entities = new BookSaleEntities())
            {
                /*check database whether the user already exists*/
                if (Entities.Users.FirstOrDefault(u => u.username.ToLower() == TxtUserName.Text.ToLower()) != null)
                {
                    pnlUserNameError.Visible = true;
                }
                else
                {
                    User user = new User();

                    user.username = TxtUserName.Text;
                    user.password = PasswordHash.CreateHash(TxtPassword.Text);
                    user.email_id = TxtEmailId.Text;
                    user.phone_number = TxtPhoneNumber.Text;
                    Entities.Users.Add(user);

                    Entities.SaveChanges();

                    Response.Redirect("index.aspx");

                }
            }

        }


        protected void Btn_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}