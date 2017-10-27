<%@ Page Title="" Language="C#" MasterPageFile="~/BSDMaster.Master" AutoEventWireup="true" CodeBehind="GSTRate.aspx.cs" Inherits="BSD.GSTRate" %>



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
            <h1 class="app-page-heading"><%= Get("GstRate")%></h1>
            <hr />
            <div class="app-tab-body">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="app-page-sub-heading"><%= Get("GSTratemakr")%></h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label class="app-data-label"><%= Get("newGSTrate%")%></label>
                        <asp:TextBox class="form-control app-data-field" ID="GSTRatePercentageBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <label class="app-data-label"><%= Get("implmntatnDate")%></label>
                        <asp:TextBox CssClass="form-control app-data-field" ID="ImplementationDateBox" runat="server"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" Format="dd/MM/yyyy"
                            TargetControlID="ImplementationDateBox"></ajaxToolkit:CalendarExtender>
                    </div>
                    <div class="col-md-3 ">
                        <div class="app-buttons-container">
                            <asp:Button class="btn app-blue-button" ID="ButtonSubmit" runat="server" OnClick="ButtonSubmit_OnClick" />
                            <asp:Button class="btn app-grey-button" ID="ButtonClear" runat="server" OnClick="ButtonClear_OnClick" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="row m-t-20">
                        <div class="col-md-12">
                            <asp:GridView AutoGenerateColumns="false" CssClass="table table-hover app-gridview" ID="GSTRateGrid" runat="server">
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
