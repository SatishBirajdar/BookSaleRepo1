<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="buy.aspx.cs" Inherits="project.buySale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="formBuy" runat="server">
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
            <div class="small-12 medium-6 columns">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <h4>Buy a Book:</h4>
                <asp:Label ID="Label1" runat="server" Text="Choose the Department"></asp:Label>
                <asp:DropDownList ID="ddlDepartment" runat="server" DataTextField="Name"></asp:DropDownList>

                <asp:UpdatePanel ID="GridPanel" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="Button1" runat="server" CssClass="button" Text="Get Books" OnClick="getBooks_Click" />
                        <asp:GridView ID="grdBookSale" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="Owner.email_id" HeaderText="OwnerEmailID" />
                                <asp:BoundField DataField="BookName" HeaderText="BookName" />
                                <asp:BoundField DataField="Cost" HeaderText="Cost ($)" />
                                <asp:HyperLinkField
                                    HeaderText="Negotiate" DataNavigateUrlFields="id" Text="Negotiate"
                                    DataNavigateUrlFormatString="~/NegotiateCost.aspx?bid={0}" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
                <div id="NoBookForDept" class="panel callout radius" runat="server" visible="false"> 
                    <h4>No Books.</h4> 
                    <p>Books aren't available for the selected department.</p> 
                </div>
            </div>

            <div class="small-12 medium-6 columns">
                <h4>Your Interests:</h4>
                <asp:GridView ID="grdNegotiated" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="BookName" HeaderText="BookName" />
                        <asp:BoundField DataField="Department.Name" HeaderText="Department Name" />
                        <asp:BoundField DataField="Cost" HeaderText="Cost ($)" />
                        <asp:BoundField DataField="NegotiatingCost" HeaderText="Negotiated Cost ($)" />
                    </Columns>
                </asp:GridView>

                <div id="EmptyNegotiatedBooks" class="panel callout radius" runat="server"> 
                    <h4>No Books.</h4> 
                    <p>You haven't negotiated any Books.</p> 
                </div>
            </div>

        </div>
    </form>
</asp:Content>
