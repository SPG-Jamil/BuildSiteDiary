<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LangInsertion.aspx.cs" Inherits="BSD.LangInsertion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" />
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
        rel="stylesheet" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css"
        rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>
    <style>
        [id*=recGridView_mlabl], [id*=recGridView_englabl], [id*=recGridView_germlabl]
        {
            cursor: pointer;
            display: block;
            height: 40px;
        }
        #suc
        {
            cursor: pointer;
        }
        [id*=recGridView_mlabl]:hover, [id*=recGridView_englabl]:hover, [id*=recGridView_germlabl]:hover
        {
            font-weight: bold;
        }
        [id*=recGridView_mlabl]:active, [id*=recGridView_englabl]:active, [id*=recGridView_germlabl]:active
        {
            background-color: #3FFF9E;
        }
        body, h1
        {
            font-family: 'Ubuntu' , sans-serif !important;
        }
        .customGridViewHeader
        {
            background-color: #ccc;
            background-image: -webkit-gradient(linear,50% 0,50% 100%,color-stop(0%,#f5f5f5),color-stop(100%,#ccc));
            background-image: -webkit-linear-gradient(#f5f5f5,#ccc);
            background-image: -moz-linear-gradient(#f5f5f5,#ccc);
            background-image: -o-linear-gradient(#f5f5f5,#ccc);
            background-image: linear-gradient(#f5f5f5,#ccc);
            border-top: 1px solid #ccc !important;
            color: #555;
            height: 30pt !important;
            text-shadow: rgba(0,0,0,0.6) 0 0 0,rgba(255,255,255,0.6) 0 1px 0;
        }
        .custompaging span
        {
            background-color: #428bca;
            border: 1px solid #428bca;
            color: #fff;
            line-height: 1.428571429;
            padding: 6px 12px;
        }
        ul li
        {
            list-style: none;
        }
    </style>
    <title>Data Entry Form</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="container" style="margin-top: 20px">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-info text-center">
                    Data Entry Form</h2>
            </div>
            <div class="col-md-12">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div id="suc" runat="server" visible="False" class="alert alert-success">
                            <button data-dismiss="alert" class="close">
                                ×</button>
                            <asp:Label ID="SucLabel" runat="server" Text="Label"></asp:Label>
                        </div>
                        <div id="err" runat="server" visible="False" class="alert alert-danger">
                            <button data-dismiss="alert" class="close">
                                ×</button>
                            <asp:Label ID="ErrLabel" runat="server" Text="Label"></asp:Label>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="alert alert-warning">
                    <i class="fa fa-info-circle" style="font-size: 41px; float: left; color: #867407;">
                    </i>
                    <ul>
                        <li>Use Ctrl + f to Search</li>
                        <li>Use Ctrl + s to create new record</li>
                    </ul>
                </div>
                <table class="table table-bordered table-striped">
                    <tr>
                        <th>
                            Master Label
                        </th>
                        <th>
                            English Phrase
                        </th>
                        <th>
                            German Phrase
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="masterLabel" autofocus CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="EngLabel" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Panel ID="Panel1" runat="server" DefaultButton="SubmitBtn">
                                <asp:TextBox ID="GermanLabel" CssClass="form-control" runat="server"></asp:TextBox>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Button ID="SubmitBtn" runat="server" CssClass="btn btn-primary btn-block" OnClick="SubmitBtn_OnClick"
                                Text="Submit" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Panel ID="panSearch" runat="server" DefaultButton="SearchButton">
                                <asp:TextBox ID="SearchBox" placeholder="Search Here" CssClass="form-control" runat="server"></asp:TextBox>
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Button ID="SearchButton" runat="server" OnClick="SearchButton_OnClick" CssClass="btn btn-success btn-block"
                                Text="Search" />
                            <asp:Button ID="ClearBtn" CssClass="btn btn-default btn-block" OnClientClick="$('[id*=SearchBox]').val('')"
                                OnClick="ClearBtn_OnClick" runat="server" Text="Clear" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:UpdatePanel ID="ExistingbuilderGrid_UpdatePanel" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="hfound" CssClass="h2 " runat="server" Text=""></asp:Label>
                                    <asp:GridView ID="recGridView" CssClass="table" AllowPaging="False" PageSize="15"
                                        AutoGenerateColumns="False" OnRowDataBound="recGridView_OnRowDataBound" PagerStyle-CssClass="custompaging"
                                        OnPageIndexChanging="recGridView_OnPageIndexChanging" DataKeyNames="master" runat="server"
                                        EmptyDataText="No records Found !" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                                        OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" AutoGenerateEditButton="true"
                                        AutoGenerateDeleteButton="true">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Master Label">
                                                <ItemTemplate>
                                                    <asp:Label ID="mlabl" runat="server" Text='<%#Eval("master") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="mlabl_EDIT" CssClass="form-control" runat="server" Text='<%#Eval("master") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="English Phrase">
                                                <ItemTemplate>
                                                    <asp:Label ID="englabl" runat="server" Text='<%#Eval("english") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="englabl_EDIT" CssClass="form-control" runat="server" Text='<%#Eval("english") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="German Phrase">
                                                <ItemTemplate>
                                                    <asp:Label ID="germlabl" runat="server" Text='<%#Eval("german") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="germlabl_EDIT" CssClass="form-control" runat="server" Text='<%#Eval("german") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date & Time">
                                                <ItemTemplate>
                                                    <%#Eval("crtd_date","{0:dd-MM-yyyy hh:mm tt}")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle CssClass="panel-heading" />
                                        <HeaderStyle CssClass="customGridViewHeader" ForeColor="Black" />
                                        <PagerStyle BackColor="White" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFFFFF" />
                                        <SelectedRowStyle BackColor="#dfdfdf" Font-Bold="True" ForeColor="Black" />
                                        <SortedAscendingCellStyle BackColor="#FFF1D4" ForeColor="Black" />
                                        <SortedAscendingHeaderStyle CssClass="customGridViewHeader" ForeColor="Black" />
                                        <SortedDescendingCellStyle BackColor="#F1E5CE" ForeColor="Black" />
                                        <SortedDescendingHeaderStyle CssClass="customGridViewHeader" ForeColor="Black" />
                                    </asp:GridView>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="SearchButton" />
                                    <asp:AsyncPostBackTrigger ControlID="SubmitBtn" />
                                    <asp:AsyncPostBackTrigger ControlID="ClearBtn" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdateProgress ID="UpdateProgress2" AssociatedUpdatePanelID="ExistingbuilderGrid_UpdatePanel"
                                DynamicLayout="True" DisplayAfter="500" runat="server">
                                <ProgressTemplate>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100"
                                            aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                        </div>
                                    </div>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    </form>
    <script type="text/javascript">
        $(document).ready(function () {
            $("[id*=SearchButton]").click(function (event) {
                $("[id*=SearchBox]").focus();
            });
            $('#suc').click(function () {
                $(this).hide();
            });
            $('[id*=recGridView_germlabl_EDIT]').click(function () {
                $(this).val('');
            })

        });




        $(window).bind('keydown', function (event) {
            if (event.ctrlKey || event.metaKey) {
                switch (String.fromCharCode(event.which).toLowerCase()) {
                    case 's':
                        event.preventDefault();
                        $("[id*=masterLabel]").focus();
                        break;
                    //case 'f':
                    //    event.preventDefault();
                    //    $("[id*=SearchBox]").focus();
                    //    break;
                    case 'g':
                        event.preventDefault();
                        alert('ctrl-g');
                        break;
                }
            }
        });
        function ClearTextBox() {
            $('#masterLabel,#EngLabel,#GermanLabel').val('');
            $('#masterLabel').focus();
        }


        function copyToClipboard(element) {
            var $temp = $("<input>");
            $("body").append($temp);
            var a = "<";
            var b = "%= Get(" + '"';
            var c = '"'+ ")";
            var d = "%>";
            $temp.val(a+b + $(element).text() +c+d).select();
            document.execCommand("copy");
            $temp.remove();
        }

        $('[id*=recGridView_mlabl],[id*=recGridView_englabl],[id*=recGridView_germlabl]')
		.not('[id*=recGridView_englabl_EDIT],[id*=recGridView_mlabl_EDIT],[id*=recGridView_germlabl_EDIT]')
		.click(function () {
		    copyToClipboard($(this));

		});

        function pageLoad() {
            $('[id*=recGridView_mlabl],[id*=recGridView_englabl],[id*=recGridView_germlabl]')
			.not('[id*=recGridView_englabl_EDIT],[id*=recGridView_mlabl_EDIT],[id*=recGridView_germlabl_EDIT]').click(function () {
			    copyToClipboard($(this));

			});
			$('[id*=recGridView_germlabl_EDIT]').click(function () {
			    $(this).val('');
			})

            $('#suc').click(function () {
                $(this).hide();
            });
        }
    </script>
</body>
</html>