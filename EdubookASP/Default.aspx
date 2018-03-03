<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EdubookASP.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%: Styles.Render("~/bundles/mdestyle") %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row mb-3">
            <div class="card col-md-12">
                <div class="card-body">
                    <form runat="server" id="FormPost">
                        <div class="form-group">
                            <asp:TextBox ID="InputPost" TextMode="MultiLine" CssClass="form-control" Style="min-width: 100%" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="InputPostTag" runat="server" CssClass="form-control" placeholder="Tags (use , to saperate)"></asp:TextBox>
                        </div>
                        <asp:Button ID="PostSubmitButton" CssClass="btn btn-success btn-lg float-right" runat="server" Text="Ask it?" OnClick="PostSubmitButton_Click" />
                    </form>
                </div>
            </div>
        </div>
        <div class="row">
            <asp:Repeater ID="RepeaterPosts" runat="server">
                <ItemTemplate>
                    <div class="card col-12 mb-2">
                        <div class="card-body">
                            <%# Markdown.ToHtml(Eval("PostText").ToString()) %>
                        </div>
                        <div class="card-footer">
                            <a href="#"><i class="fa fa-thumbs-up"></i><%# Eval("Likes") %></a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptArea" runat="server">
    <%:Scripts.Render("~/bundles/mdescript") %>
    <%:Scripts.Render("~/bundles/validation") %>
    <script>
        jQuery(document).ready(function () {
            $('#FormPost').validate({
                rules: {
                    <%=InputPost.UniqueID%>: {
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
        var simpleMDE = new SimpleMDE({
            element: document.getElementById("<%=InputPost.ClientID%>"),
            spellChecker: false
        });
        simpleMDE.value("# Write Something....");
    </script>
</asp:Content>
