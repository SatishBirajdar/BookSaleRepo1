/*
 Name - Satish Birajdar
 Description- This File will be used for selling the book.
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
    public partial class putSale : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*create a session for security and timeout of 5 mins*/
            Session.Timeout = 5;
            if (Session["UserName"] != null)
            {
                LblUsername.Text += Session["UserName"].ToString();

                TxtOwnerEmailID.Text = Session["EmailID"].ToString();

                using (BookSaleEntities Entities = new BookSaleEntities())
                {
                    String email = (String)Session["EmailID"];
                    if (!Entities.Books.Where(b => b.Owner.email_id == email).Any())
                    {
                        EmptyBooksAdded.Visible = true;
                    }
                    else
                    {
                        EmptyBooksAdded.Visible = false;
                        grdYourBookSale.DataSource = Entities.Books.Where(b => b.Owner.email_id == email).ToList();
                        grdYourBookSale.DataBind();
                    }
                    if (!IsPostBack)
                    {
                        RadioListDepartment.DataSource = Entities.Departments.ToList();
                        RadioListDepartment.DataBind();
                    }
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }

        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            /*add the new book in the table*/
            using (BookSaleEntities Entities = new BookSaleEntities())
            {
                Book objBookSale = new Book();

                string username = Session["UserName"].ToString();
                objBookSale.Owner = Entities.Users.First(u => u.username == username);
                objBookSale.Department = Entities.Departments.Find(Int64.Parse(RadioListDepartment.SelectedValue));
                objBookSale.BookName = TxtBookName.Text;
                objBookSale.Cost = int.Parse(TxtCost.Text);
                objBookSale.NegotiatingCost = 0;

                Entities.Books.Add(objBookSale);
                Entities.SaveChanges();
            }


            //redirect to the updated suppliers list
            Response.Redirect("home.aspx");


        }

        protected void grdYourBookSale_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            /*delete the selected booksale row from the grid*/
            using (BookSaleEntities Entities = new BookSaleEntities())
            {
                int bookId = Convert.ToInt32(grdYourBookSale.DataKeys[e.RowIndex].Values["id"]);
                Book book = Entities.Books.FirstOrDefault(u => u.id == bookId);

                Entities.Books.Remove(book);
                Entities.SaveChanges();

            }

            //refresh the grid
            Response.Redirect("sell.aspx");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {

            TxtBookName.Text = "";

            RadioListDepartment.SelectedIndex = 0;

            TxtCost.Text = "";


        }




    }
}