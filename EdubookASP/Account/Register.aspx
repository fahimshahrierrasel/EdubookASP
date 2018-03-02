<%@ Page Title="Register" Language="C#" MasterPageFile="~/SiteAccount.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EdubookASP.Account.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card mr-3">
        <div class="card-body">
            <form id="registerform" class="form-signin" runat="server">
                <div class="text-center">
                    <asp:Image runat="server" CssClass="mb-4" ImageUrl="~/Images/logo.png" AlternateText="Edubook" />
                </div>
                <div class="form-row">
                    <div class="form-label-group col">
                        <label for="InputFirstName">First Name</label>
                        <asp:TextBox ID="InputFirstName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                    </div>
                    <div class="form-label-group col">
                        <label for="InputLastName">Last Name</label>
                        <asp:TextBox ID="InputLastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                    </div>
                </div>
                <div class="form-label-group">
                    <label for="InputUsername">Username</label>
                    <asp:TextBox ID="InputUsername" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                </div>
                <div class="form-label-group">
                    <label for="InputEmail">Email address</label>
                    <asp:TextBox ID="InputEmail" runat="server" CssClass="form-control" placeholder="Email address" TextMode="Email"></asp:TextBox>
                </div>
                <div class="form-row">
                    <div class="form-label-group col">
                        <label for="InputDOB">Date of Birth</label>
                        <asp:TextBox ID="InputDOB" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="form-label-group col">
                        <label for="InputCity">City</label>
                        <asp:TextBox ID="InputCity" runat="server" CssClass="form-control" placeholder="City"></asp:TextBox>
                    </div>
                </div>
                <div class="form-label-group">
                    <label for="InputPassword">Password</label>
                    <asp:TextBox ID="InputPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-label-group mb-3">
                    <label for="InputConfPassword">Confirm Password</label>
                    <asp:TextBox ID="InputConfPassword" runat="server" CssClass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                </div>
                <asp:Panel ID="SuccessPanel" CssClass="alert alert-success alert-dismissible fade show" Visible="false" runat="server">
                    <strong>Registration Complete!!</strong><br />
                    <a href="~/Account/Login" runat="server">Go to Login</a>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </asp:Panel>
                <asp:Panel ID="WarningPanel" CssClass="alert alert-warning alert-dismissible fade show" Visible="false" runat="server">
                    <asp:Label ID="WaringLabel" runat="server" Text="Label"></asp:Label>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </asp:Panel>
                <asp:Button ID="RegisterButton" CssClass="btn btn-lg btn-primary btn-block" runat="server" Text="Register" OnClick="RegisterButton_Click" />
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
                    required: true,
                    minlength: 5
                },
                    <%=InputEmail.UniqueID%>: {
                        required: true,
                        email: true
                    },
                    <%=InputFirstName.UniqueID%>:{
                        required: true
                    },
                    <%=InputLastName.UniqueID%>:{
                        required: true
                    },
                    <%=InputCity.UniqueID%>:{
                        required: true
                    },
                    <%=InputDOB.UniqueID%>:{
                        required: true,
                        date: true
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
