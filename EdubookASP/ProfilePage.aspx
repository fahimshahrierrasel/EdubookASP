<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="EdubookASP.ProfilePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <div class="card-header">Profile</div>
        <div class="card-body">
            <form id="registerform" class="form-signin" runat="server">
                <div class="form-label-group m-1 row">
                    <label for="InputFirstName" class="col-sm-3">First Name</label>
                    <asp:TextBox ID="InputFirstName" ReadOnly="true" runat="server" CssClass="form-control col-sm-9" placeholder="First Name"></asp:TextBox>
                </div>
                <div class="form-label-group m-1 row">
                    <label for="InputLastName" class="col-sm-3">Last Name</label>
                    <asp:TextBox ID="InputLastName" ReadOnly="true" runat="server" CssClass="form-control col-sm-9" placeholder="Last Name"></asp:TextBox>
                </div>
                <div class="form-label-group m-1 row">
                    <label for="InputDOB" class="col-sm-3">Date of Birth</label>
                    <asp:TextBox ID="InputDOB" ReadOnly="true" runat="server" CssClass="form-control col-sm-9" TextMode="Date"></asp:TextBox>
                </div>
                <div class="form-label-group m-1 row">
                    <label for="InputCity" class="col-sm-3">City</label>
                    <asp:TextBox ID="InputCity" ReadOnly="true" runat="server" CssClass="form-control col-sm-9" placeholder="City"></asp:TextBox>
                </div>
                <div class="form-label-group m-1 row">
                    <label for="InputEducation" class="col-sm-3">Education</label>
                    <asp:TextBox ID="InputEducation" ReadOnly="true" runat="server" CssClass="form-control col-sm-9" placeholder="Education"></asp:TextBox>
                </div>
                <div class="form-label-group m-1 row">
                    <label for="InputInstitution" class="col-sm-3">Institution</label>
                    <asp:TextBox ID="InputInstitution" ReadOnly="true" runat="server" CssClass="form-control col-sm-9" placeholder="Institution"></asp:TextBox>
                </div>
                <div class="form-label-group m-1 row">
                    <label for="InputFavTag" class="col-sm-3">Tags</label>
                    <asp:TextBox ID="InputFavTag" ReadOnly="true" runat="server" CssClass="form-control col-sm-9" placeholder="Tags (Add , to saperate)"></asp:TextBox>
                </div>
                <div class="form-label-group m-1 row">
                    <label for="InputAbout" class="col-sm-3">About</label>
                    <asp:TextBox ID="InputAbout" ReadOnly="true" runat="server" CssClass="form-control col-sm-9" placeholder="About you"></asp:TextBox>
                </div>
                
                <asp:Button ID="UpdateButton" CssClass="btn btn-lg btn-primary float-right d-none mt-3" runat="server" Text="Update" OnClick="UpdateButton_Click"/>
            </form>
        </div>
        <div class="card-footer">
            <button id="cancel_edit" class="btn btn-primary btn-lg d-none mt-3">Cancel</button>
            <button class="btn btn-primary float-right" id="edit_profile">Edit</button>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptArea" runat="server">
    <script>
        $("#edit_profile").click(function () {
            $(".form-control").removeAttr('readonly');
            $("#edit_profile").addClass('d-none');
            $('#<%=UpdateButton.ClientID%>').removeClass('d-none');
            $('#cancel_edit').removeClass('d-none');
        });

        $("#cancel_edit").click(function (e) {
            e.preventDefault();
            $(".form-control").attr('readonly', 'readonly');
            $("#edit_profile").removeClass('d-none');
            $('#<%=UpdateButton.ClientID%>').addClass('d-none');
            $('#cancel_edit').addClass('d-none');
        });
    </script>
</asp:Content>
