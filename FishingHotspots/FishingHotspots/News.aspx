<%@ Page Title="" Language="C#" MasterPageFile="~/FS.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="FishingHotspots.News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/News.css" rel="stylesheet" />
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="inside-banner">
        <div class="container">
            <span class="pull-right"><a href="Index.aspx">Home</a> / News</span>
            <h2>News</h2>
        </div>
    </div>
    <!-- banner -->
    <div class="row">
        <div class="col-md-7 col-md-offset-2 col col-sm-8 ">
            <asp:Label ID="lblError" runat="server" Text="" ></asp:Label>
            <asp:ListView ID="ListViewNews" runat="server">
                <EmptyDataTemplate>
                    <div class="emptyNewslist alert-danger">
                        <span>There are no news items to show</span>
                    </div>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <div class="NewsTemplate" runat="server">
                        <div class="row">
                            <div class="col-md-12 col-lg-12">
                                <h4><strong><%# Eval("Title") %> </strong><span class="pull-right">published on: <%#Eval("PublishDate", "{0:dd/M/yyyy}") %></span></h4>
                     
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 col-lg-3 col-sm-5 col-xs-5">
                                <asp:Image ID="imgNews" runat="server" ImageUrl='<%#Eval("Image") %>' class="img-responsive" alt="News" />
                            </div>
                            <div class="col-m-9 col-lg-9 col-sm-7 col-xs-7">
                                            <asp:Label ID="txtTextBody" runat="server" Text='<%# Eval("Text") %>' CssClass="text" ClientIDMode="Static" />
                            </div>
                        </div>

                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">
                    </div>
                </LayoutTemplate>


            </asp:ListView>

        </div>
        <div class="col-md-3 col-sm-4 ">
        </div>
    </div>






</asp:Content>

