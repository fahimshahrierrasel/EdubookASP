<%@ Page Title="Friends" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FriendsPage.aspx.cs" Inherits="EdubookASP.FriendsPage
    " %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderId="MainContent" runat="server">
    <div class="container">
        <h1>Friend List</h1>
        <asp:Repeater ID="FriendRepeater" runat="server">
            <ItemTemplate>
                <div class="card m-2">
                    <div class="card-body row">
                        <div class="col-3">
                            <asp:Image runat="server" Width="200px" ImageUrl='<%#Eval("PhotoUrl") %>' alt="Hello"/>
                        </div>
                        <div class="col-9">
                            <h5><asp:Label runat="server" Text='<%#Eval("FirstName")%>'></asp:Label></h5>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
