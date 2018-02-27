<%@ Page Title="Register" Language="C#" MasterPageFile="~/SiteAccount.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EdubookASP.Account.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card mr-3">
        <div class="card-body">
            <form id="registerform" class="form-signin" runat="server">
                <div class="text-center mb-4">
                    <asp:Image runat="server" CssClass="mb-4" ImageUrl="~/Images/logo.png" AlternateText="Edubook" />
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
                <asp:Button CssClass="btn btn-lg btn-primary btn-block" runat="server" Text="Register" />
            </form>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <%:Scripts.Render("~/bundles/validation") %>
    <script>
        jQuery(document).ready(function () {
            $('#registerform').validate({
                rules: {
                    <%=InputUsername.UniqueID%>:
                    {
                        required: true
                    },
                    <%=InputEmail.UniqueID%>: {
                        required: true,
                        email: true
                    },
                    <%=InputPassword.UniqueID%>: {
                        required: true,
                        minlength: 8
                    },
                    <%=InputConfPassword.UniqueID%>: {
                        required: true,
                        equalTo: "#<%=InputPassword.ClientID%>"
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
