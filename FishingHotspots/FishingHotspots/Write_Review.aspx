<%@ Page Title="" Language="C#" MasterPageFile="~/FS.Master" AutoEventWireup="true" CodeBehind="Write_Review.aspx.cs" Inherits="FishingHotspots.Write_Review" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="CSS/Register.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="inside-banner">
        <div class="container">
            <span class="pull-right"><a href="#">Home</a> / Write a Review</span>
            <h2>Write a Review</h2>
        </div>
    </div>
    <!-- banner -->

    <div class="container">
        <div class="spacer">
            <div class="row register">
                <div class="col-lg-6 col-lg-offset-3 col-sm-6 col-sm-offset-3 col-xs-12">                    
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="RequiredFieldValidator" Text="*Please enter First Name" ControlToValidate="txtTitle" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtTitle" placeholder="Title" runat="server" class="form-control" ></asp:TextBox>
                    
                    
                    <asp:RequiredFieldValidator ID="rfvCounties" InitialValue="0" runat="server" ErrorMessage="RequiredFieldValidator" Text="*Please select county " ControlToValidate="ddlCounties" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="ddlCounties" placeholder="Last Name" runat="server" CssClass="form-control" >
                        <asp:ListItem Value="0">--Select County--</asp:ListItem>
                    </asp:DropDownList>
                    
                    <asp:RequiredFieldValidator InitialValue="0" ID="rfvRiverLake" runat="server" ErrorMessage="RequiredFieldValidator" Text="*Please select river or Lake" ControlToValidate="ddlRiverLake" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="ddlRiverLake" placeholder="Username" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">--Select River or Lake--</asp:ListItem>
                    </asp:DropDownList>
                    
                    <asp:RequiredFieldValidator ID="rfvType" runat="server" ErrorMessage="RequiredFieldValidator" Text="*Please select Fish Type" ControlToValidate="ddlType" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="ddlType" placeholder="Type" runat="server" CssClass="form-control" onchange="showSpecies()" >
                        <asp:ListItem value="0">Coarse</asp:ListItem>
                        <asp:ListItem value="1">Game</asp:ListItem>
                    </asp:DropDownList>
                    
                    <div id="Coarsediv">
                    <asp:CheckBoxList ID="cbxCoarse" runat="server">
                        <asp:ListItem>thing</asp:ListItem>
                    </asp:CheckBoxList>
                    </div>

                    <div id="Gamediv" hidden="">
                    <asp:CheckBoxList ID="cbxGame" runat="server">
                        <asp:ListItem> Other thing</asp:ListItem>
                    </asp:CheckBoxList>
                    </div>
                    
                    <asp:RequiredFieldValidator ID="frvDescription" runat="server" ErrorMessage="RequiredFieldValidator" Text="*Please enter Description" ControlToValidate="txtDescription" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtDescription" placeholder="Description" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>
                    
                    *Upload Image<asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />

                    <asp:Button ID="btnSave" class="btn btn-success" runat="server" Text="Save Review" OnClick="btnSave_Click" ValidationGroup="Register" />
                </div>

            </div>
        </div>
    </div>
    <script>

        function showSpecies() {
            var value = $(<%=ddlType.ClientID %>).val();

            if (value == 0) {
                $('#Gamediv').hide(500);
                $('#Coarsediv').show(500);
            }
            else {
                $('#Coarsediv').hide(500);
                $('#Gamediv').show(500);
            }
        }
       
    </script>
</asp:Content>

