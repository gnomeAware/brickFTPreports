<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test1.aspx.cs" Inherits="brickFTPreports.Test1" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.TreeView" tagprefix="obout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="position:absolute; top:100px;">
            
            <obout:Tree ID="oTree" runat="server">

            </obout:Tree>
        </div>
        <div id="divGrid" runat="server" visible="false" style="position:relative; top:50px; left:250px;">
            <obout:Grid ID="gridOutput" runat="server" AllowAddingRecords="false"></obout:Grid>
        </div>
    </form>
</body>
</html>
