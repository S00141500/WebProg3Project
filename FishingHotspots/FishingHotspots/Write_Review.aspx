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
            <div class="row WriteReview">
                <div class="col-lg-6 col-lg-offset-3 col-sm-6 col-sm-offset-3 col-xs-12">
                    <asp:Label ID="lblError" runat="server" Text="" CssClass="alert-danger" Display="Dynamic"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="RequiredFieldValidator" Text="*Please enter First Name" ControlToValidate="txtTitle" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtTitle" placeholder="Title" runat="server" class="form-control"></asp:TextBox>

                    <asp:SqlDataSource ID="SqlDataSourceCounties" runat="server" ConnectionString="<%$ ConnectionStrings:FishingHotspotsDB %>" SelectCommand="SELECT * FROM [RegionsTbl]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="rfvCounties" InitialValue="0" runat="server" ErrorMessage="RequiredFieldValidator" Text="*Please select county " ControlToValidate="ddlCounties" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="ddlCounties" placeholder="Last Name" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSourceCounties" DataTextField="County" DataValueField="Id" OnDataBound="ddlCounties_DataBound" OnSelectedIndexChanged="ddlCounties_SelectedIndexChanged">
                        <asp:ListItem Value="0">--Select County--</asp:ListItem>
                    </asp:DropDownList>

                    <asp:DropDownList ID="ddlRiverOrLake" placeholder="Type" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlRiverOrLake_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem>River</asp:ListItem>
                        <asp:ListItem>Lake</asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator InitialValue="0" ID="rfvRiverLake" runat="server" ErrorMessage="RequiredFieldValidator" Text="*Please select river or Lake" ControlToValidate="ddlRiverLake" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="ddlRiverLake" placeholder="Username" runat="server" CssClass="form-control" OnDataBound="ddlRiverLake_DataBound">
                        <asp:ListItem Value="0">--Select River or Lake--</asp:ListItem>
                    </asp:DropDownList>


                    <asp:RequiredFieldValidator ID="rfvType" runat="server" ErrorMessage="RequiredFieldValidator" Text="*Please select Fish Type" ControlToValidate="ddlType" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="ddlType" placeholder="Type" runat="server" CssClass="form-control" onchange="showSpecies()">
                        <asp:ListItem Value="0">Coarse</asp:ListItem>
                        <asp:ListItem Value="1">Game</asp:ListItem>
                    </asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataCoarse" runat="server" ConnectionString="<%$ ConnectionStrings:FishingHotspotsDB %>" SelectCommand="SELECT * FROM [FishSpeciesTbl] WHERE ([FishType] = @FishType)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="FishType" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div id="Coarsediv">
                        <asp:CheckBoxList ID="cbxCoarse" runat="server" CssClass="checkboxDisplay" DataSourceID="SqlDataCoarse" DataTextField="Name" DataValueField="Id" RepeatDirection="Horizontal" RepeatColumns="4" TextAlign="Right" CellPadding="10">
                        </asp:CheckBoxList>
                    </div>
                    <asp:SqlDataSource ID="SqlDataGame" runat="server" ConnectionString="<%$ ConnectionStrings:FishingHotspotsDB %>" SelectCommand="SELECT * FROM [FishSpeciesTbl] WHERE ([FishType] = @FishType)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2" Name="FishType" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div id="Gamediv" hidden="">
                        <asp:CheckBoxList ID="cbxGame" runat="server" CssClass="checkboxDisplay" DataSourceID="SqlDataGame" DataTextField="Name" DataValueField="Id" RepeatDirection="Horizontal" RepeatColumns="4" TextAlign="Right" CellPadding="10">
                        </asp:CheckBoxList>
                    </div>

                    <asp:RequiredFieldValidator ID="frvDescription" runat="server" ErrorMessage="RequiredFieldValidator" Text="*Please enter Description" ControlToValidate="txtDescription" CssClass="alert-danger" Display="Dynamic" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtDescription" placeholder="Description" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>

                    *Upload Image<asp:FileUpload ID="ImgUpload" CssClass="form-control fileupload" runat="server" />

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

        $('#ImgUpload').click(function () {

            var oFevent;
            var oFReader = new FileReader();
            //var img = $("#uploadImage1");
            if (CheckFileSize(img.get(0).files[0].size)) {
                oFReader.readAsDataURL(img.get(0).files[0]);


                $(oFReader).load(function (e) {
                    oFevent = e.target.result;
                    $("#uploadPreview1").attr({ "src": e.target.result.toString() });

                });
            } else {

                alert("File size must be less than 12 MB");
            }


        });
    </script>
</asp:Content>

