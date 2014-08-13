/*
 Name - Satish Birajdar
 Description- This File will image buttons for putting a new book or add a book for sale.
 * */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;


namespace project
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*create a session for security and timeout of 5 mins*/
            Session.Timeout = 5;
            if (Session["UserName"] != null)
            {
                LblUsername.Text += Session["EmailID"].ToString();
            }
            else
            {
                Response.Redirect("index.aspx");
            }

        }


        protected void putBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("sell.aspx");
        }

        protected void buySale_Click(object sender, EventArgs e)
        {
            Response.Redirect("buy.aspx");
        }

        protected void Unnamed_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}