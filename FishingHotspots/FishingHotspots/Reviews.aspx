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
                            <div class="col-lg-7">
                                <select class="form-control">
                                    <option>Coarse</option>
                                    <option>Game</option>
                                </select>
                            </div>
                            <div class="col-lg-7">
                                <select class="form-control">
                                    <option>Where</option>
                                </select>
                            </div>
                        </div>

                        <asp:Button ID="btnFindNow" runat="server" Text="Find Now" class="btn btn-primary" OnClick="btnFindNow_Click"></asp:Button>
                    </div>



                    <div class="hot-properties hidden-xs">
                        <h4>Hot Reviews</h4>
                        <div class="row">
                            <div class="col-lg-4 col-sm-5">
                                <img src="images/properties/1.jpg" class="img-responsive img-circle" alt="properties" /></div>
                            <div class="col-lg-8 col-sm-7">
                                <h5><a href="property-detail.php">Integer sed porta quam</a></h5>
                                <p class="price">$300,000</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-sm-5">
                                <img src="images/properties/1.jpg" class="img-responsive img-circle" alt="properties" /></div>
                            <div class="col-lg-8 col-sm-7">
                                <h5><a href="property-detail.php">Integer sed porta quam</a></h5>
                                <p class="price">$300,000</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-sm-5">
                                <img src="images/properties/1.jpg" class="img-responsive img-circle" alt="properties"></div>
                            <div class="col-lg-8 col-sm-7">
                                <h5><a href="property-detail.php">Integer sed porta quam</a></h5>
                                <p class="price">$300,000</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-sm-5">
                                <img src="images/properties/1.jpg" class="img-responsive img-circle" alt="properties" /></div>
                            <div class="col-lg-8 col-sm-7">
                                <h5><a href="property-detail.php">Integer sed porta quam</a></h5>
                                <p class="price">$300,000</p>
                            </div>
                        </div>

                    </div>


                </div>

                <div class="col-lg-9 col-sm-8">
                    <div class="sortby clearfix">
                        <div class="pull-right">
                            <select class="form-control">
                                <option>Sort by</option>
                                <option>Price: Low to High</option>
                                <option>Price: High to Low</option>
                            </select>
                        </div>

                    </div>
                    <div class="row" id="allReviews" runat="server">

                        <!-- properties -->
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
                        </div>
                        <!-- properties -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
