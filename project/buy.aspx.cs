/*
 Name - Satish Birajdar
 Description- This File will show two parts, one is to buy a new book (negotiate a book price with the owner) and another one will show the book you should interest or negotiated.
 */

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
    public partial class buySale : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*create a session for security and timeout of 5 mins*/
            Session.Timeout = 5;
            if (Session["UserName"] != null)
            {
                LblUsername.Text += Session["UserName"].ToString();
                
                if (!IsPostBack)
                {
                    using (BookSaleEntities Entities = new BookSaleEntities())
                    {
                        /*fill grid with the book the user already negotiated with*/
                        String email = (String)Session["EmailID"];

                        /*fill dropdown with department available*/
                        ddlDepartment.DataSource = Entities.Departments.ToList();
                        ddlDepartment.DataBind();

                        ddlDepartment.Items.Insert(0, new ListItem("-- Select Department --", "-1"));

                        if (!Entities.Books.Where(b => b.Negotiator.email_id == email).Any())
                        {
                            EmptyNegotiatedBooks.Visible = true;
                        }
                        else{
                            EmptyNegotiatedBooks.Visible = false;
                            grdNegotiated.DataSource = Entities.Books.Where(b => b.Negotiator.email_id == email).ToList();
                            grdNegotiated.DataBind();
                        }
                    }
                }

            }
            else
            {
                Response.Redirect("index.aspx");
            }            
        }

        protected void getBooks_Click(object sender, EventArgs e)
        {
            using (BookSaleEntities Entities = new BookSaleEntities())
            {
                String email = (String)Session["EmailID"];
                string department = ddlDepartment.SelectedValue;

                /*fill grid with the book of the department selected in dropdown list*/
                if (!Entities.Books.Where(b => b.Department.Name == department && b.Owner.email_id != email).Any())
                {
                    NoBookForDept.Visible = true;
                }
                else
                {
                    NoBookForDept.Visible = false;
                    grdBookSale.DataSource = Entities.Books.Where(b => b.Department.Name == department && b.Owner.email_id != email).ToList();
                    grdBookSale.DataBind();
                }

                

            }
        }
        
    }
}