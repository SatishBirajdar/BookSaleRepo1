<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NegotiateCost.aspx.cs" Inherits="project.NegotiateCost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="formNegotiate" runat="server">

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
                    <li><a href="home.aspx">Home</a></li>
                    <li><a href="sell.aspx">Sell</a></li>
                    <li class="active"><a href="buy.aspx">Buy</a></li>
                    <li><a href="logout.aspx">Logout</a></li>
                </ul>
            </section>
        </nav>

        <asp:Label ID="LblUsername" runat="server" CssClass="medium-centered" Text="Welcome "></asp:Label>

        <div class="row">



            <div class="small-12 medium-12  columns">


                <label for="TxtBookName">BookName</label>

                <asp:TextBox ID="TxtBookName" runat="server" Enabled="false"></asp:TextBox>

                <label for="TxtDeptName">Department Name</label>

                <asp:TextBox ID="TxtDeptName" runat="server" Enabled="false"></asp:TextBox>



                <label for="TxtCost">Cost: ($)</label>

                <asp:TextBox ID="TxtCost" runat="server" Enabled="false"></asp:TextBox>

                <label for="TxtNegotiateCost">Negotiate Cost: ($)</label>

                <asp:TextBox ID="TxtNegotiateCost" runat="server" placeholder="0"></asp:TextBox>

                <asp:Panel ID="pnlNegotiateCostLower" runat="server" Visible="false"><small class="error">Cannot sell the book below the offered amount.</small></asp:Panel>
                    
                <asp:Panel ID="pnlNegotiateCostHigher" runat="server" Visible="false"><small class="error">Please enter the amount above <asp:Label ID="lblNegotiate" runat="server"></asp:Label>. Since we already have other student offering this amount.</small></asp:Panel>
                
                <asp:Button ID="btnSubmit" runat="server" CssClass="button" Text="Submit" OnClick="btnSubmit_Click" />

                <asp:Button ID="btnCancel" runat="server" CssClass="button" Text="Cancel" OnClick="btnCancel_Click" />

            </div>
        </div>
    </form>
</asp:Content>
