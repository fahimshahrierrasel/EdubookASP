<%@ Page Title="Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="EdubookASP.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-body">
                <form id="searchform" runat="server">
                    <div class="form-group">
                        <label for="InputSearch">Search</label>
                        <asp:TextBox ID="InputSearch" CssClass="form-control" runat="server" placeholder="Search..."></asp:TextBox>
                    </div>
                    <asp:Button ID="ButtonSearch" CssClass="btn btn-primary" runat="server" Text="Find" OnClick="ButtonSearch_Click" />
                </form>
            </div>
        </div>
        <div class="row m-2">
            <asp:Repeater ID="SearchRepeater" runat="server">
                <ItemTemplate>
                    <div class="card m-2" style="width: 16rem;">
                        <asp:Image class="card-img-top" ImageUrl='<%#Eval("PhotoUrl") %>' runat="server"/>
                        <div class="card-body">
                            <div class="card-title"><%#Eval("FirstName")+" "+Eval("LastName") %></div>
                            <a href="UserDetails?PID=<%#Eval("ProfileId")%>">Details</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptArea" runat="server">
</asp:Content>
