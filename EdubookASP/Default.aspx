<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EdubookASP.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%: Styles.Render("~/bundles/mdestyle") %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row mb-3">
        <form class="col-md-12" runat="server" id="FormTweet">
            <div class="form-group">
                <asp:TextBox ID="TextBoxTweet" TextMode="MultiLine" CssClass="form-control" style="min-width: 100%" runat="server"></asp:TextBox>
            </div>
            <asp:Button ID="TweetSubmitButton" CssClass="btn btn-primary rounded float-right" runat="server" Text="Fly" OnClick="TweetSubmitButton_Click"/>
        </form>
    </div>
    <div class="row">
        <div class="card col-12 m-2 p-3">
            <img class="card-img-top p-1" src="http://via.placeholder.com/350x150" alt="Card image cap">
            <div class="card-body">
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>
            <div class="card-footer">
                <a href="#"><i class="fas fa-thumbs-up"></i>100</a>
            </div>
        </div>
        <div class="card col-12 m-2">
            <img class="card-img-top p-3" src="http://via.placeholder.com/350x150" alt="Card image cap">
            <div class="card-body">
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>
            <div class="card-footer">
                <a href="#"><i class="fas fa-thumbs-up"></i>100</a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptArea" runat="server">
    <%: Scripts.Render("~/bundles/mdescript") %>
    <script>
        new SimpleMDE({
            element: document.getElementById("<%=TextBoxTweet.ClientID%>"),
            spellChecker: false,
        });
    </script>
</asp:Content>
