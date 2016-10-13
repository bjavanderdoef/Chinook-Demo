<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Security_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row jumbotron">
        <h1>Site Administration</h1>
    </div>
    <div class="row">
        <div class="col-md-12">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#users" data-toggle="tab">Users</a></li>
                <li><a href="#roles" data-toggle="tab">Security Roles</a></li>
                <li><a href="#unregistered" data-toggle="tab">Unregistered</a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane fade in active" id="users"></div>
                    TBA: Show website user details
                <div class="tab-pane fade" id="roles">
                    <asp:ListView ID="RoleListView" runat="server" DataSourceID="RoleDataSource" DataKeyNames="RoleId" ItemType="Chinook.Framework.Entities.Security.RoleProfile">
                        <LayoutTemplate>
                            <div class="row bg-info">
                                <div class="col-md-3 h4">Action</div>
                                <div class="col-md-3 h4">Role</div>
                                <div class="col-md-6 h4">Members</div>
                            </div>
                            <div runat="server" id="itemPlaceholder"></div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:LinkButton runat="server" ID="DeleteButton" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                </div>
                                <div class="col-md-3">
                                    <%# Item.RoleName %>
                                </div>
                                <div class="col-md-6">
                                    <asp:Repeater ID="RoleUserRepeater" runat="server" ItemType="System.String" DataSource="<%# Item.UserNames %>">
                                        <SeparatorTemplate>, </SeparatorTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="RoleDataSource" runat="server" DataObjectTypeName="Chinook.Framework.Entities.Security.RoleProfile" DeleteMethod="RemoveRole" InsertMethod="AddRole" OldValuesParameterFormatString="original_{0}" SelectMethod="ListAllRoles" TypeName="Chinook.Framework.BLL.Security.RoleManager"></asp:ObjectDataSource>
                </div>
                <div class="tab-pane fade" id="unregistered"></div>
                    TBA: Show unregistered Customers and Employees
            </div>
        </div>
    </div>
</asp:Content>

