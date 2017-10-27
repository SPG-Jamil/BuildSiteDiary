<%@ Page Title="" Language="C#" MasterPageFile="~/BSDMaster.Master" AutoEventWireup="true" CodeBehind="OfficeTitles.aspx.cs" Inherits="BSD.OfficeTitles" %>

<%@ Register TagPrefix="up" Namespace="BSD.User_Control" Assembly="BSD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Style/ChildPages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="app-container-without-bg p-t-15">
        <!-- Error Handling section starts -->
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
        <!-- Error handling section ends -->

        <div class="app-body">
            <h1 class="app-page-heading"><%= Get("OffTitle")%></h1>
            <ul class=" nav app-tab-blue nav-tabs nav-justified">
                <li class="active"><a data-toggle="tab" href="#officetitles"><%= Get("DfnMntnOffcTitle")%></a></li>
                <li><a data-toggle="tab" href="#importfromtemplate"><%= Get("ImportFromTemplate")%></a></li>
                <li><a data-toggle="tab" href="#importfromexcel"><%= Get("ImportFromExcelFile")%></a></li>
            </ul>
            <div class="tab-content">
                <div id="officetitles" class="tab-pane fade in active">
                    <div class="app-tab-body">
                        <div class="row">
                            <div class="col-md-10 p-l-0">
                                <div class="col-md-4">
                                    <label class="app-data-label"><%= Get("titledscrptn")%></label>
                                    <asp:TextBox CssClass="form-control app-data-field" ID="TitleDescriptionBox" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <label class="app-data-label"><%= Get("titleabrivtn")%></label>
                                    <asp:TextBox runat="server" ID="TitleAbbreviationBox" CssClass="form-control app-data-field"></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <div class="app-buttons-container">
                                        <asp:Button ID="ButtonSubmit" class="btn app-blue-button" runat="server" OnClick="ButtonSubmit_OnClick" />
                                        <asp:Button ID="ButtonClear" class="btn app-grey-button" runat="server" OnClick="ButtonClear_OnClick" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control app-data-field" ID="SearchBox" runat="server" />
                                    <span class="input-group-btn">
                                        <asp:Button class="btn app-transparent-blue-button" ID="SearchButton" OnClick="SearchButton_OnClick" runat="server" />
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="row m-t-20">
                            <div class="col-md-12">
                                <asp:GridView AutoGenerateColumns="false" CssClass="table table-hover app-gridview" ID="ExistingOfficeTitle" runat="server">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <img src="Content/Image/Delete.png" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="A" HeaderText="CustomerID" />
                                        <asp:BoundField DataField="B" HeaderText="CustomerID" />
                                        <asp:BoundField DataField="C" HeaderText="CustomerID" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <img src="Content/Image/Delete.png" />
                                                <img src="Content/Image/Edit.png" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="importfromtemplate" class="tab-pane fade">
                    <div class="app-tab-body">
                        <div class="row">
                            <div class="col-md-8">
                                <h3 class="app-page-sub-heading"><i class="fa fa-info-circle" aria-hidden="true"></i><%= Get("YuCnIprtPDefOfsTttl")%></h3>
                            </div>
                            <div class="col-md-4">
                                <asp:Button runat="server" ID="ImportOfficeTitlesFromTemp" CssClass="btn app-grey-button" Text="Import Office Titles From Template" />
                            </div>
                        </div>
                    </div>
                </div>
                <div id="importfromexcel" class="tab-pane fade">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script>
        $('#backNav').click(function () {
            window.location.href = "RoadMap.aspx?Option=3&RPage=BSC";
        });
    </script>
</asp:Content>
