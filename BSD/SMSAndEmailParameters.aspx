<%@ Page Title="" Language="C#" MasterPageFile="~/BSDMaster.Master" AutoEventWireup="true" CodeBehind="SMSAndEmailParameters.aspx.cs" Inherits="BSD.SMSAndEmailParameters" %>

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
            <h1 class="app-page-heading"><%= Get("smsAndEmailParameters")%></h1>

            <ul class=" nav app-tab-blue nav-tabs nav-justified">
                <li class="active"><a data-toggle="tab" href="#tab1"><%= Get("EmailAndSMSSettings")%></a></li>
                <li><a data-toggle="tab" href="#tab2"><%= Get("smsconfig")%></a></li>
            </ul>
            <div class="tab-content">
                <div id="tab1" class="tab-pane fade in active">
                    <div class="app-tab-body">
                        <div class="row">
                            <div class="col-md-3">
                                <label class="app-data-label"><%= Get("SelectProject")%></label>
                                <asp:DropDownList CssClass=" form-control app-data-field" ID="SelectProject" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SelectProject_OnSelectedIndexChanged" />
                            </div>
                            <div class="col-md-3">
                                <%-- <asp:Button runat="server" ID="ImportFromOtherProjects" CssClass="btn"/>--%>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <h2 class="app-page-sub-heading"><%= Get("ManageSmsAndEmailRecipents")%></h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="alert alert-warning ">
                                    <i class="fa fa-info-circle"></i>
                                    <span><%= Get("disablecolmnmean")%></span>
                                </div>
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
                        <div class="row">
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
                <div id="tab2" class="tab-pane fade">
                    <div class="app-tab-body">
                        <div class="row">
                            <div class="col-md-3">
                                <label class="app-data-label"><%= Get("SelectProject")%></label>
                                <asp:DropDownList CssClass=" form-control app-data-field" ID="ProjectDrp1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ProjectDrp1_OnSelectedIndexChanged" />
                            </div>
                            <div class="col-md-3">
                                <%-- <asp:Button runat="server" ID="ImportFromOtherProjects" CssClass="btn"/>--%>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <h2 class="app-page-sub-heading"><%= Get("ManageOtherConfiguration")%></h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="alert alert-warning ">
                                    <i class="fa fa-info-circle"></i>
                                    <span><%= Get("disablecolmnmean")%></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control app-data-field" runat="server" ID="SearchBox2"></asp:TextBox>
                                    <span class="input-group-btn">
                                        <asp:Button CssClass="btn app-transparent-blue-button" ID="ButtonSearch2" runat="server" OnClick="ButtonSearch2_OnClick" />
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="row m-t-20">
                            <div class="col-md-12">
                                <asp:GridView ID="GridView1" CssClass="table table-hover app-gridview" runat="server" AutoGenerateColumns="false">
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
        </div>
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script>
        $('#backNav').click(function () {
            window.location.href = "RoadMap.aspx?Option=3&RPage=BSC";
        });
    </script>
</asp:Content>
