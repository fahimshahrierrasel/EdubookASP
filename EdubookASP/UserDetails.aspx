<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="EdubookASP.UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <asp:Image runat="server" ID="UserImage" CssClass="img-thumbnail" ImageUrl="http://via.placeholder.com/200x200" onerror="this.onerror=null; this.src='http://via.placeholder.com/200x200';" />
                <h2>
                    <asp:Label ID="LabelUserName" runat="server" Text="Name"></asp:Label>
                </h2>
                <p>
                    <asp:Label ID="LabelAbout" runat="server" Text="About"></asp:Label>
                </p>
            </div>
            <div class="col-sm-4">
                <asp:HyperLink CssClass="btn btn-lg btn-success" ID="HyperLinkAddFriend" runat="server">Add Friend</asp:HyperLink>
            </div>
        </div>
        <hr />
        <div class="m-1 row">
            <label for="InputDOB" class="col-sm-3">Date of Birth</label>
            <asp:Label ID="LabelDOB" runat="server" Text="Date of Birth"></asp:Label>
        </div>
        <div class="m-1 row">
            <label for="InputCity" class="col-sm-3">City</label>
            <asp:Label ID="LabelCity" runat="server" Text="About"></asp:Label>
        </div>
        <div class="m-1 row">
            <label for="InputEducation" class="col-sm-3">Education</label>
            <asp:Label ID="LabelEducation" runat="server" Text="Education"></asp:Label>
        </div>
        <div class="m-1 row">
            <label for="InputInstitution" class="col-sm-3">Institution</label>
            <asp:Label ID="LabelInstitution" runat="server" Text="Institution"></asp:Label>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptArea" runat="server">
</asp:Content>
