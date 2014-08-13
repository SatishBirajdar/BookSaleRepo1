<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="project.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="small-12 medium-6 medium-push-6 columns">
            <h3>Authenticate:</h3>
            <form id="loginForm" runat="server">
                <asp:TextBox ID="TxtUsername" runat="server"
                    placeHolder="User Name"
                    OnTextChanged="TxtUsername_TextChanged"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server"
                    ControlToValidate="TxtUsername"
                    Display="Dynamic">
                        <small class="error" >Please enter the Username.</small>
                </asp:RequiredFieldValidator>

                <asp:TextBox ID="TxtPassword" runat="server"
                    placeHolder="Password"
                    TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                    runat="server"
                    ControlToValidate="TxtPassword"
                    Display="Dynamic">
                        <small class="error" >Please enter the Password.</small>
                </asp:RequiredFieldValidator>
                
                <asp:Panel ID="pnlInvalidUser" runat="server" Visible="false"><small class="error">Invalid Username and Password.</small></asp:Panel>

                <asp:Button ID="BtnLogin" runat="server"
                    Text="Login"
                    OnClick="BtnLogin_Click"
                    CssClass="button" />

                <a href="registration.aspx" class="button right">Registration</a>
            </form>
        </div>
        <div class="small-12 medium-6 medium-pull-6 columns">
            <ul data-orbit data-options="animation_speed:300;">
                <li>
                    <img src="images/slideshow1.jpg" alt="slide 1" />
                    <div class="orbit-caption">Book for Sale. </div>

                </li>
                <li class="active">
                    <img src="images/slideshow2.jpg" alt="slide 2" />
                    <div class="orbit-caption">Book for Sale. </div>

                </li>
                <li>
                    <img src="images/slideshow3.jpg" alt="slide 3" />
                    <div class="orbit-caption">Book for Sale. </div>

                </li>

            </ul>
        </div>
    </div>
</asp:Content>
