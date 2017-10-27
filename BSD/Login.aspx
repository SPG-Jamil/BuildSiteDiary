<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BSD.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BSD - LOGIN</title>
    <link href="Content/Style/Bootstrap/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="Content/Style/Bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <link href="Content/Fixer.css" rel="stylesheet" />
    <link rel="shortcut icon" href="#" />
    <link href="Content/Style/Select2/select2.min.css" rel="stylesheet" />
    <link href="Content/Style/Indigo.css" rel="stylesheet" />
    <link href="Content/Style/Master.css" rel="stylesheet" />
    <link href="Content/Style/ChildPages.css" rel="stylesheet" />
    <link href="Content/Style/notify.css" rel="stylesheet" />
    <link href="Content/Style/Pace2.css" rel="stylesheet" />
    <link href="Content/Style/prettify.css" rel="stylesheet" />
    <style>
        input[type=text], input[type=password] {
            color: indigo;
            font-weight: 700;
            font-family: 'Roboto', sans-serif;
        }

            input[type=text]:focus, input[type=password]:focus {
                -webkit-box-shadow: 0 4px 9px rgba(0, 0, 0, 0.19), 0 1px 4px rgba(0, 0, 0, 0.23) !important;
                -ms-box-shadow: 0 4px 9px rgba(0, 0, 0, 0.19), 0 1px 4px rgba(0, 0, 0, 0.23) !important;
                box-shadow: 0 4px 9px rgba(0, 0, 0, 0.19), 0 1px 4px rgba(0, 0, 0, 0.23) !important;
            }
    </style>
</head>
<body class="login-body">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="SManger" runat="server">
        </asp:ScriptManager>
        <div class="m-t-45 col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2">
            <div class="text-center">
                <img src="Content/Image/bsdWhite.png" style="max-width: 270px;" onclick="window.location.reload()" />
            </div>

            <div class="app-login-container">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="LogPanel" DefaultButton="LoginBTN" runat="server" class="m-t-45">
                            <div class="row">
                                <div class="col-md-12">
                                    <input id="UName_Box" class="form-control app-data-field  app-box-shadow" autofocus runat="server" clientidmode="Static" type="text"
                                        style="border: 2px solid #4b0082; height: 45px;" placeholder="Username" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:TextBox ID="PWD_Box" TextMode="Password" class="form-control app-data-field app-box-shadow" runat="server" Style="border: 2px solid #4b0082; height: 45px;" placeholder="Password">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Button class="btn  app-blue-button btn-block app-box-shadow"
                                        OnClick="LoginBTN_OnClick" type="button"
                                        runat="server" ClientIDMode="Static" ID="LoginBTN" Text="SUBMIT" Style="height: 45px;"></asp:Button>
                                </div>
                            </div>
                            <asp:UpdateProgress ID="UpdateProgress2" DisplayAfter="500" runat="server">
                                <ProgressTemplate>
                                    <div class="progress progress-striped active m-t-30">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100"
                                            aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                        </div>
                                    </div>

                                </ProgressTemplate>
                            </asp:UpdateProgress>
                            <div class="row m-t-20">
                                <div class="col-md-12">
                                    <a role="button" href="#ForgotModal" style="color: indigo; font-family: 'Roboto', sans-serif; text-decoration: underline; float: right; font-size: 12px;" data-toggle="modal">Forgot Your Username or Password? </a>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="OwnStaffPanel" Visible="false" runat="server" class="m-t-45">
                            <div class="col-md-12">
                                <label class="app-data-label">Select Project</label>
                                <asp:DropDownList ID="ProjectDrpOwnStaff" AutoPostBack="True" OnSelectedIndexChanged="ProjectDrpOwnStaff_OnSelectedIndexChanged" class="form-control app-data-field" runat="server"></asp:DropDownList>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="DataOwnerPanel" Visible="false" runat="server" class="m-t-45">
                            <div class="col-md-12">
                                <label class="app-data-label">Select Data Owner</label>
                                <asp:DropDownList ID="DataOwner" AutoPostBack="True" OnSelectedIndexChanged="DataOwner_OnSelectedIndexChanged" class="form-control app-data-field" runat="server"></asp:DropDownList>
                            </div>
                            <div class="col-md-12">
                                <label class="app-data-label">Select Project</label>
                                <asp:DropDownList ID="DataOwnerProject" AutoPostBack="True" OnSelectedIndexChanged="DataOwnerProject_OnSelectedIndexChanged" class="form-control app-data-field" runat="server"></asp:DropDownList>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="LoginBTN" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="forgotEmail" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="forgotUserName" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <div class="modal fade" id="ForgotModal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog  ">
                        <div class="modal-content white-body">

                            <div class="modal-body m-t-0 m-b-0" style="padding-bottom: 0px !important;">

                                <div class="row m-t-0">
                                    <div class="col-md-12">
                                        <h2 class="app-page-sub-heading m-t-0 m-b-0">FOR USERNAME</h2>
                                        <label class="app-data-label">Please enter your email address to recieve your username</label>
                                        <div class="input-group">
                                            <asp:TextBox runat="server" ID="EmailBox2" type="email" CssClass="form-control app-data-field"></asp:TextBox>
                                            <span class="input-group-btn">
                                                <asp:Button runat="server" ID="forgotUserName" CssClass="btn app-transparent-blue-button" OnClick="forgotUserName_OnClick" Text="Send" />
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <h2 class="app-page-sub-heading m-t-10 m-b-0">FOR PASSWORD</h2>
                                        <label class="app-data-label">Please enter your email address to get link for new password</label>
                                        <div class="input-group">
                                            <asp:TextBox runat="server" ID="EmailBox" type="email" CssClass="form-control app-data-field"></asp:TextBox>
                                            <span class="input-group-btn">
                                                <asp:Button runat="server" ID="forgotEmail" CssClass="btn app-transparent-blue-button" OnClick="forgotEmail_OnClick" Text="Send" />
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <button type="button" class="btn app-grey-button pull-right" data-dismiss="modal">CLOSE</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="Scripts/jquery-3.2.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/select2.min.js"></script>
    <script src="Scripts/notify.js"></script>
    <script src="Scripts/prettify.js"></script>

    <script>
        function Notify(message, Type) {
            $.notify(message, { type: Type, delay: 4000, animationType: "scale" });
        }
    </script>
</body>
</html>



