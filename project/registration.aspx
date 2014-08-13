<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="project.registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h3>Registration:</h3>

    <div class="row">
        <div class="small-12 columns">
            <form id="registrationForm" runat="server">
                <label for="TxtUserName">Username : </label>

                <asp:TextBox ID="TxtUserName" runat="server"></asp:TextBox>
                <asp:Panel ID="pnlUserNameError" runat="server" Visible="false"><small class="error">Username Already Exists.</small></asp:Panel>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="TxtUserName" Display="Dynamic">
                <small class="error" >Please fill me.</small>
                </asp:RequiredFieldValidator>


                <label for="TxtPassword">Password : </label>

                <asp:TextBox ID="TxtPassword" TextMode="Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="TxtPassword" Display="Dynamic">
                <small class="error" >Please fill me.</small>
                </asp:RequiredFieldValidator>

                <label for="TxtConfirmPassword">Confirm Password : </label>

                <asp:TextBox ID="TxtConfirmPassword" TextMode="Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtConfirmPassword" Display="Dynamic">
                <small class="error" >Please fill me.</small>
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="confirmPassword" Text="Your Password don't match." ControlToValidate="TxtConfirmPassword"
                    Type="String" ControlToCompare="TxtPassword" Operator="Equal" runat="server" Display="Dynamic">
                <small class="error" >Your Password don't match.</small>
                </asp:CompareValidator>

                <label for="TxtEmailId">Email Id : </label>

                <asp:TextBox ID="TxtEmailId" runat="server" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtEmailId" Display="Dynamic">
                <small class="error" >Please fill me.</small>
                </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtEmailId" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic">
                <small class="error" >Invalid Email Format</small>
                </asp:RegularExpressionValidator>

                <label for="TxtPhoneNumber">Phone-Number : </label>

                <asp:TextBox ID="TxtPhoneNumber" runat="server" TextMode="Phone"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtPhoneNumber" Display="Dynamic">
                <small class="error" >Please fill me.</small>
                </asp:RequiredFieldValidator>

                <asp:Button ID="Btn_Submit" runat="server" CssClass="button" Text="Submit" OnClick="Btn_Submit_Click" />
                <asp:Button ID="Btn_Cancel" runat="server" CssClass="button" Text="Cancel" OnClick="Btn_Cancel_Click" CausesValidation="False" />
            </form>
        </div>
    </div>

</asp:Content>
