<%@ Page Title="" Language="C#" MasterPageFile="~/BSDMaster.Master" AutoEventWireup="true" CodeBehind="BusinessSubCategories.aspx.cs" Inherits="BSD.BusinessSubCategories" %>

<%@ Register TagPrefix="up" Namespace="BSD.User_Control" Assembly="BSD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Style/ChildPages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="app-container-without-bg p-t-15">
        <!-- Error Handling Section By Emad October 21 2017-->
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel ID="ErrorPanel" Visible="False" runat="server">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="app-error alert alert-danger">
                                <div style="padding-top: 5px; display: inline-block;">
                                    <i class="fa fa-exclamation-triangle"></i>
                                    <span style="padding-left: 10px;">
                                        <asp:Literal ID="ErrorDescription" runat="server"></asp:Literal>
                                    </span>
                                </div>
                                <asp:Button ID="ReportError" runat="server" CssClass="btn btn-danger btn-sm pull-right" OnClick="ReportError_OnClick" Text="REPORT TO ADMIN" />
                            </div>
                        </div>
                    </div>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            <div class="row">
                                <up:UpdatePanelProgress runat="server" ID="UpdatePanelProgress" />
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
        <!-- Error Handling Section End -->

        <!-- Body Container Emad 21 Oct 2017 -->
        <div class="app-body">
            <h1 class="app-page-heading"><%= Get("BsnsSubCat")%>
            </h1>
            <ul class=" nav app-tab-blue nav-tabs nav-justified">
                <li class="active"><a data-toggle="tab" href="#tab1"><%= Get("DfnMntnSbCategTitle")%></a></li>
                <li><a data-toggle="tab" href="#tab2"><%= Get("ImportFromTemplate")%></a></li>
                <li><a data-toggle="tab" href="#tab3"><%= Get("ImportFromExcelFile")%></a></li>
            </ul>
            <div class="tab-content">
                <div id="tab1" class="tab-pane fade in active">
                    <div class="app-tab-body">
                        <div class="row">
                            <asp:UpdatePanel ID="UP1" runat="server">
                                <ContentTemplate>
                                    <div class="col-md-2">
                                        <label class="app-data-label"><%= Get("bussnescatgry") %></label>
                                        <asp:DropDownList CssClass=" form-control app-data-field" ID="BusinessCategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="BusinessCategory_OnSelectedIndexChanged"/>
                                    </div>
                                    <div class="col-md-2">
                                        <label class="app-data-label"><%= Get("BUSNSSUBCOTGRYCODE") %></label>
                                        <asp:TextBox class="form-control app-data-field" ID="BusinessSubCategoryCode" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <label class="app-data-label"><%= Get("businesssubcatogy") %></label>
                                        <asp:TextBox class="form-control app-data-field" ID="SubCategoryDescription" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2">
                                        <label class="app-data-label"><%= Get("ABVEVATN") %></label>
                                        <asp:TextBox runat="server" CssClass="form-control app-data-field" ID="Abbreviation"></asp:TextBox>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="app-buttons-container">
                                            <asp:Button class="btn app-blue-button" ID="ButtonSubmit" runat="server" OnClick="ButtonSubmit_OnClick"/>
                                            <asp:Button class="btn app-grey-button" ID="ButtonClear" runat="server" OnClick="ButtonClear_OnClick"/>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                        <asp:UpdatePanel ID="DataUP" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                            <asp:Panel runat="server" DefaultButton="ButtonSearch">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control app-data-field" runat="server" ID="SearchBox"></asp:TextBox>
                                            <span class="input-group-btn">
                                        <asp:Button CssClass="btn app-transparent-blue-button" ID="ButtonSearch" runat="server" OnClick="ButtonSearch_OnClick" />
                                    </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-t-20">
                                    <div class="col-md-12">
                                        <asp:GridView ID="ExistingSubCategories" CssClass="table table-hover app-gridview" AllowPaging="True" OnPageIndexChanging="ExistingSubCategories_OnPageIndexChanging" runat="server" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                                    <HeaderTemplate>
                                                        <img src="Content/Image/Delete.png"/>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chk" runat="server"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Business Category" SortExpression="buss_categ">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("buss_categ") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Business Sub-Category Code" ItemStyle-HorizontalAlign="Center" SortExpression="code">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("code") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Business Sub-Category" SortExpression="descr">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("descr") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Abbreviation" SortExpression="abbr">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("abbr") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <img src="Content/Image/Delete.png" class="m-r-10"/>
                                                        <img src="Content/Image/Edit.png"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel></ContentTemplate>
                        </asp:UpdatePanel>
                       

                    </div>
                </div>
                <div id="tab2" class="tab-pane fade">
                    <div class="app-tab-body">
                    </div>
                </div>
                <div id="tab3" class="tab-pane fade">
                    <div class="app-tab-body">
                    </div>
                </div>
            </div>
        </div>
        <!-- Body Container End-->

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script>
        $('#back').click(function () {
            window.location.href = "RoadMap.aspx?Option=3&RPage=BSC";
        });
    </script>
</asp:Content>
