<%@ Page Title="" Language="C#" MasterPageFile="../FS.Master" AutoEventWireup="true" CodeBehind="Admin_AddNews.aspx.cs" Inherits="FishingHotspots.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Add News | Admin</title>
    <link href="../CSS/Register.css" rel="stylesheet" />
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="inside-banner">
        <div class="container">
            <span class="pull-right"><a href="Index.aspx">Home</a> / Add News Story</span>
            <h2>Add News Story</h2>
        </div>
    </div>

    <div class="container">
        <div class="spacer">
            <div class="row register">
                <div class="col-lg-6 col-lg-offset-3 col-sm-6 col-sm-offset-3 col-xs-12 ">

                    <asp:TextBox ID="txtTitle" placeholder="Title" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqValTitle" CssClass="alert-danger" runat="server" ErrorMessage="The News Story must have a Title!" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>

                    <asp:TextBox ID="txtDescription" placeholder="Description" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqValDescription" CssClass="alert-danger" runat="server" ErrorMessage="Please write the news story! " SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtDescription"></asp:RequiredFieldValidator>

                        *Upload Image
                    <asp:FileUpload ID="ImgUpload" CssClass="form-control " runat="server" />
                    <asp:CustomValidator ID="CustomValidator1" CssClass="alert-danger" ControlToValidate="ImgUpload" runat="server" ErrorMessage="Only type(.jpg/.png/.gif) images are valid" Display="Dynamic" OnServerValidate="CustomValidator1_ServerValidate" SetFocusOnError="true"></asp:CustomValidator>

                    <asp:Label ID="lblStatus" runat="server"></asp:Label>

                    <asp:Button ID="btnSaveNews" CssClass="btn-success btn btn-default" runat="server" OnClick="btnSaveNews_Click" Text="Save News" />

                </div>
            </div>
        </div>
    </div>
</asp:Content>
