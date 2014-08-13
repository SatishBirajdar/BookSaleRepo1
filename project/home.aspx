<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="project.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="style.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <form id="formHome" runat="server">

        <nav class="top-bar" data-topbar>
            <ul class="title-area">
                <li class="name">
                    <h1><a href="home.aspx">Book Sale</a></h1>
                </li>
                <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a>

                </li>
            </ul>
            <section class="top-bar-section">
                <ul class="right">
                    <li class="active"><a href="home.aspx">Home</a></li>
                    <li><a href="sell.aspx">Sell</a></li>
                    <li><a href="buy.aspx">Buy</a></li>
                    <li><a href="logout.aspx">Logout</a></li>
                </ul>
            </section>
        </nav>

        <asp:Label ID="LblUsername" runat="server" CssClass="medium-centered" Text="Welcome "></asp:Label>

        <div class="row">



            <div class="small-12 medium-6  columns">
                <div class="stage">
                    <div class="leftButton">
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="images/SELL_image1.jpg" OnClick="putBtn_Click" />
                    </div>
                </div>
            </div>
            <div class="small-12 medium-6  columns">
                
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/BUY_image1.jpg" CssClass="right" OnClick="buySale_Click" />
                    
            </div>

        </div>

    </form>



</asp:Content>
