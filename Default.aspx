<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Quản lý nông trại</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-content-item">
        <div class="item">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active">Trang chủ</li>
                </ol>
            </nav>
            <div class="item-form row g-4">
                <div class="col-12 col-lg-4 mb-5">
                    <div class="card text-center bg-warning text-light" id="farmList">
                        <div class="card-header">
                            <span class="far fa-star text-danger"></span>
                            Quản lý cánh đồng
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Danh sách cánh đồng của bạn</h5>

                            <p class="card-text">
                                <ol class="list-group list-group-numbered">
                                    <asp:Repeater ID="Repeater_Farm" runat="server">
                                        <ItemTemplate>
                                            <li class="list-group-item"><%# Eval("Title") %></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ol>
                            </p>
                            <a href="FarmList.aspx" class="btn btn-primary watch-btn">Xem</a>
                            <a href="farmEdit.aspx" class="btn btn-danger">Thêm mới</a>
                        </div>
                        <div class="card-footer">
                            Cập nhật gần nhất: <span id="dateUpdateFarm" runat="server">1/1/2021</span>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-4 mb-5">
                    <div class="card text-center bg-primary text-light" id="seedList">
                        <div class="card-header">
                            <span class="far fa-star text-warning"></span>
                            Danh sách cây trồng
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Các loại giống bạn đang trồng</h5>
                            <p class="card-text">
                                <ol class="list-group list-group-numbered">
                                    <asp:Repeater ID="Repeater_Seed" runat="server">
                                        <ItemTemplate>
                                            <li class="list-group-item"><%# Eval("SeedName") %> - <%# Eval("SeedType") %></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ol>
                            </p>
                            <a href="seed.aspx" class="btn btn-warning watch-btn">Xem</a>
                            <a href="#" class="btn btn-danger" data-mdb-toggle="modal"
                                data-mdb-target="#addSeedModal">Thêm mới</a>
                        </div>
                        <div class="card-footer">Cập nhật gần nhất: <span id="dateUpdateSeed" runat="server">1/1/2021</span></div>
                    </div>
                </div>
                <div class="col-12 col-lg-4 mb-5">
                    <div class="card text-center bg-secondary text-light">
                        <div class="card-header">
                            <span class="far fa-star text-danger"></span>
                            Danh sách công việc cần làm
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Danh sách công việc</h5>

                            <p class="card-text">
                                <ol class="list-group list-group-numbered">
                                    <asp:Repeater ID="Repeater_Work" runat="server">
                                        <ItemTemplate>
                                            <li class="list-group-item"><%# Eval("StepName") %> - <%# Eval("Title") %></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ol>
                            </p>
                            <a href="FarmList.aspx" class="btn btn-primary watch-btn">Quản lý đất của bạn
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-6 row mb-5">
                    <div class="col-12">
                        <h3 class="text-center">
                            <span class="fa fa-star text-danger"></span>
                            Danh sách mùa vụ
                            <button
                                type="button"
                                class="btn btn-primary"
                                data-mdb-toggle="modal"
                                data-mdb-target="#addCrop">
                                Thêm mùa vụ
                            </button>
                        </h3>
                    </div>
                    <table class="table table-striped col-12">
                        <thead>
                            <tr>
                                <th style="width: 200px">Tiêu đề</th>
                                <th style="width: 150px">Mô tả</th>
                                <th>Thời gian tạo</th>
                                <th>Cập nhật</th>
                                <th class="text-center">Xóa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater_Crop" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("Title") %> - <%# Eval("Farm") %></td>
                                        <td><%# Eval("Description") %></td>
                                        <td><%# Eval("CreateTime","{0:dd/MM/yyyy}") %></td>
                                        <td><%# Eval("UpdateTime","{0:dd/MM/yyyy}") %></td>
                                        <td class="text-center">
                                            <asp:LinkButton runat="server" ID="btn_delete_Crop" CommandArgument='<%# Eval("CropID") %>' OnClick="btn_delete_Crop_Click"><span class="fa fa-trash text-danger"></span></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
                <div class="col-12 col-lg-6 row mb-5">
                    <div class="col-12">
                        <h3 class="text-center">
                            <span class="fa fa-star text-danger"></span>
                            Thống kê chi tiết
                        </h3>
                    </div>
                    <div>
                        <div class="card text-center">
                            <div class="card-header">
                                <span class="far fa-star text-warning"></span>
                                Báo cáo
                            </div>
                            <div class="card-body">
                                <p class="card-text">
                                    <ul class="list-unstyled">
                                        <li>Tổng số tiền thu được <span id="Sum_Amount" runat="server"></span></li>
                                        <li>Tổng số tiền chi xài <span id="Sum_Spend" runat="server"></span></li>
                                        <li>Tổng số lần canh tác <span id="Sum_CropStep" runat="server"></span></li>
                                        <li>Đang canh tác <span id="CropActive" runat="server"></span></li>
                                        <li>Tổng số lần canh tác trong năm <span id="Sum_CropStepYear" runat="server"></span></li>
                                    </ul>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 mb-5">
                    <div class="text-center">
                        <h4>
                            <span class="far fa-star text-primary"></span>
                            Thống kê chi tiêu
                        </h4>
                        <br />
                        <div style="display: flex; align-items: center; justify-content: center;">
                            <span>Từ ngày</span>
                            <input type="date"class="form-control spend-from-date w-25" />
                            <span>Đến ngày</span>
                            <input type="date"class="form-control spend-to-date w-25" />
                            <button class="btn btn-primary d-inline-block" id="spendChartByDate">Xem</button>
                        </div>
                    </div>
                    <div id="spendingChartReport">
                        <canvas id="spendingChart" style=""></canvas>
                    </div>
                </div>
                <div class="col-12 mb-5">
                    <div class="text-center">
                        <h4>
                            <span class="far fa-star text-primary"></span>
                            Thu nhập gần đây
                        </h4>
                        <br />
                        <div style="display: flex; align-items: center; justify-content: center;">
                            <span>Từ ngày</span>
                            <input type="date"class="form-control profit-from-date w-25" />
                            <span>Đến ngày</span>
                            <input type="date"class="form-control profit-to-date w-25" />
                            <button class="btn btn-primary d-inline-block" id="profitChartByDate">Xem</button>
                        </div>
                    </div>
                    <div id="profitChartReport">
                        <canvas id="profitChart" style=""></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section class="page-item">
        <div
            class="modal fade"
            id="addSeedModal"
            tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm hạt giống</h5>
                        <button
                            type="button"
                            class="btn-close"
                            data-mdb-dismiss="modal"
                            aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row item-form">
                            <div class="mb-3 col-12 col-md-6">
                                <div class="form-outline">
                                    <input type="text" class="form-control title" id="input-SeedName" required>
                                    <label class="form-label">Tên hạt giống</label>
                                    <div class="form-helper"></div>
                                </div>
                            </div>
                            <div class="mb-3 col-12 col-md-6">
                                <div class="form-outline">
                                    <input type="text" class="form-control" id="input-SeedType" required>
                                    <label class="form-label">Loai giống</label>
                                    <div class="form-helper"></div>
                                </div>
                            </div>
                            <div class="mb-3 col-12 col-md-6">
                                <div class="form-outline">
                                    <input type="number" class="form-control location" id="input-PlantingMonth" required>
                                    <label class="form-label">thời gian trồng</label>
                                </div>
                                <div class="form-text">Số tháng trồng (*)</div>
                            </div>
                            <div class="mb-3 mt-3 col-12">
                                <div class="form-outline">
                                    <textarea class="form-control" rows="4" id="textarea-Evaluate"></textarea>
                                    <label class="form-label">Đánh giá</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-mdb-dismiss="modal">
                            Đóng
                        </button>
                        <button type="button" class="btn btn-primary" data-id="0" id="btn-addSeed">Lưu</button>
                    </div>
                </div>
            </div>
        </div>
        <div
            class="modal fade"
            id="addCrop"
            tabindex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Thêm mùa vụ</h5>
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
                                    <input type="text" class="form-control" id="Crop_Title" runat="server">
                                    <label class="form-label">Tiêu đề</label>
                                    <div class="form-helper"></div>
                                </div>
                            </div>
                            <div class="mb-3 col-12 col-xl-6">
                                <div class="form-outline">
                                    <input type="text" class="form-control" id="Crop_Detail" runat="server">
                                    <label class="form-label">Thông tin thêm</label>
                                </div>
                            </div>
                            <div class="mb-3 col-12 col-xl-6">
                                <asp:DropDownList runat="server" class="form-select" ID="DropdownList_LoadFarm_AddCrop">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">
                            Đóng
                        </button>
                        <asp:Button Text="Lưu" CssClass="btn btn-primary" ID="btn_AddCrop" OnClick="btn_AddCrop_Click" runat="server" />
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.3.2/dist/chart.min.js"></script>
    <script src="Scripts/index.js"></script>
</asp:Content>

