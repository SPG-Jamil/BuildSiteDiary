<%@ Page Title="" Language="C#" MasterPageFile="~/BSDMaster.Master" AutoEventWireup="true" CodeBehind="Contractor.aspx.cs" Inherits="BSD.Contractor"  %>
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
            <h1 class="app-page-heading"><%= Get("cntrcr")%></h1>

            <ul class=" nav app-tab-blue nav-tabs nav-justified">
                <li class="active"><a data-toggle="tab" href="#business"><%= Get("DefNewBsns")%></a></li>
                <li><a data-toggle="tab" href="#contact"><%= Get("DfnNewBsnsCtcs")%></a></li>
                <li><a data-toggle="tab" href="#existing"><%= Get("ExtBsns")%></a></li>
            </ul>
            <div class="tab-content">
                <div id="business" class="tab-pane fade in active">
                    <div class="app-tab-body">
                        <div class="row">
                            <div class="col-md-12">
                                <h2 class="app-page-sub-heading"><%= Get("IniDetl")%></h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-10 p-l-0">
                                <div class="col-md-3">
                                    <label class="app-data-label"><%= Get("cntrcrStats")%></label>
                                    <asp:TextBox class="form-control app-data-field" ID="ContractorStatusBox" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-5">
                                    <label class="app-data-label"><%= Get("BsnsName")%></label>
                                    <asp:TextBox ID="BusinessNameBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <label class="app-data-label"><%= Get("BsnsTradAs")%></label>
                                    <asp:TextBox ID="BusinessTradingAsBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label class="app-data-label"><%= Get("BsnsSubCat")%></label>
                                    <asp:TextBox ID="BusinessSubCatBox" data-toggle="modal" data-target="#SubCategoriesModal" ReadOnly="True" class="form-control app-data-field" runat="server" style="cursor: pointer; background-color: #fcfcfc;"></asp:TextBox>
                                    <div class="modal fade" id="SubCategoriesModal" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog  modal-lg">
                                            <div class="modal-content white-body">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title"><%= Get("BsnsSubCat")%></h4>
                                                </div>
                                                <div class="modal-body">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="app-data-label"><%= Get("ABN")%></label>
                                    <asp:TextBox ID="AbnBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <label class="app-data-label"><%= Get("ACN")%></label>
                                    <asp:TextBox ID="AcnBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <label class="app-data-label"><%= Get("GSTApp")%></label>
                                    <asp:DropDownList ID="GstAppDpd" class="form-control app-data-field" runat="server" OnSelectedIndexChanged="GstAppDpd_OnSelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <label class="app-data-label"><%= Get("GSTRegstrn")%></label>
                                    <asp:TextBox ID="GstRegBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <label class="app-data-label"><%= Get("GstRate%")%></label>
                                    <asp:TextBox ID="GstPercentageBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <table  >
                                    <tr>
                                        <td class="app-data-label"><%= Get("BsnsLogoImg")%></td>
                                        <td>
                                            <img src="Content/Image/Info.png" class="pull-right" /></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2">
                                            <asp:Image ID="Image1" class="img-responsive m-t-5 m-r-20" runat="server" src='Content/Image/ImageDummy.png' /></td>
                                        <td>
                                            <img src="Content/Image/UploadSmall.png" class="img-responsive"/><br />
                                            <img src="Content/Image/RemoveSmall.png" class="m-t-10 img-responsive" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Image ID="Image2" class="img-responsive" runat="server" onerror="this.onload = null; this.src='Content/Image/ImageDummy.png';" /></td>
                                        <td>
                                            <img src="Content/Image/RemoveSmall.png" class="img-responsive" runat="server" visible="false" /></td>
                                    </tr>
                                </table>


                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <h2 class="app-page-sub-heading"><%= Get("CntcDtls")%></h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label class="app-data-label"><%= Get("Phn")%></label>
                                <asp:TextBox ID="PhoneNumBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label class="app-data-label"><%= Get("Fax")%></label>
                                <asp:TextBox ID="FaxNumBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label class="app-data-label"><%= Get("Email")%></label>
                                <asp:TextBox ID="EmailBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label class="app-data-label"><%= Get("WebAdres")%></label>
                                <asp:TextBox ID="WebAddressBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <h2 class="app-page-sub-heading"><%= Get("ADDRESSDETAILS")%></h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <label class="app-data-label"><%= Get("UnitStrtNumb")%></label>
                                <asp:TextBox ID="StreetNumBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label class="app-data-label"><%= Get("StrtName")%></label>
                                <asp:TextBox ID="StreetNameBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label class="app-data-label"><%= Get("CitySubrb")%></label>
                                <asp:TextBox ID="CityOrSubarbanAddressBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <label class="app-data-label"><%= Get("State")%></label>
                                <asp:TextBox ID="StateBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <label class="app-data-label"><%= Get("PstCode")%></label>
                                <asp:TextBox ID="PostalCodeBox" class="form-control app-data-field" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label class="app-data-label"><%= Get("Cntry")%></label>
                                <asp:DropDownList ID="CountryBox" class="form-control app-data-field" runat="server" OnSelectedIndexChanged="CountryBox_OnSelectedIndexChanged"></asp:DropDownList>
                            </div>

                            <div class="col-md-3 pull-right">
                                <div class="app-buttons-container">
                                    <asp:Button ID="ButtonSubmit" class="btn app-blue-button" runat="server" OnClick="ButtonSubmit_OnClick" />
                                    <asp:Button ID="ButtonClear" class="btn app-grey-button" runat="server" OnClick="ButtonClear_OnClick" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="contact" class="tab-pane fade">
                    <div class="app-tab-body">
                        <div class="row">
                            <div class="col-md-3">
                                <label class="app-data-label"><%= Get("SlctCotractor")%></label>
                                <asp:DropDownList ID="SelectContractor" class="form-control app-data-field" runat="server" OnSelectedIndexChanged="SelectContractor_OnSelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="col-md-3">
                                <label class="app-data-label"><%= Get("BsnsName")%></label>
                                <asp:TextBox ID="BusinessNameDBC" class="form-control app-data-field" ReadOnly="True" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label class="app-data-label"><%= Get("BsnsTradAs")%></label>
                                <asp:TextBox ID="BusinessTradingAsDBC" class="form-control app-data-field" ReadOnly="True" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <hr class="m-b-20"/>
                        <div class="row">
                            <div class="col-md-3">
                                <label class="app-data-label"><%= Get("Name")%></label>
                                <asp:TextBox ID="NameDBC" class="form-control app-data-field" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label class="app-data-label"><%= Get("Mobile")%></label>
                                <asp:TextBox ID="MobileDBC" class="form-control app-data-field" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label class="app-data-label"><%= Get("Phn")%></label>
                                <asp:TextBox ID="PhoneDBC" class="form-control app-data-field" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label class="app-data-label"><%= Get("Email")%></label>
                                <asp:TextBox ID="EmailDBC" class="form-control app-data-field" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-9">
                                <label class="app-data-label"><%= Get("Comments")%></label>
                                <asp:TextBox TextMode="MultiLine" ID="CommentsBoxDBC" class="form-control app-data-field" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <div class="app-buttons-container">
                                    <asp:Button ID="SubmitButton" class="btn app-blue-button" runat="server" OnClick="SubmitButton_OnClick" />
                                    <asp:Button ID="ClearButton" class="btn app-grey-button" runat="server" OnClick="ClearButton_OnClick" />
                                </div>
                            </div>
                        </div>
                        <div class="row m-t-20">
                            <div class="col-md-12">
                                <asp:GridView AutoGenerateColumns="false" CssClass="table table-hover app-gridview" ID="ContactGrid" runat="server">
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
                <div id="existing" class="tab-pane fade">
                    <div class="app-tab-body">
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
                                <asp:GridView ID="ExistingBusiness" CssClass="table table-hover app-gridview" runat="server" AutoGenerateColumns="false">
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
