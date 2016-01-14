<%@ Page Title="" Language="C#" MasterPageFile="~/FS.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="FishingHotspots.Reviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Reviews.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="inside-banner">
        <div class="container">
            <span class="pull-right"><a href="Index.aspx">Home</a> / Reviews</span>
            <h2>Reviews</h2>
        </div>
    </div>
    <!-- banner -->


    <div class="container">
        <div class="properties-listing spacer">

            <div class="row">
                <div class="col-lg-3 col-sm-4 ">

                    <div class="search-form">
                        <h4><span class="glyphicon glyphicon-search"></span>Search for</h4>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:DropDownList ID="ddlFishType" runat="server" class="form-control dll" >
                                    <asp:ListItem Value="1">Coarse</asp:ListItem>
                                    <asp:ListItem Value="2">Game</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-lg-12">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FishingHotspotsDB %>" SelectCommand="SELECT * FROM [RegionsTbl]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddlWhere" runat="server" class="form-control dll" DataSourceID="SqlDataSource1" DataTextField="County" DataValueField="Id" >
                                </asp:DropDownList>
                            </div>
                        </div>

                        <asp:Button ID="btnFindNow" runat="server" Text="Find Now" class="btn btn-primary" OnClick="btnFindNow_Click"></asp:Button>
                    </div>

                    <asp:SqlDataSource ID="SqlDataSourceTopRated" runat="server" ConnectionString="<%$ ConnectionStrings:FishingHotspotsDB %>" SelectCommand="TopRated" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourceTopRated">
                        <ItemTemplate>
                            <div runat="server">
                                <div class="row">
                                    <div class="col-lg-4 col-sm-5">
                                        <asp:Image ID="reviewImage" runat="server" ImageUrl='<%#Eval("Photo") %>' class="img-responsive img-circle" alt="review" />
                                    </div>
                                    <div class="col-lg-8 col-sm-7">
                                        <a href="../ReviewDetails.aspx?id=<%# Eval("reviewId") %>">
                                            <h5 class="alert-info"><strong><%#:Eval("Title")%></strong></h5>
                                        </a>
                                        <p class="price"><b>Likes:</b> <%# Eval("averageRating")%> people liked this</p>
                                        <p class="price"><%# Eval("ReviewDate","{0:MMM dd, yyyy}")%></p>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div class="hot-properties hidden-xs" runat="server">
                                <h4>Hot Reviews</h4>
                                <div id="ItemPlaceholder" runat="server">
                                </div>
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                </div>


                <div class="col-lg-8 col-lg-offset-1 col-sm-8">
                    <asp:Label ID="lblError" runat="server" Text="" CssClass="alert-danger" Display="Dynamic"></asp:Label>
                    <asp:ListView ID="ListViewReviews" runat="server">
                        <ItemTemplate>
                            <div class="col-lg-4 col-sm-6 reviews" runat="server" >
                                <div id="ImageDiv">
                                    <asp:Image ID="reviewImage" runat="server" ImageUrl='<%#Eval("Photo") %>' class="img-responsive" alt="review" />
                                </div>
                                <h4><strong><%#:Eval("Title")%></strong></h4>
                                <p class="price"><b>Date</b> <%# Eval("ReviewDate","{0:dd/MM/yyyy}")%></p>
                                <a class="btn btn-primary" href="ReviewDetails.aspx?id=<%# Eval("Id") %>">View Details</a>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div class="row" id="allReviews" runat="server">
                                
                                <div id="ItemPlaceholder" runat="server">
                                </div>
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                    <%--  <div class="row" id="allReviews" runat="server">--%>


                    <%--                        <!-- properties -->
                        <div class="col-lg-4 col-sm-6">
                            <div class="properties">
                                <div class="image-holder">
                                    <img src="images/properties/1.jpg" class="img-responsive" alt="properties">
                                </div>
                                <h4><a href="property-detail.php">Royal Inn</a></h4>
                                <p class="price">Price: $234,900</p>
                                <div class="listing-detail"><span data-toggle="tooltip" data-placement="bottom" data-original-title="Bed Room">5</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Living Room">2</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Parking">2</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Kitchen">1</span> </div>
                                <a class="btn btn-primary" href="property-detail.php">View Details</a>
                            </div>
                        </div>
                        <!-- properties -->


                        <!-- properties -->
                        <div class="col-lg-4 col-sm-6">
                            <div class="properties">
                                <div class="image-holder">
                                    <img src="images/properties/2.jpg" class="img-responsive" alt="properties">
                                </div>
                                <h4><a href="property-detail.php">Royal Inn</a></h4>
                                <p class="price">Price: $234,900</p>
                                <div class="listing-detail"><span data-toggle="tooltip" data-placement="bottom" data-original-title="Bed Room">5</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Living Room">2</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Parking">2</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Kitchen">1</span> </div>
                                <a class="btn btn-primary" href="property-detail.php">View Details</a>
                            </div>
                        </div>--%>
                    <!-- properties -->



                </div>
            </div>
        </div>
    </div>
</asp:Content>
