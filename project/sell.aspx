<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="sell.aspx.cs" Inherits="project.putSale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="formSell" runat="server">
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
                    <li class="active"><a href="sell.aspx">Sell</a></li>
                    <li><a href="buy.aspx">Buy</a></li>
                    <li><a href="logout.aspx">Logout</a></li>
                </ul>
            </section>
        </nav>

        <asp:Label ID="LblUsername" runat="server" CssClass="medium-centered" Text="Welcome "></asp:Label>

        <div class="row">
            <div class="small-12 medium-6 columns">
                <h4>Add a Book for Sale:</h4>
                <label for="TxtOwnerEmailID"><strong>Owner:</strong></label>

                <asp:TextBox ID="TxtOwnerEmailID" runat="server" Enabled="false"></asp:TextBox>

                <label for="RadioListDepartment"><strong>Department</strong></label>

                <asp:RadioButtonList ID="RadioListDepartment" runat="server" CellSpacing="0" DataValueField="id" DataTextField="Name" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioListDepartment" Display="Dynamic">
        <small class="error">Please select one.</small>
                </asp:RequiredFieldValidator>

                <label for="TxtBookName"><strong>Book Name</strong></label>

                <asp:TextBox ID="TxtBookName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtBookName" Display="Dynamic">
        <small class="error">Please select one.</small>
                </asp:RequiredFieldValidator>

                <label for="TxtCost"><strong>Cost: ($)</strong></label>

                <asp:TextBox ID="TxtCost" runat="server" Style="text-align: left"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server" ControlToValidate="TxtCost">
        <small class="error">Please select one.</small>
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TxtCost" runat="server" ValidationExpression="\d+" Display="Dynamic">
        <small class="error">Positive Numbers Only.</small>
                </asp:RegularExpressionValidator>

                <asp:Button ID="btnAdd" runat="server" CssClass="button" Text="Add Sale" OnClick="btnAdd_Click" />
                <asp:Button ID="btnClear" runat="server" CssClass="button" Text="Clear" OnClick="btnClear_Click" CausesValidation="false" />
            </div>

            <div class="small-12 medium-6 columns">
                <h4>Your Books for Sale</h4>
                <asp:GridView ID="grdYourBookSale" runat="server" AutoGenerateColumns="false" DataKeyNames="id" OnRowDeleting="grdYourBookSale_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="BookName" HeaderText="BookName" />
                        <asp:BoundField DataField="Department.Name" HeaderText="Department Name" />
                        <asp:BoundField DataField="Cost" HeaderText="Cost ($)" />
                        <asp:BoundField DataField="NegotiatingCost" HeaderText="Max. Negotiated Cost ($)" />
                        <asp:BoundField DataField="Negotiator.email_id" HeaderText="Negotiator" />
                        <asp:CommandField DeleteText="Delete" ShowDeleteButton="true" HeaderText="Delete" />
                    </Columns>
                </asp:GridView>
                <div id="EmptyBooksAdded" class="panel callout radius" runat="server"> 
                    <h4>No Books.</h4> 
                    <p>You haven't added any Books.</p> 
                </div>
            </div>
        </div>
    </form>


</asp:Content>
