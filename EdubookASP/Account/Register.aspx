<%@ Page Title="Register" Language="C#" MasterPageFile="~/SiteAccount.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EdubookASP.Account.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form class="form-signin" runat="server">
        <div class="text-center mb-4">
            <asp:Image runat="server" CssClass="mb-4" ImageUrl="~/Images/logo.png" AlternateText="Edubook"/>
        </div>
        <div class="form-label-group">
            <label for="InputUsername">Username</label>
            <asp:TextBox ID="InputUsername" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
        </div>

        <div class="form-label-group">
            <label for="InputEmail">Email address</label>
            <asp:TextBox ID="InputEmail" runat="server" CssClass="form-control" placeholder="Email address" TextMode="Email"></asp:TextBox>
        </div>

        <div class="form-label-group">
            <label for="InputPassword">Password</label>
            <asp:TextBox ID="InputPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
        </div>

        <div class="form-label-group mb-3">
            <label for="InputConfPassword">Confirm Password</label>
            <asp:TextBox ID="InputConfPassword" runat="server" CssClass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
    </form>
</asp:Content>
