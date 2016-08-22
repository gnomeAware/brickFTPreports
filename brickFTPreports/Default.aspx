<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="brickFTPreports._Default" EnableEventValidation="false" %>
<%@ Register src="~/MessageBoxUserControl.ascx" tagname="MessageBoxUserControl" tagprefix="uc1" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
		</style>
		<script type="text/javascript">
    		function exportToExcel() {
    		    gridOutput.exportToExcel();
    		}
    		
    		function exportToWord() {
    		    gridOutput.exportToWord();
    		}
		</script>

        <uc1:MessageBoxUserControl ID="MessageBoxUserControl1" runat="server" />
        <div style="position:absolute; top:100px;">
            <asp:TreeView ID="TreeView1" runat="server" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" EnableViewState="true">
            </asp:TreeView>
        </div>
        <div id="divGrid" runat="server" visible="false" style="position:relative; top:50px; left:250px;">
            <obout:Grid ID="gridOutput" runat="server" AllowAddingRecords="false"></obout:Grid>
            <obout:OboutButton runat="server" Text="Export to Excel" OnClientClick="exportToExcel();return false;" />        
            <obout:OboutButton runat="server" Text="Export to Word" OnClientClick="exportToWord();return false;" />

        </div>
    <asp:Literal ID="PopupBox" runat="server"></asp:Literal>
    <div id="result"></div>
</asp:Content>
