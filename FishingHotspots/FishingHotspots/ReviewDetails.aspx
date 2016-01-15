<%@ Page Title="" Language="C#" MasterPageFile="~/FS.Master" AutoEventWireup="true" CodeBehind="ReviewDetails.aspx.cs" Inherits="FishingHotspots.ReviewDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Register.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="inside-banner">
        <div class="container">
            <span class="pull-right"><a href="Index.aspx">Home</a> / Review Details</span>
            <h2>News</h2>
        </div>
    </div>
    <br />
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSourceReviewDetails" runat="server" ConnectionString="<%$ ConnectionStrings:FishingHotspotsDB %>" SelectCommand="ReviewDetails" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="null" Name="ReviewId" QueryStringField="Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlDSFishCaught" runat="server" ConnectionString="<%$ ConnectionStrings:FishingHotspotsDB %>" SelectCommand="GetFishName" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="reviewId" QueryStringField="Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourceReviewDetails">

            <ItemTemplate>
                <div class="row">
                    <div class="col-lg-5">
                        <h1><strong><%#:Eval("Title")%></strong></h1>
                        <br />
                        <asp:Image ID="reviewImage" runat="server" ImageUrl='<%#Eval("Photo") %>' class="img-responsive displayImg" alt="review" />
                    </div>
                    <div class="col-lg-6 col-lg-offset-1 display">
                        <strong>
                            <asp:Label runat="server">Date:</asp:Label></strong>
                        <asp:Label runat="server"><%#:Eval("ReviewDate","{0:MMM dd, yyyy}")%></asp:Label>
                        <br />
                        <br />
                        <strong>
                            <asp:Label runat="server">County:</asp:Label></strong>
                        <asp:Label runat="server"> <%#:Eval("County")%></asp:Label>
                        <br />
                        <br />
                        <strong>
                            <asp:Label runat="server">Location:</asp:Label></strong>
                        <asp:Label runat="server" Visible='<%# ((int)Eval("LakeId")) != 0 ? true : false %>'><%#:Eval("LakeName")%></asp:Label>
                        <asp:Label runat="server" Visible='<%# ((int)Eval("RiverId")) != 0 ? true : false %>'><%#:Eval("RiverName")%></asp:Label>
                        <br />
                        <br />
                        <strong>
                            <asp:Label runat="server">Author:</asp:Label></strong>
                        <asp:Label runat="server"> <%#:Eval("Username")%></asp:Label>
                        <br />
                        <br />
                        <strong>
                            <asp:Label runat="server">Likes:</asp:Label></strong>
                        <asp:Label runat="server"> <%#:Eval("Likes")%> Likes</asp:Label>
                        <br />
                        <br />
                        <strong><asp:Label runat="server">Fish Caught</asp:Label></strong>
                        <asp:GridView ID="GridView1" runat="server" ShowHeader="false" DataSourceID="sqlDSFishCaught" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                        <br />
                        <strong>
                            <asp:Label runat="server">Review</asp:Label></strong>
                        <p>
                            <%#:Eval("ReviewText")%><p>
                                <br />
                        <br />
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div class="col-lg-9 col-lg-offset-1 col-sm-6 recommended">
                    <div class="item active" runat="server">
                        <div id="ItemPlaceholder" runat="server">
                        </div>
                    </div>
                </div>
            </LayoutTemplate>
        </asp:ListView>
        <div class="col-lg-2 display">
            <asp:Button runat="server" ID="btnLike" CssClass="btn btn-success col-lg-1" Text="Like" OnClick="btnLike_Click" Visible="false" />
            <asp:Label ID="lblRated" runat="server" Text="You liked this" CssClass="rated"  Visible="false"></asp:Label><br />
            <asp:Label ID="lblHashed" runat="server" CssClass="rated"  Visible="false" style="width:40px"></asp:Label>
        </div>
    </div>

</asp:Content>

