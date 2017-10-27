<%@ Page Title="" Language="C#" MasterPageFile="~/BSDMaster.Master" AutoEventWireup="true" CodeBehind="ActivitiesByPhases.aspx.cs" Inherits="BSD.ActivitiesByPhases" %>

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

        <!-- Body Container Jamil 24 Oct 2017 -->
        <div class="app-body">
            <h1 class="app-page-heading"><%= Get("ActByPhases")%></h1>
            <hr />
            <div class="app-tab-body">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="app-page-sub-heading"><%= Get("DefineStandardActivities")%></h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label class="app-data-label"><%= Get("constCateg")%></label>
                        <asp:DropDownList CssClass=" form-control app-data-field" ID="ConstructionCategoryDpd" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ConstructionCategoryDpd_OnSelectedIndexChanged" />
                    </div>
                    <div class="col-md-3">
                        <label class="app-data-label"><%= Get("ConstructionSubCategory")%></label>
                        <asp:DropDownList runat="server" CssClass="form-control app-data-field" ID="ConstructionSubCategoryDpd" AutoPostBack="True" OnSelectedIndexChanged="ConstructionSubCategoryDpd_OnSelectedIndexChanged" />
                    </div>
                    <div class="col-md-3">
                        <label class="app-data-label"><%= Get("ConstructionSubCategoryType")%></label>
                        <asp:DropDownList runat="server" ID="ConstructionSubCategoryTypeDpd" AutoPostBack="True" CssClass="form-control app-data-field" OnSelectedIndexChanged="ConstructionSubCategoryTypeDpd_OnSelectedIndexChanged" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <label class="app-data-label"><%= Get("BillSequence")%></label>
                        <asp:DropDownList runat="server" ID="BillSequenceDpd" AutoPostBack="True" CssClass="form-control app-data-field" OnSelectedIndexChanged="BillSequenceDpd_OnSelectedIndexChanged" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <label class="app-data-label">
                            <%= Get("ConstructionPhase")%>
                        </label>
                        <asp:DropDownList runat="server" ID="ConstructionPhaseDpd" CssClass="form-control app-data-field" AutoPostBack="True" OnSelectedIndexChanged="ConstructionPhaseDpd_OnSelectedIndexChanged" />
                    </div>
                    <div class="col-md-2">
                        <label class="app-data-label"><%= Get("ActCode")%></label>
                        <asp:TextBox runat="server" ID="ActivityCodeBox" CssClass="form-control app-data-field"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <label class="app-data-label"><%= Get("ActDescr")%></label>
                        <asp:TextBox runat="server" ID="ActivityDescriptionBox" CssClass="form-control app-data-field"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <label class="app-data-label"><%= Get("actvtyscqnce")%></label>
                        <asp:TextBox runat="server" ID="ActivitySequenceBox" CssClass="form-control app-data-field"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:CheckBox ID="IsHandOverCheckListItem" runat="server" /><br />
                        <asp:CheckBox ID="RequireInspection" runat="server" /><br />
                        <asp:CheckBox ID="RequireCertification" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="app-buttons-container">
                            <asp:Button class="btn app-blue-button" ID="ButtonSubmit" runat="server" OnClick="ButtonSubmit_OnClick" />
                            <asp:Button class="btn app-grey-button" ID="ButtonClear" runat="server" OnClick="ButtonClear_OnClick" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="app-page-sub-heading"><%= Get("ExistingActivities")%></h2>
                    </div>

                </div>
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
                        <asp:GridView ID="SmsAndEmailGrid" CssClass="table table-hover app-gridview" runat="server" AutoGenerateColumns="false">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script>
        $('#backNav').click(function () {
            window.location.href = "RoadMap.aspx?Option=3&RPage=BSC";
        });
    </script>
</asp:Content>
