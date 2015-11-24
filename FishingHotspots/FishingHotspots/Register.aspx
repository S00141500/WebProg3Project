<%@ Page Title="" Language="C#" MasterPageFile="~/FS.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FishingHotspots.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Register.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="inside-banner">
        <div class="container">
            <span class="pull-right"><a href="#">Home</a> / Register</span>
            <h2>Register</h2>
        </div>
    </div>
    <!-- banner -->


    <div class="container">
        <div class="spacer">
            <div class="row register">
                <div class="col-lg-6 col-lg-offset-3 col-sm-6 col-sm-offset-3 col-xs-12 ">
                    
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="RequiredFieldValidator" Text="*Please enter First Name" ControlToValidate="txtFirstName" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtFirstName" placeholder="First Name" runat="server" class="form-control" ></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="RequiredFieldValidator" Text="*Please enter Last Name " ControlToValidate="txtLastName" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtLastName" placeholder="Last Name" runat="server" class="form-control" ></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="RequiredFieldValidator" Text="*Please enter Username" ControlToValidate="txtUserName" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtUserName" placeholder="Username" runat="server" class="form-control" ></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="RequiredFieldValidator" Text="*Please enter Email Address" ControlToValidate="txtEmail" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="reEmail" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtEmail" ValidationGroup="Register" CssClass="alert-danger" Display="Dynamic" ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" Text="*Invalid email Address"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtEmail" placeholder="Password" runat="server" class="form-control" TextMode="Email" ></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="RequiredFieldValidator" Text="*Please enter Password" ControlToValidate="txtPassword" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rePassword" runat="server" ErrorMessage="RegularExpressionValidator" Text="*Password must be at least 6 characters and must contain a number(e.g Password1)" ControlToValidate="txtPassword" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtPassword" placeholder="Password" runat="server" class="form-control" TextMode="Password" ></asp:TextBox>                   
                    
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ErrorMessage="RequiredFieldValidator" Text="*Please confirm Password" ControlToValidate="txtConfirmPassword" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CVConfirmPasword" runat="server" ErrorMessage="CompareValidator" Text="*Passwords do not match" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register"></asp:CompareValidator>
                    <asp:TextBox ID="txtConfirmPassword" placeholder="Confirm Password" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                    
                    <asp:Button ID="btnRegister" class="btn btn-success" runat="server" Text="Register" OnClick="btnRegister_Click" ValidationGroup="Register" />
                </div>

            </div>
        </div>
    </div>
</asp:Content>
