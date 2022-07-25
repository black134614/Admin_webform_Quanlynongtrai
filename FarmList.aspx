<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FarmList.aspx.cs" Inherits="FarmList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Quản lý nông trại -  đất</title>
    <link href="Content/dataTables.bootstrap5.min.css" rel="stylesheet" />
    <link href="Content/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-content-item">
        <div class="item">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Default.aspx">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Nông trại</li>
                </ol>
            </nav>
            <div class="item-form row" runat="server">
                <div class="col-12 row d-flex align-items-center">
                    <div class="col-12 col-lg-6 cur-weather mb-3">
                        <div class="cur-city d-inline-block">
                        </div>

                        <div class="cur-temp d-inline-block me-1"></div>

                        <div class="cur-wind d-inline-block me-1"></div>

                        <div class="cur-humidity d-inline-block me-1"></div>
                    </div>
                    <div class=" col-12 col-lg-6 show-weather" role="alert" data-mdb-color="primary">
                        <div class="show-city d-inline-block me-1">
                        </div>

                        <div class="show-temp d-inline-block me-1"></div>

                        <div class="show-wind d-inline-block me-1"></div>

                        <div class="show-humidity d-inline-block me-1"></div>
                    </div>
                </div>
            </div>
            <table id="farmList" class="table table-data table-striped col-12">
                <thead>
                    <tr>
                        <th>Tên</th>
                        <th>Mô tả</th>
                        <th>Vị trí</th>
                        <th>Ngày cập nhật</th>
                        <th class="text-center">Xem dự báo thời tiết</th>
                        <th class="text-center">Xem</th>
                        <th class="text-center">Sửa</th>
                        <th class="text-center">Xóa</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="Repeater_Main" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Title") %></td>
                                <td><%# Eval("Detail") %></td>
                                <td class="location"><%# Eval("Location") %></td>
                                <td><%# Eval("CreateTime", "{0:dd/MM/yyyy}") %></td>
                                <td class="text-center"><a class="text-warning watch-weather" href="#"><span class="fa fa-star"></span></a></td>
                                <td class="text-center"><a class="text-info" href='<%# Eval("FarmID","farmDetail.aspx?farmID={0}") %>'><span class="fa fa-eye"></span></a></td>
                                <td class="text-center"><a class="text-primary" href='<%# Eval("FarmID","farmEdit.aspx?farmID={0}") %>'><span class="fa fa-edit"></span></a></td>
                                <td class="text-center">
                                    <a href="#" class="text-danger btn-delete" data-id='<%# Eval("FarmID") %>'>
                                        <span class="fa fa-trash"></span>
                                    </a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
                <tfoot>
                    <tr>
                        <th>Tên</th>
                        <th>Mô tả</th>
                        <th>Vị trí</th>
                        <th>Ngày cập nhật</th>
                        <th class="text-center">Xem dự báo thời tiết</th>
                        <th class="text-center">Xem</th>
                        <th class="text-center">Sửa</th>
                        <th class="text-center">Xóa</th>
                    </tr>
                </tfoot>
            </table>
            <div class="col-12">
                <a href="farmEdit.aspx" class="btn btn-primary">Thêm mới</a>
                <button type="button" class="btn btn-success disabled">Xem thống kê</button>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <script src="Scripts/jquery.dataTables.min.js"></script>
    <script src="Scripts/dataTables.bootstrap5.min.js"></script>
    <script src="Scripts/farmListScript.js"></script>
</asp:Content>

