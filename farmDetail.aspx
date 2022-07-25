<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="farmDetail.aspx.cs" Inherits="farmDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Quản lý nông trại - nông trại</title>
    <link href="Content/dataTables.bootstrap5.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-content-item">
        <div class="item">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Default.aspx">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="FarmList.aspx">nông trại</a></li>
                    <li class="breadcrumb-item active">Quản lý thông tin trang trại</li>
                </ol>
            </nav>
            <div class="row item-form">
                <div class="col-12 row manage-crop mb-5">
                    <div class="col-12">
                        <h3 class="text-center">
                            <span class="far fa-list-alt text-primary"></span>
                            Quản lý canh tác trong vụ
                        </h3>
                    </div>
                    <table class="table table-data table-striped col-12">
                        <thead>
                            <tr>
                                <th style="min-width: 150px;">Tên</th>
                                <th style="min-width: 150px;">Mô tả</th>
                                <th>Đang trồng</th>
                                <th>Vụ</th>
                                <th style="min-width: 150px;">Đánh giá</th>
                                <th>Thời gian tạo</th>
                                <th>Ngày cập nhật</th>
                                <th class="text-center">Sửa
                                </th>
                                <th class="text-center">Xóa</th>
                                <th class="text-center">Công việc</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater_CropStep" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("Title") %></td>
                                        <td><%# Eval("Detail") %></td>
                                        <td><%# Eval("SeedName") %></td>
                                        <td><%# Eval("CropTitle") %></td>
                                        <td><%# Eval("Evaluate") %></td>
                                        <td><%# Eval("CreateTime","{0:dd/MM/yyyy}") %></td>
                                        <td><%# Eval("UpdateTime","{0:dd/MM/yyyy}") %></td>
                                        <td class="text-center"><a class="text-primary" href='<%# Eval("CropStepID","CropStepEdit.aspx?cropStepID={0}") %>'><span class="fa fa-edit"></span></a></td>
                                        <td class="text-center"><a class="text-danger btn-delete" data-id='<%# Eval("CropStepID") %>' href="#"><span class="fa fa-trash"></span></a></td>
                                        <td class="text-center"><a class="text-secondary" href='<%# Eval("CropStepID","StepManage.aspx?cropStepID={0}") %>'><span class="fa fa-eye"></span></a></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Tên</th>
                                <th>Mô tả</th>
                                <th>Đang trồng</th>
                                <th>Vụ</th>
                                <th>Đánh giá</th>
                                <th>Thời gian tạo</th>
                                <th>Ngày cập nhật</th>
                                <th class="text-center">sửa</th>
                                <th class="text-center">Xóa</th>
                                <th class="text-center">Công việc</th>
                            </tr>
                        </tfoot>
                    </table>
                    <div class="col-12">
                        <a href="CropStepEdit.aspx" id="getIdToCropStep" runat="server" class="btn btn-primary">Trồng thêm</a>
                    </div>
                </div>
                <%--<div class="col-12 col-lg-6 row farm-statitic mb-5">
                    <div class="col-12">
                        <h3 class="text-center">
                            <span class="fa fa-star text-warning"></span>
                            Danh sách cây trồng trên đất này
                        </h3>
                    </div>
                    <div class="col-12 text-center">
                        <canvas id="myChart" style="height: 70vh; width: 80vw"></canvas>
                    </div>
                </div>--%>
                <div class="col-12 row mb-5">
                    <div class="col-12">
                        <h3 class="text-center">
                            <span class="fa fa-star text-danger"></span>
                            Danh sách chi tiêu
                            <button
                                type="button"
                                class="btn btn-primary"
                                data-mdb-toggle="modal"
                                data-mdb-target="#addSpendModal">
                                Thêm chi tiêu
                            </button>
                        </h3>
                    </div>
                    <table class="table table-striped col-12">
                        <thead>
                            <tr>
                                <th style="width: 150px">Tiêu đề</th>
                                <th style="width: 150px">Mô tả</th>
                                <th>Thời gian</th>
                                <th>Khoảng chi</th>
                                <th class="text-center">Xóa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater_Spending" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("Title") %></td>
                                        <td><%# Eval("Description") %></td>
                                        <td><%# Eval("CreateTime","{0:dd/MM/yyyy}") %></td>
                                        <td><%# Eval("Amount") %></td>
                                        <td class="text-center">
                                            <asp:LinkButton runat="server" ID="btn_delete_spending" CommandArgument='<%# Eval("SpendingID") %>' OnClick="btn_delete_spending_Click"><span class="fa fa-trash text-danger"></span></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
                <div class="col-12 row mb-5">
                    <div class="col-12">
                        <h3 class="text-center">
                            <span class="fa fa-star text-danger"></span>
                            Danh sách thu nhập
                            <button
                                type="button"
                                class="btn btn-primary"
                                data-mdb-toggle="modal"
                                data-mdb-target="#addProfit">
                                Thêm thu nhập
                            </button>
                        </h3>
                    </div>
                    <table class="table table-striped col-12">
                        <thead>
                            <tr>
                                <th style="width: 150px">Tiêu đề</th>
                                <th style="width: 150px">Mô tả</th>
                                <th>Thời gian</th>
                                <th>Khoảng thu</th>
                                <th class="text-center">Xóa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater_Profit" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("Title") %></td>
                                        <td><%# Eval("Note") %></td>
                                        <td><%# Eval("CreateTime","{0:dd/MM/yyyy}") %></td>
                                        <td><%# Eval("Profit") %></td>
                                        <td class="text-center">
                                            <asp:LinkButton runat="server" ID="btn_delete_profit" CommandArgument='<%# Eval("ProfitID") %>' OnClick="btn_delete_profit_Click"><span class="fa fa-trash text-danger"></span></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
                <div class="col-12 row manage-crop mb-5">
                    <div class="col-12">
                        <h3 class="text-center">
                            <span class="far fa-list-alt text-primary"></span>
                            Danh sách tất cả cây đã trồng
                        </h3>
                    </div>
                    <table id="cropManage" class="table table-data table-striped col-12">
                        <thead>
                            <tr>
                                <th style="min-width: 150px;">Tên</th>
                                <th>Tên giống</th>
                                <th>Loại giống</th>
                                <th style="min-width: 150px;">Đánh giá</th>
                                <th>Thời gian
                                    <br />
                                    chăm sóc (tháng)</th>
                                <th>Ngày tạo</th>
                                <th>Ngày cập nhật</th>
                                <th class="text-center">Xem</th>
                                <th class="text-center">Xóa</th>
                                <th class="text-center">Trồng lại</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater_Main" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("Title") %></td>
                                        <td><%# Eval("SeedName") %></td>
                                        <td><%# Eval("SeedType") %></td>
                                        <td><%# Eval("Evaluate") %></td>
                                        <td><%# Eval("PlantingMonth") %></td>
                                        <td><%# Eval("CreateTime","{0:dd/MM/yyyy}") %></td>
                                        <td><%# Eval("UpdateTime","{0:dd/MM/yyyy}") %></td>
                                        <td class="text-center"><a class="text-primary" href='<%# Eval("CropStepID","CropStepEdit.aspx?cropStepID={0}") %>'><span class="fa fa-edit"></span></a></td>
                                        <td class="text-center"><a class="text-danger btn-delete-crop-step" data-id='<%# Eval("CropStepID") %>' href="#"><span class="fa fa-trash"></span></a></td>
                                        <td class="text-center"><a class="text-danger btn-add-crop-step" data-id='<%# Eval("CropStepID") %>' href="#"><span class="fa fa-recycle"></span></a></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th style="min-width: 150px;">Tên</th>
                                <th>Tên giống</th>
                                <th>Loại giống</th>
                                <th style="min-width: 150px;">Đánh giá</th>
                                <th>Thời gian
                                    <br />
                                    chăm sóc (tháng)</th>
                                <th>Ngày tạo</th>
                                <th>Ngày cập nhật</th>
                                <th class="text-center">Xem</th>
                                <th class="text-center">Xóa</th>
                                <th class="text-center">Trồng lại</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <section class="page-item">
        <div
            class="modal fade"
            id="addSpendModal"
            tabindex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm chi tiêu</h5>
                        <button
                            type="button"
                            class="btn-close"
                            data-mdb-dismiss="modal"
                            aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row item-form">
                            <div class="mb-3 col-12 col-xl-6">
                                <div class="form-outline">
                                    <input type="text" class="form-control" id="Spending_Title" runat="server">
                                    <label class="form-label">Tiêu đề</label>
                                    <div class="form-helper"></div>
                                </div>
                            </div>
                            <div class="mb-3 col-12 col-xl-6">
                                <div class="form-outline">
                                    <input type="text" class="form-control" id="Spending_Detail" runat="server">
                                    <label class="form-label">Thông tin thêm</label>
                                </div>
                            </div>
                            <div class="mb-3 col-12 col-xl-6">
                                <div class="form-outline">
                                    <input type="text" class="form-control" id="Spending_Amount" runat="server">
                                    <label class="form-label">Khoảng chi</label>
                                </div>
                                <div class="mb-3 mt-3 col-12">
                                    <span>Chi tiêu cho</span>
                                    <asp:DropDownList runat="server" ID="dropdown_CropStep" class="form-select">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">
                            Đóng
                        </button>
                        <asp:Button Text="Lưu" CssClass="btn btn-primary" ID="btn_AddSpending" OnClick="btn_AddSpending_Click" runat="server" />
                    </div>
                </div>
            </div>
        </div>
        <div
            class="modal fade"
            id="addProfit"
            tabindex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm hàng đã bán</h5>
                        <button
                            type="button"
                            class="btn-close"
                            data-mdb-dismiss="modal"
                            aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row item-form">
                            <div class="mb-3 col-12 col-xl-6">
                                <div class="form-outline">
                                    <input type="text" class="form-control" id="Profit_Title" runat="server">
                                    <label class="form-label">Tiêu đề</label>
                                    <div class="form-helper"></div>
                                </div>
                            </div>
                            <div class="mb-3 col-12 col-xl-6">
                                <div class="form-outline">
                                    <input type="text" class="form-control" id="Profit_Detail" runat="server">
                                    <label class="form-label">Thông tin thêm</label>
                                </div>
                            </div>
                            <div class="mb-3 col-12 col-xl-6">
                                <div class="form-outline">
                                    <input type="text" class="form-control" id="Profit_Amount" runat="server">
                                    <label class="form-label">Khoảng bán được</label>
                                </div>
                                <div class="mb-3 mt-3 col-12">
                                    <span>Lời được từ</span>
                                    <asp:DropDownList runat="server" ID="DropDownList1" class="form-select">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">
                            Đóng
                        </button>
                        <asp:Button Text="Lưu" CssClass="btn btn-primary" ID="btn_AddProfit" OnClick="btn_AddProfit_Click" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.3.2/dist/chart.min.js"></script>
    <script src="Scripts/jquery.dataTables.min.js"></script>
    <script src="Scripts/dataTables.bootstrap5.min.js"></script>
    <script src="Scripts/farmDetailScript.js"></script>
</asp:Content>

