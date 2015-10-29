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
                        <h2><a href="#">Find Ireland's Best Fishing Areas</a></h2>
                        <blockquote>
                            <p class="location"><span class="glyphicon glyphicon-map-marker"></span>1890 Syndey, Australia</p>
                            <p>Until he extends the circle of his compassion to all living things, man will not himself find peace.</p>
                            <cite>$ 20,000,000</cite>
                        </blockquote>
                    </div>
                </div>

                <div class="sl-slide" data-orientation="vertical" data-slice1-rotation="10" data-slice2-rotation="-15" data-slice1-scale="1.5" data-slice2-scale="1.5">
                    <div class="sl-slide-inner">
                        <div class="bg-img bg-img-2"></div>
                        <h2><a href="#">2 Bed Rooms and 1 Dinning Room Aparment on Sale</a></h2>
                        <blockquote>
                            <p class="location"><span class="glyphicon glyphicon-map-marker"></span>1890 Syndey, Australia</p>
                            <p>Until he extends the circle of his compassion to all living things, man will not himself find peace.</p>
                            <cite>$ 20,000,000</cite>
                        </blockquote>
                    </div>
                </div>

                <div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="3" data-slice2-rotation="3" data-slice1-scale="2" data-slice2-scale="1">
                    <div class="sl-slide-inner">
                        <div class="bg-img bg-img-3"></div>
                        <h2><a href="#">2 Bed Rooms and 1 Dinning Room Aparment on Sale</a></h2>
                        <blockquote>
                            <p class="location"><span class="glyphicon glyphicon-map-marker"></span>1890 Syndey, Australia</p>
                            <p>Until he extends the circle of his compassion to all living things, man will not himself find peace.</p>
                            <cite>$ 20,000,000</cite>
                        </blockquote>
                    </div>
                </div>

                <div class="sl-slide" data-orientation="vertical" data-slice1-rotation="-5" data-slice2-rotation="25" data-slice1-scale="2" data-slice2-scale="1">
                    <div class="sl-slide-inner">
                        <div class="bg-img bg-img-4"></div>
                        <h2><a href="#">2 Bed Rooms and 1 Dinning Room Aparment on Sale</a></h2>
                        <blockquote>
                            <p class="location"><span class="glyphicon glyphicon-map-marker"></span>1890 Syndey, Australia</p>
                            <p>Until he extends the circle of his compassion to all living things, man will not himself find peace.</p>
                            <cite>$ 20,000,000</cite>
                        </blockquote>
                    </div>
                </div>

            </div>
            <!-- /sl-slider -->



            <nav id="nav-dots" class="nav-dots">
                <span class="nav-dot-current"></span>
                <span></span>
                <span></span>
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
                            <asp:DropDownList ID="ddlWhere" runat="server" class="form-control" >                                           
                                </asp:DropDownList>   
                        </div>
                        <div class="col-lg-4 col-sm-4">  
                            <asp:Label ID="lblType" runat="server" Text="Coarse Or Game?"></asp:Label>
                                <asp:DropDownList ID="ddlFishType" runat="server" class="form-control" >                                    
                                    <asp:ListItem>Coarse</asp:ListItem>
                                    <asp:ListItem>Game</asp:ListItem>
                                </asp:DropDownList>                            
                        </div>
                        <div class="col-lg-3 col-sm-4" id="btnFind">
                            <asp:Button ID="btnFindReviews" OnClick="btnFindReviews_Click" runat="server" Text="Find Now" class="btn btn-success" />                
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-lg-offset-2 col-sm-6 " id="loginPointer">
                <p>Join now to write and rate reviews.</p>
                <button class="btn btn-info" data-toggle="modal" data-target="#loginpop">Login</button>
            </div>
        </div>
    </div>
    <div class="container">
     <!-- About us -->
    <div class="spacer">
        <div class="row">
            <div class="col-lg-6 col-sm-9 recent-view">
                <h3>About Us</h3>
                <p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.<br>
                    <a href="about.php">Learn More</a></p>

            </div>
            <div class="col-lg-5 col-lg-offset-1 col-sm-3 recommended">
                <h3>Recommended Properties</h3>
                <div id="myCarousel" class="carousel slide">
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                        <li data-target="#myCarousel" data-slide-to="3" class=""></li>
                    </ol>
                    <!-- Carousel items -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="row">
                                <div class="col-lg-4">
                                    <img src="images/properties/1.jpg" class="img-responsive" alt="properties" /></div>
                                <div class="col-lg-8">
                                    <h5><a href="property-detail.php">Integer sed porta quam</a></h5>
                                    <p class="price">$300,000</p>
                                    <a href="property-detail.php" class="more">More Detail</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-lg-4">
                                    <img src="images/properties/2.jpg" class="img-responsive" alt="properties" /></div>
                                <div class="col-lg-8">
                                    <h5><a href="property-detail.php">Integer sed porta quam</a></h5>
                                    <p class="price">$300,000</p>
                                    <a href="property-detail.php" class="more">More Detail</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-lg-4">
                                    <img src="images/properties/3.jpg" class="img-responsive" alt="properties" /></div>
                                <div class="col-lg-8">
                                    <h5><a href="property-detail.php">Integer sed porta quam</a></h5>
                                    <p class="price">$300,000</p>
                                    <a href="property-detail.php" class="more">More Detail</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-lg-4">
                                    <img src="images/properties/4.jpg" class="img-responsive" alt="properties" /></div>
                                <div class="col-lg-8">
                                    <h5><a href="property-detail.php">Integer sed porta quam</a></h5>
                                    <p class="price">$300,000</p>
                                    <a href="property-detail.php" class="more">More Detail</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
