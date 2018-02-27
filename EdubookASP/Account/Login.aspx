<%@ Page Title="Login" Language="C#" MasterPageFile="~/SiteAccount.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EdubookASP.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <div class="card-body">
            <form id="signin" class="form-signin" runat="server">
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
                <asp:Button CssClass="btn btn-lg btn-primary btn-block" runat="server" Text="Sign in" />
            </form>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <%:Scripts.Render("~/bundles/validation") %>
    <script>
        jQuery(document).ready(function () {
            $('#signin').validate({
                rules: {
                    <%=InputEmail.UniqueID%>: {
                        required: true,
                        email: true
                    },
                    <%=InputPassword.UniqueID%>: {
                        required: true
                    }
                },
                errorElement: "div",
                errorPlacement: function (error, element) {
                    // Add the `help-block` class to the error element
                    error.addClass("invalid-feedback");
                    error.insertAfter(element);
                },
                highlight: function (element, errorClass, validClass) {
                    $(element).addClass("is-invalid").removeClass("is-valid");
                },
                unhighlight: function (element, errorClass, validClass) {
                    $(element).addClass("is-valid").removeClass("is-invalid");
                }
            });
        });
    </script>
</asp:Content>
