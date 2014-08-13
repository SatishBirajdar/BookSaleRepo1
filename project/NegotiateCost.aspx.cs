/*
 Name - Satish Birajdar
 Description- This File will for negotiating the cost.
 * */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class NegotiateCost : System.Web.UI.Page
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
                    getBookToNegotiate();
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void getBookToNegotiate()
        {
            using (BookSaleEntities Entities = new BookSaleEntities())
            {
                Book book = Entities.Books.Find(int.Parse(Request["bid"]));

                TxtBookName.Text = book.BookName;
                TxtDeptName.Text = book.Department.Name;
                TxtCost.Text = book.Cost.ToString();
                
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            pnlNegotiateCostHigher.Visible = false;
            pnlNegotiateCostLower.Visible = false;

            using (BookSaleEntities Entities = new BookSaleEntities())
            {
                Book book = Entities.Books.Find(int.Parse(Request["bid"]));

                /*only one maximum negotiation amount will be shown to the owner of the book, 
                 * so check the amount entered by the user to be higher than the current negotiationcost*/
                if (int.Parse(TxtNegotiateCost.Text) > book.NegotiatingCost)
                {
                    if (int.Parse(TxtNegotiateCost.Text) > book.Cost)
                    {
                        
                        book.NegotiatingCost = int.Parse(TxtNegotiateCost.Text);

                        string username = Session["UserName"].ToString();
                        book.Negotiator = Entities.Users.First(u => u.username == username);

                        Entities.SaveChanges();
                        Response.Redirect("buy.aspx");
                    }
                    else
                    {
                        pnlNegotiateCostLower.Visible = true; 
                    }
                }
                else
                {
                    pnlNegotiateCostHigher.Visible = true;
                    lblNegotiate.Text = book.NegotiatingCost.ToString();                                       
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("buy.aspx");
        }

    }
}