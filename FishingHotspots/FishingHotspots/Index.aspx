<%@ Page Title="" Language="C#" MasterPageFile="~/FS.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="FishingHotspots.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Index.css" rel="stylesheet" />
    <link href="assets/slitslider/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/slitslider/css/custom.css" />
    <link href="assets/owl-carousel/owl.carousel.css" rel="stylesheet" />
    <link href="assets/owl-carousel/owl.theme.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="">


        <div id="slider" class="sl-slider-wrapper">

            <div class="sl-slider">

                <div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="-25" data-slice2-rotation="-25" data-slice1-scale="2" data-slice2-scale="2">
                    <div class="sl-slide-inner">
                        <div class="bg-img bg-img-1"></div>
                        <h2>Find Ireland's Best Fishing Hotspots</h2>
                    </div>
                </div>

                <div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="3" data-slice2-rotation="3" data-slice1-scale="2" data-slice2-scale="1">
                    <div class="sl-slide-inner">
                        <div class="bg-img bg-img-2"></div>
                        <h2>Read and Rate Reviews</h2>
                    </div>
                </div>

                <div class="sl-slide" data-orientation="vertical" data-slice1-rotation="-5" data-slice2-rotation="25" data-slice1-scale="2" data-slice2-scale="1">
                    <div class="sl-slide-inner">
                        <div class="bg-img bg-img-3"></div>
                        <h2>Read All the Latest Fishing News</h2>
                    </div>
                </div>

            </div>
            <!-- /sl-slider -->



            <nav id="nav-dots" class="nav-dots">
                <span class="nav-dot-current"></span>
                <span></span>
                <span></span>
            </nav>
        </div>
        <!-- /slider-wrapper -->
    </div>


    <div class="banner-search">

        <div class="container">
            <!-- banner -->

            <div class="searchbar">

                <div class="col-lg-6 col-sm-6">
                    <h3>Find Fishing Spots</h3>
                    <div class="row">
                        <div class="col-lg-4 col-sm-3 ">
                            <asp:Label ID="lblWhere" runat="server" Text="Where?"></asp:Label>
                            <asp:DropDownList ID="ddlWhere" runat="server" class="form-control">
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-4 col-sm-4">
                            <asp:Label ID="lblType" runat="server" Text="Coarse Or Game?"></asp:Label>
                            <asp:DropDownList ID="ddlFishType" runat="server" class="form-control">
                                <asp:ListItem Value="1">Coarse</asp:ListItem>
                                <asp:ListItem Value="2">Game</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-3 col-sm-4" id="btnFind">
                            <asp:Button ID="btnFindReviews" OnClick="btnFindReviews_Click" runat="server" Text="Find Now" class="btn btn-success" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-lg-offset-2 col-sm-6 " id="loginPointer">
                <asp:Label runat="server" ID="txtCentreLogin">Join now to write and rate reviews.</asp:Label><br />
                <asp:Button ID="btnloginCentre" class="btn btn-info" data-toggle="modal" data-target="#loginpop" runat="server" Text="Login" />
            </div>
        </div>
    </div>
    <div class="container">
        <!-- About us -->
        <div class="spacer">
            <div class="row">
                <div class="col-lg-6 col-sm-9 recent-view">
                    <h3>About Us</h3>
                    <p>Fishing hotspots was started in Sligo Institute of Technology by four software development students. We all have a passion for fishing and believe that fishinghotspots will create a community for Irish anglers to share their fishing experiences</p>
                </div>

                <asp:SqlDataSource ID="SqlDataSourceTopRated" runat="server" ConnectionString="<%$ ConnectionStrings:FishingHotspotsDB %>" SelectCommand="TopRatedIndex" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourceTopRated">
                    <ItemTemplate>
                        <div class="row">
                            <div class="col-lg-4">
                                <a href="ReviewDetails?id=<%# Eval("reviewId") %>"><asp:Image ID="reviewImage" runat="server" ImageUrl='<%#Eval("Photo") %>' class="img-responsive" alt="review" /><a>
                            </div>
                            <div class="col-lg-8">
                                <h5><strong><%#:Eval("Title")%></strong></h5>
                                <p class="price"><b>Rating:</b> <%# Eval("averageRating")%> out of 5</p>
                                <p class="price"><%# Eval("ReviewDate","{0:MMM dd, yyyy}")%></p>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div class="col-lg-5 col-lg-offset-1 col-sm-3 recommended">
                            <h3>Recommended Review</h3>
                            <div id="myCarousel" class="carousel slide">
                                <div class="carousel-inner">
                                    <div class="item active" runat="server">
                                        <div id="ItemPlaceholder" runat="server">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </LayoutTemplate>
                </asp:ListView>

            </div>
        </div>
    </div>

    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <!-- /sl-slider -->
    <script type="text/javascript" src="assets/slitslider/js/modernizr.custom.79639.js"></script>
    <script type="text/javascript" src="assets/slitslider/js/jquery.ba-cond.min.js"></script>
    <script type="text/javascript" src="assets/slitslider/js/jquery.slitslider.js"></script>
    <!--owl carousel -->
    <script src="assets/owl-carousel/owl.carousel.js"></script>
    <script src="assets/script.js"></script>
</asp:Content>
