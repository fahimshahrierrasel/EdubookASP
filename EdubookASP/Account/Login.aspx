<%@ Page Title="Login" Language="C#" MasterPageFile="~/SiteAccount.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EdubookASP.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <div class="card-body">
            <form class="form-signin" runat="server">
                <div class="text-center mb-4">
                    <asp:Image runat="server" CssClass="mb-4" ImageUrl="~/Images/logo.png" AlternateText="Edubook" />
                </div>

                <div class="form-label-group">
                    <label for="InputEmail">Email address</label>
                    <asp:TextBox ID="InputEmail" runat="server" CssClass="form-control" placeholder="Email address" TextMode="Email"></asp:TextBox>
                </div>

                <div class="form-label-group">
                    <label for="InputPassword">Password</label>
                    <asp:TextBox ID="InputPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                </div>

                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-me">
                        Remember me
                    </label>
                    <br />
                    <a href="Register">Not have an account</a>
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form>
        </div>
    </div>
</asp:Content>
