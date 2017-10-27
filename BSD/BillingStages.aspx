<%@ Page Title="" Language="C#" MasterPageFile="~/BSDMaster.Master" AutoEventWireup="true" CodeBehind="BillingStages.aspx.cs" Inherits="BSD.BillingStages" %>

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

        <div class="app-body">
            <h1 class="app-page-heading"><%= Get("BillingStages")%></h1>
            <hr />
            <div class="app-body-content">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="app-page-sub-heading"><%= Get("StandardBillingStages")%></h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <label class="app-data-label"><%= Get("BlSeqNum")%></label>
                        <asp:TextBox ID="BillSequenceNumBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-5">
                        <label class="app-data-label"><%= Get("BillDesc")%></label>
                        <asp:TextBox ID="BillDescriptionBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <label class="app-data-label"><%= Get("BillAmnt")%></label>
                        <asp:TextBox ID="BillAmountBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <div class="app-buttons-container">
                            <asp:Button ID="ButtonSubmit" class="btn app-blue-button" runat="server" OnClick="ButtonSubmit_OnClick" />
                            <asp:Button ID="ButtonClear" class="btn app-grey-button" runat="server" OnClick="ButtonClear_OnClick" />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <h2 class="app-page-sub-heading"><%= Get("ExistingBillingStages")%></h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group">
                            <asp:TextBox runat="server" ID="SearchBox" CssClass="form-control app-data-field"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:Button runat="server" ID="SearchButton" CssClass="btn app-transparent-blue-button" OnClick="SearchButton_OnClick" />
                            </span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="row m-t-20">
                        <div class="col-md-12">
                            <asp:GridView AutoGenerateColumns="false" CssClass="table table-hover app-gridview" ID="BillingStagesGrid" runat="server">
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
