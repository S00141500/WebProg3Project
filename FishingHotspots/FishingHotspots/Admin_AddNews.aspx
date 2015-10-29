<%@ Page Title="" Language="C#" MasterPageFile="~/FS.Master" AutoEventWireup="true" CodeBehind="Admin_AddNews.aspx.cs" Inherits="FishingHotspots.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Add News | Admin</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="CSS/master.css" />
    <link rel="stylesheet" href="CSS/PageForms.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $('#btnUploadImg').click(function () {



            });

            //var oFevent;
            //var oFReader = new FileReader();
            //var img = $("#uploadImage1");
            //if (CheckFileSize(img.get(0).files[0].size)) {
            //    oFReader.readAsDataURL(img.get(0).files[0]);


            //    $(oFReader).load(function (e) {
            //        oFevent = e.target.result;
            //        $("#uploadPreview1").attr({ "src": e.target.result.toString()});

            //    });
            //} else {

            //    alert("File size must be less than 12 MB");
            //}





        });



    </script>
    <link href="CSS/PageForms.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="inside-banner">
        <div class="container ">
            <h2 class="pageHeader">Add News Story</h2>

        </div>
    </div>

    <div class="col-md-12 form-horizontal formStyle">

        <div><asp:Label ID="lblStatus" runat="server" class="alert alert-success fade in" hidden="hidden"></asp:Label></div>

        <div class="col-md-offset-3 col-md-6">
            <div class="form-group">
                <label class="control-label col-sm-3 text-left">Title:</label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqValTitle" runat="server" ErrorMessage="The News Sotry must have a Title!" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3 text-left">Description:</label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtDescription" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="10"
                        Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqValDescription" runat="server" ErrorMessage="Please write the news story! " ControlToValidate="txtDescription"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3 text-left">Upload Image:</label>
                <div class="col-sm-9">
                    <asp:FileUpload ID="FileUpload1" CssClass="form-control" width="300px" runat="server" />
                </div>
                </div>

                <div class="form-group btnSaveNews">
                    <div class="col-sm-offset-3 col-sm-6">
                        <asp:Button ID="btnSaveNews" CssClass="btn-success btn btn-default" runat="server" OnClick="btnSaveNews_Click"  Text="Save News" />
                    </div>
                </div>

            </div>
        </div>
</asp:Content>
