<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="seed.aspx.cs" Inherits="seed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Quản lý nông trại - hạt giống</title>
    <link href="Content/dataTables.bootstrap5.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-content-item">
        <div class="item">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Thêm nông trại</li>
                </ol>
            </nav>
            <div class="item-form row">
                  <div class="col-12">
                    <h5 class="alert alert-success py-3" id="page_message" data-mdb-color="success" runat="server">
                        <span class'fa fa-info-circle'></span>
                        Thao tác thành công! bạn có thể quản lý cánh đồng
                    </h5>
                </div>
                <table id="seedList" class="table table-data table-striped col-12">
                    <thead>
                        <tr>
                            <th>Tên hạt giống</th>
                            <th>Loại giống</th>
                            <th class="text-center">Đánh giá</th>
                            <th>Thời gian trồng</th>
                            <th class="text-center">Ngày tạo</th>
                            <th class="text-center d-none">Sửa</th>
                            <th class="text-center">Xóa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="Repeater_Main" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("SeedName") %></td>
                                    <td><%# Eval("SeedType") %></td>
                                    <td><%# Eval("Evaluate") %></td>
                                    <td><%# Eval("PlantingMonth") %></td>
                                    <td><%# Eval("CreateTime", "{0:dd/MM/yyyy}") %></td>
                                    <td class="text-center d-none">
                                        <asp:LinkButton ID="btn_Edit" runat="server" CommandArgument='<%# Eval("SeedID") %>' OnClick="btn_Edit_Click"><span class="fa fa-edit text-primary" ></span></asp:LinkButton>
                                    </td>
                                    <td class="text-center">
                                        <asp:LinkButton ID="btn_Delete" runat="server" CommandArgument='<%# Eval("SeedID") %>' OnClick="btn_Delete_Click"><span class="fa fa-trash text-danger"></span></asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Tên hạt giống</th>
                            <th>Loại giống</th>
                            <th class="text-center">Đánh giá</th>
                            <th>Thời gian trồng</th>
                            <th class="text-center">Ngày tạo</th>
                            <th class="text-center d-none">Sửa</th>
                            <th class="text-center">Xóa</th>
                        </tr>
                    </tfoot>
                </table>
                <div class="col-12">
                    <a href="Default.aspx" class="btn btn-primary">Về trang quản lý</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <script src="Scripts/jquery.dataTables.min.js"></script>
    <script src="Scripts/dataTables.bootstrap5.min.js"></script>
    <script src="Scripts/seedScript.js"></script>
</asp:Content>

