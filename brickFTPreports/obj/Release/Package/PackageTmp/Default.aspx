<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="brickFTPreports._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="position:absolute; top:100px;">
        <asp:TreeView ID="TreeView1" runat="server" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged">
        </asp:TreeView>
    </div>
    <div style="position:relative; top:50px; left:250px;">
        <asp:GridView ID="gridOutput" runat="server" AllowSorting="true" OnSorting="gridOutput_Sorting">
            <Columns>
                <asp:BoundField DataField="customerName" HeaderText="Header Post ID" SortExpression="gridOutput_Sorting" />
            </Columns>
        </asp:GridView>
    </div>

    <asp:Button ID="btnOpenPopUp" runat="server" text="Open PopUp" />
    <asp:Label ID="lblHidden" runat="server" Text=""></asp:Label>
    <ajaxToolkit:ModalPopupExtender ID="mpePopUp" runat="server" TargetControlID="lblHidden" PopupControlID="divPopUp" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
    
    <asp:Label ID="lblMessage" runat="server" Text="OUTPUT: " Visible="false"></asp:Label>
</asp:Content>
