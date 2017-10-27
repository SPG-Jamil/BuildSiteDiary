<%@ Page Title="" Language="C#" MasterPageFile="~/BSDMaster.Master" AutoEventWireup="true" CodeBehind="RoadMap.aspx.cs" Inherits="BSD.RoadMap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,900" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:700" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <!-- Body Start -->
    <div class="app-container-without-bg">
        <div class="row">
            <div class="col-sm-6 col-md-3">
                <div class="app-menu-tile">
                    <a href="#BSDSetup" data-toggle="modal" role="button" style="text-decoration: none;">
                        <div class="app-menu-image">
                            <img src="Content/Image/SDS.png" />
                        </div>
                        <div class="app-menu-description">SITE DIARY SETUP</div>
                    </a>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="app-menu-tile">
                    <a href="#SAR" data-toggle="modal" role="button" style="text-decoration: none;">


                        <div class="app-menu-image">
                            <img src="Content/Image/DAS.png" />
                        </div>
                        <div class="app-menu-description">DAILY ACTIVITY</div>
                    </a>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="app-menu-tile">
                    <a href="#SWP" data-toggle="modal" role="button" style="text-decoration: none;">
                        <div class="app-menu-image">
                            <img src="Content/Image/QA.png" />
                        </div>
                        <div class="app-menu-description">QUALITY ASSURANCE</div>
                    </a>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="app-menu-tile">
                    <a href="#RM" data-toggle="modal" role="button" style="text-decoration: none;">
                        <div class="app-menu-image">
                            <img src="Content/Image/REP.png" />
                        </div>
                        <div class="app-menu-description">REPORTS</div>
                    </a>
                </div>
            </div>
        </div>
        <div class="row m-t-35">
            <div class="col-md-4">
                <div class="app-menu-small-tile">
                    <div class="app-menu-small-image">
                        <img src="Content/Image/DSA.png" />
                    </div>
                    <div class="app-menu-small-description">Days Site Activities</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="app-menu-small-tile">
                    <div class="app-menu-small-image">
                        <img src="Content/Image/YPIP.png" />
                    </div>
                    <div class="app-menu-small-description">PROJECT PROGRESS & CONTRACTOR INVOICE</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="app-menu-small-tile">
                    <div class="app-menu-small-image">
                        <img src="Content/Image/YPBL.png" />
                    </div>
                    <div class="app-menu-small-description">YOUR PROJECT BY LOCATION</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="app-menu-small-tile">
                    <div class="app-menu-small-image">
                        <img src="Content/Image/IFFI.png" />
                    </div>
                    <div class="app-menu-small-description">INFORMATION FOR FINANCIAL INSTITUTION</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="app-menu-small-tile">
                    <div class="app-menu-small-image">
                        <img src="Content/Image/IFPO.png" />
                    </div>
                    <div class="app-menu-small-description">INFORMATION FOR PROJECT OWNER</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="app-menu-small-tile">
                    <div class="app-menu-small-image">
                        <img src="Content/Image/IFRB.png" />
                    </div>
                    <div class="app-menu-small-description">INFORMATION FOR REGULATORY BODY</div>
                </div>
            </div>
        </div>
    </div>
    <!-- Body End -->

    <div id="BSDSetup" class="modal fade " role="dialog">
        <div class="modal-dialog modal-lg">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close closeBSDSetup" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                        <i class="fa fa-arrow-left" id="prevToSetup" style="margin-right: 20px; display: inline-block; font-size: 20px; color: black; cursor: pointer;"></i>
                        <%= Get("Sitediarysetup") %>

                        <asp:Label ID="bsdMap" runat="server" Style="color: #e85a4b; font-size: 23px; font-weight: 900; font-family: 'Roboto' !important; margin-right: 15PX;"></asp:Label>

                        <span style="float: right; padding-right: 10PX; margin-right: 40px;">
                            <i class="fa fa-th-list tooltips" data-original-title="List View"
                                data-rel="tooltip" title="" data-placement="bottom"
                                style="color: CRIMSON; cursor: pointer; display: inline; font-size: 21px; margin-right: 10px;" id="lViewS"></i>
                            <i class="fa fa-th-large tooltips"
                                data-original-title="Thumbnail View" data-rel="tooltip" title="" data-placement="bottom"
                                style="color: black; cursor: pointer; display: inline; font-size: 21px;"
                                id="TViewS"></i>

                        </span>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row" id="SSetupChild">
                        <div class="parentcard">
                            <div class="col-md-12" style="margin-bottom: 0px; text-transform: uppercase;">
                                <h2 class="cardsH2">Essential Setup<i class="fa fa-question-circle" style="font-size: 26px; color: #848484; display: inline-block; float: right; cursor: pointer; padding-top: 0px; margin-top: 4px;" data-toggle="tooltip" title="In this section we define the business subcategories and gst rate" data-placement="left"></i>
                                </h2>
                            </div>
                            <div class="col-md-4">
                                <div class="modal-card" id="MMPS_P">
                                    <div class="modal-card-heading">1</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/MISCPARAM.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("MiscParam") %></div>
                                </div>
                            </div>
                        </div>
                        <div class="parentcard">
                            <div class="col-md-12" style="margin-bottom: 0px; margin-top: 20px; text-transform: uppercase;">
                                <h2 class="cardsH2">Resources Setup<i class="fa fa-question-circle" style="font-size: 26px; color: #848484; display: inline-block; float: right; cursor: pointer; padding-top: 0px; margin-top: 4px;" data-toggle="tooltip" title="In this section we define the business profiles and standard resources which works on projects" data-placement="left"></i>
                                </h2>
                            </div>
                            <div class="col-md-4">
                                <div class="modal-card" id="MBP_P">
                                    <div class="modal-card-heading">2</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/BPR.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("BusinessProfile") %></div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <a runat="server" href="OfficeTitles.aspx">
                                    <div class="modal-card" id="OT">
                                        <div class="modal-card-heading">3</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/OFFTITLE.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("OffTitle") %></div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-md-4">
                                <a runat="server" href="ConstructionManPower.aspx">
                                    <div class="modal-card" id="CMP">
                                        <div class="modal-card-heading">4</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/CONSMANP.jpg" />
                                        </div>
                                        <div class="modal-card-footer">Construction Man Power</div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="parentcard">
                            <div class="col-md-12" style="margin-bottom: 0px; margin-top: 20px; text-transform: uppercase;">
                                <h2 class="cardsH2">BILLING & Activities Setup<i class="fa fa-question-circle" style="font-size: 26px; color: #848484; display: inline-block; float: right; cursor: pointer; padding-top: 0px; margin-top: 4px;" data-toggle="tooltip" title="In this section we define the standard billing stages with phases and activities" data-placement="left"></i>
                                </h2>
                            </div>
                            <div class="col-md-4">
                                <a runat="server" href="BillingStages.aspx">
                                    <div class="modal-card" id="BIS">
                                        <div class="modal-card-heading">5</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/BSTAG.jpg" />
                                        </div>
                                        <div class="modal-card-footer">Billing Stages</div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a runat="server" href="ConstructionPhases.aspx">
                                    <div class="modal-card" id="CP">
                                        <div class="modal-card-heading">6</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/CP.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("constrphases") %></div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-md-4">
                                <a runat="server" href="ActivitiesByPhases.aspx">
                                    <div class="modal-card" id="ABP">
                                        <div class="modal-card-heading">7</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/ACTBY.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("ActByPhases") %></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="parentcard">
                            <div class="col-md-12" style="margin-bottom: 0px; margin-top: 20px; text-transform: uppercase;">
                                <h2 class="cardsH2">Project Setup<i class="fa fa-question-circle" style="font-size: 26px; color: #848484; display: inline-block; float: right; cursor: pointer; padding-top: 0px; margin-top: 4px;" data-toggle="tooltip" title="In this section we define the projects and its details" data-placement="left"></i>
                                </h2>
                            </div>

                            <div class="col-md-4">
                                <a runat="server" href="ProjectHeader.aspx">
                                    <div class="modal-card" id="PM">
                                        <div class="modal-card-heading">8</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/PHEA.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("PrjMaker") %></div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-md-4">
                                <a runat="server" href="ProjectDetail.aspx">
                                    <div class="modal-card" id="PP">
                                        <div class="modal-card-heading">9</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/PD.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("PrjProfile") %></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="parentcard">
                            <div class="col-md-12" style="margin-bottom: 0px; margin-top: 20px; text-transform: uppercase;">
                                <h2 class="cardsH2">Others<i class="fa fa-question-circle" style="font-size: 26px; color: #848484; display: inline-block; float: right; cursor: pointer; padding-top: 0px; margin-top: 4px;" data-toggle="tooltip" title="In this section we define the users which can run BSD, also user can submit the drawings and attachments of each project too" data-placement="left"></i>
                                </h2>
                            </div>
                            <div class="col-md-4">
                                <a runat="server" href="SystemAccessManagement.aspx">
                                    <div class="modal-card" id="MSAM">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/SYSACC.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("SysAccManag") %></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <div class="modal-card" id="MQL_P">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/MNGQL.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("mngQuickLinks") %></div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <a runat="server" href="ConstructionCategory.aspx">
                                    <div class="modal-card" id="CCC">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/ccateg_.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("CCC") %></div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-md-4">
                                <a runat="server" href="SmsAndEmailParameters.aspx">
                                    <div class="modal-card" id="SAE">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/smsandemail_.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("smsAndEmailParameters") %></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a runat="server" href="LicenseeProfile.aspx" id="LPr">
                                    <div class="modal-card" id="LD">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/LP_.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("licnProfile") %></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="MQL" style="display: none;">

                        <div class="col-md-6">
                            <a runat="server" href="Standards.aspx">
                                <div class="modal-card" id="STND">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/stndrd_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("standards") %></div>
                                </div>
                            </a>
                        </div>

                        <div class="col-md-6">
                            <a runat="server" href="Attachments.aspx">
                                <div class="modal-card" id="AT">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/attach_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("Attchmnt") %></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="row" id="MMPS" style="display: none;">

                        <div class="col-md-6">
                            <a runat="server" href="BusinessSubCategories.aspx">
                                <div class="modal-card" id="BSC">
                                    <div class="modal-card-heading">1</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/bsnssubcateg_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("BsnsSubCat") %></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6">
                            <a runat="server" href="GSTRate.aspx">
                                <div class="modal-card" id="GR">
                                    <div class="modal-card-heading">2</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/gst_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("GstRate") %></div>
                                </div>
                            </a>
                        </div>


                    </div>
                    <div class="row" id="MBP" style="display: none;">
                        <div class="col-md-4">
                            <a runat="server" href="Developer.aspx">
                                <div class="modal-card" id="D">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/devp_.png" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("devp") %></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a runat="server" href="Builder.aspx">
                                <div class="modal-card" id="B">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/bldr_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("bldr") %></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a runat="server" href="Contractor.aspx">
                                <div class="modal-card" id="CN">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/cntrcr_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("cntrcr") %></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a runat="server" href="Supplier.aspx">
                                <div class="modal-card" id="S">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/supp_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("supp") %></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a runat="server" href="Consultant.aspx">
                                <div class="modal-card" id="CO">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/conclt_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("conclt") %></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a runat="server" href="BuildingInspector.aspx">
                                <div class="modal-card" id="BI">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/bldinsp_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("bldinsp") %></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a runat="server" href="BuildingSurveyor.aspx">
                                <div class="modal-card" id="BS">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/bldsurv_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("bldsurv") %></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a runat="server" href="PrivateCertifier.aspx">
                                <div class="modal-card" id="PC">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/pcertfr_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("pcertfr") %></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a runat="server" href="QuantitySurveyor.aspx">
                                <div class="modal-card" id="QS">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/qtysury_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("qtysury") %></div>
                                </div>
                            </a>
                        </div>

                        <div class="col-md-4">
                            <a runat="server" href="FinancialInstitution.aspx">
                                <div class="modal-card" id="FI">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/fininst_.png" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("fininst") %></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a runat="server" href="BuildingOwner.aspx">
                                <div class="modal-card" id="BO">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/lp.png" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("bldo") %></div>
                                </div>
                            </a>
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </div>
    <div class="modal fade" id="SAR" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close closeRW" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                        <i class="fa fa-arrow-left" id="RW_Back" style="margin-right: 20px; display: inline-block; font-size: 20px; color: black; cursor: pointer;"></i>
                        DAILY ACTIVITY
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row clearfix" id="RW">
                        <div class="col-md-3">
                            <a runat="server" href="Dailylog.aspx">
                                <div class="modal-card" id="DL">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/DLOG_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("Dlog") %></div>
                                </div>
                            </a>
                        </div>

                        <div class="col-md-3">
                            <a runat="server" href="PreviousDailylog.aspx" id="PDailL">
                                <div class="modal-card" id="PDL">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/pdlog_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("PrevDLog") %></div>
                                </div>
                            </a>
                        </div>

                        <div class="col-md-6">
                            <a runat="server" href="UploadInvoice.aspx" id="UIN">
                                <div class="modal-card" id="UI">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/cntrcrinvoice_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("UploadInvoice") %></div>
                                </div>
                            </a>
                        </div>


                    </div>
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <div class="modal fade" id="SWP" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close closeSWP" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                        <i class="fa fa-arrow-left" id="SWPBack" style="margin-right: 20px; display: inline-block; font-size: 20px; color: black; cursor: pointer;"></i>
                        <%= Get("siteworkprogress") %>
                    </h4>
                </div>
                <div class="modal-body">

                    <div class="row clearfix" id="SWP2">

                        <div class="col-md-4">
                            <a runat="server" href="InspectionAndCertification.aspx">
                                <div class="modal-card" id="IAC">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/inspandcert_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("InspectionAndCertification") %></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a runat="server" href="HandoverWalkthrough.aspx">
                                <div class="modal-card" id="HWT">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/handover_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("HandoverWalkthrough") %></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a runat="server" href="WHSChecklist.aspx" id="A2">
                                <div class="modal-card" id="WHS">
                                    <div class="modal-card-heading">&nbsp;</div>
                                    <div class="modal-card-body">
                                        <img src="Content/Image/checklist_.jpg" />
                                    </div>
                                    <div class="modal-card-footer"><%= Get("Whschecklist") %></div>
                                </div>
                            </a>
                        </div>

                    </div>
                </div>

            </div>

        </div>

    </div>

    <div class="modal fade" id="RM" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close " data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                        <i class="fa fa-arrow-left" id="RMBack" style="margin-right: 20px; display: inline-block; font-size: 20px; color: black; cursor: pointer;"></i>
                        Reports

                        <span style="float: right; padding-right: 10PX; margin-right: 40px;">
                            <i class="fa fa-th-list tooltips" data-original-title="List View"
                                data-rel="tooltip" title="" data-placement="bottom" style="color: BLACK; cursor: pointer; display: inline; font-size: 21px; margin-right: 10px;" id="lView"></i>
                            <i class="fa fa-th-large tooltips"
                                data-original-title="Thumbnail View" data-rel="tooltip" title="" data-placement="bottom"
                                style="color: CRIMSON; cursor: pointer; display: inline; font-size: 21px;"
                                id="TView"></i>

                        </span></h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div id="ThumbView">
                            <div class="col-md-4">
                                <a runat="server" href="Report.aspx?Report=DailyLogReport&RPage=DLRP">
                                    <div class="modal-card" id="DLRP">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/dlr_.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("dailylgrprt") %></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a runat="server" href="Report.aspx?Report=AdditionalWork&RPage=AWR">
                                    <div class="modal-card AWR">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/adwrkr_.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("AddWork") %></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a runat="server" href="Report.aspx?Report=Concerns&RPage=CWR">
                                    <div class="modal-card CWR">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/cncrn_.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("Cncrn") %></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a runat="server" href="Report.aspx?Report=ProjectParticipantsList&RPage=PPR">
                                    <div class="modal-card PPR">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/cntrcrinvoice_.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("PrjPartcList") %></div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-md-4">
                                <a runat="server" href="Report.aspx?Report=ProjectExecutionTimeTable&RPage=PETTR">
                                    <div class="modal-card PETTR">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/prjexectime_.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("PrjExecTimeTabl") %></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a id="A3" runat="server" href="Report.aspx?Report=ProjectExecutionStatusByTaskGrid&RPage=PESBTG">
                                    <div class="modal-card PESR">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/prjexecstat.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("PrjExecStatus") %></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a id="A1" runat="server" href="Report.aspx?Report=ProjectExecutionStatusByTaskGrid&RPage=PESBTG">
                                    <div class="modal-card PESBTG">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/prjplantsk_.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("PESBTG") %></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-5">
                                <a runat="server" href="Report.aspx?Report=ListOfInspectionsAndCertificates&RPage=LOIACR">
                                    <div class="modal-card LOIACR">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/inspandcertr_.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("LstOfInspAndCert") %></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a runat="server" href="Report.aspx?Report=ProjectsList&RPage=PLIST">
                                    <div class="modal-card PLIST">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/prjlist_.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("PLIST") %></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a runat="server" href="Report.aspx?Report=ProjectPhotoAlbum&RPage=PPALBM">
                                    <div class="modal-card PPALBM">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/prjphoto_.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("PrjPhotAlbm") %></div>
                                    </div>
                                </a>
                            </div>


                            <div class="col-md-4">
                                <a runat="server" href="Report.aspx?Report=ActivitiesByPhases&RPage=ACTBP">
                                    <div class="modal-card ACTBP">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/actbyphs_.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("ActByPhasesReport") %></div>
                                    </div>
                                </a>
                            </div>


                            <div class="col-md-4">
                                <a runat="server" href="Report.aspx?Report=ProjectPlan&RPage=PRJPLN">
                                    <div class="modal-card PRJPLN">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/prjplantimebar_.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("ProjPlan") %></div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-md-6">
                                <a runat="server" href="Report.aspx?Report=ProjectProgressiveInvoice&RPage=PrjProgsvInvc">
                                    <div class="modal-card PrjProgsvInvc">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/prjprgrsvinc_.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("PrjProgsvInvc") %></div>
                                    </div>
                                </a>
                            </div>


                            <div class="col-md-6">
                                <a runat="server" href="Report.aspx?Report=ProjectBillingPlan&RPage=PrjBillPlan">
                                    <div class="modal-card PrjBillPlan">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/prjblngplan_.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("PrjBillPlan") %></div>
                                    </div>
                                </a>
                            </div>


                            <div class="col-md-12">
                                <a runat="server" href="Report.aspx?Report=PrjPhseAndActStatByBlngPlan&RPage=PPHAABBP">
                                    <div class="modal-card PPHAABBP">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/BSTAG.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("PrjPhseAndActStatByBlngPlan") %></div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-md-12">
                                <a runat="server" href="Report.aspx?Report=ListOfInspectedPhaseAndActivity&RPage=loipaa">
                                    <div class="modal-card loipaa">
                                        <div class="modal-card-heading">&nbsp;</div>
                                        <div class="modal-card-body">
                                            <img src="Content/Image/phasesinspect_.jpg" />
                                        </div>
                                        <div class="modal-card-footer"><%= Get("loipaa") %></div>
                                    </div>
                                </a>
                            </div>


                        </div>
                        <div id="ListView" class="col-md-12" style="background: white; display: none">
                            <ul>
                                <a runat="server" href="Report.aspx?Report=DailyLogReport&RPage=DLRP&RV=L">
                                    <li class="DLRP">
                                        <%= Get("dailylgrprt") %>
                                    </li>
                                </a><a runat="server" href="Report.aspx?Report=AdditionalWork&RPage=AWR&RV=L">
                                    <li class="AWR">
                                        <%= Get("AddWork") %>
                                    </li>
                                </a><a runat="server" href="Report.aspx?Report=Concerns&RPage=CWR&RV=L">
                                    <li class="CWR">
                                        <%= Get("Cncrn") %>
                                    </li>
                                </a><a runat="server" href="Report.aspx?Report=ProjectParticipantsList&RPage=PPR&RV=L">
                                    <li class="PPR">
                                        <%= Get("PrjPartcList") %>
                                    </li>
                                </a><a runat="server" href="Report.aspx?Report=ProjectExecutionTimeTable&RPage=PETTR&RV=L">
                                    <li class="PETTR">
                                        <%= Get("PrjExecTimeTabl") %>
                                    </li>
                                </a>
                                <a runat="server" href="Report.aspx?Report=ProjectExecutionStatus&RPage=PESR&RV=L">
                                    <li class="PESR">
                                        <%= Get("PrjExecStatus") %>
                                    </li>
                                </a>

                                <a runat="server" href="Report.aspx?Report=ProjectExecutionStatusByTaskGrid&RPage=PESBTG&RV=L">
                                    <li class="PESBTG">
                                        <%= Get("PESBTG") %>
                                    </li>
                                </a>


                                <a runat="server" href="Report.aspx?Report=ProjectsList&RPage=PLIST&RV=L">
                                    <li class="PLIST">
                                        <%= Get("PList") %>
                                    </li>
                                </a>


                                <a runat="server" href="Report.aspx?Report=ListOfInspectionsAndCertificates&RPage=LOIACR&RV=L">
                                    <li class="RPage">
                                        <%= Get("LstOfInspAndCert") %>
                                    </li>
                                </a><a runat="server" href="Report.aspx?Report=ListOfInspectedPhaseAndActivity&RPage=loipaa&RV=L">
                                    <li class="RPage">
                                        <%= Get("loipaa") %>
                                    </li>
                                </a><a runat="server" href="Report.aspx?Report=ProjectPhotoAlbum&RPage=PPALBM&RV=L">
                                    <li class="PPALBM">
                                        <%= Get("PrjPhotAlbm") %>
                                    </li>
                                </a><a runat="server" href="Report.aspx?Report=ActivitiesByPhases&RPage=ACTBP">
                                    <li class="ACTBP">
                                        <%= Get("ActByPhasesReport") %>
                                    </li>
                                </a>
                                <a runat="server" href="Report.aspx?Report=ProjectPlan&RPage=PRJPLN">
                                    <li class="PRJPLN">
                                        <%= Get("ProjPlan") %>
                                    </li>
                                </a>
                                <a runat="server" href="Report.aspx?Report=ProjectProgressiveInvoice&RPage=PrjProgsvInvc">
                                    <li class="PrjProgsvInvc">
                                        <%= Get("PrjProgsvInvc") %>
                                    </li>
                                </a>
                                <a runat="server" href="Report.aspx?Report=ProjectBillingPlan&RPage=PrjBillPlan">
                                    <li class="PrjBillPlan">
                                        <%= Get("PrjBillPlan") %>
                                    </li>
                                </a>
                                <a runat="server" href="Report.aspx?Report=PrjPhseAndActStatByBlngPlan&RPage=PPHAABBP">
                                    <li class="PPHAABBP">
                                        <%= Get("PrjPhseAndActStatByBlngPlan") %>
                                    </li>
                                </a>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script>
        a = '<%= Get("BusinessProfile") %>';
        b = '<%= Get("MiscParam") %>';
        c = '<%= Get("mngQuickLinks") %>';

        $('#home,#back').hide();
    </script>
    <script src="Scripts/RoadMap.js"></script>
</asp:Content>

