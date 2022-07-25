<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StepManage.aspx.cs" Inherits="StepManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Quản lý nông trại - canh tác</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-content-item">
        <div class="item">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="FarmList.aspx">nông trại</a></li>
                    <li class="breadcrumb-item active">Quản lý thông tin trang trại
                    <li class="breadcrumb-item active">Quản lý thông tin trang trại
                    </li>
                </ol>
            </nav>
            <div class="row item-form">
                <div class="col-12 text-center">
                    <h3>
                        <span class="fa fa-star text-danger"></span>
                        Quản lý quy trình canh tác
                    </h3>
                </div>
                <table id="stepList" class="table table-data table-striped col-12">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên</th>
                            <th style="min-width: 150px">Mô tả</th>
                            <th>Ngày cập nhật</th>
                            <th class="text-center">Thực hiện</th>
                            <th class="text-center">Sửa</th>
                            <th class="text-center">Xóa</th>
                        </tr>
                    </thead>
                    <tbody id="step-data">
                    </tbody>
                </table>
                <div class="col-12 row mt-5">
                    <div class="col-12">
                        <h3 class="text-center">
                            <span class="fa fa-star text-warning"></span>
                            Thêm / sửa quy trình
                        </h3>
                    </div>
                    <div class="col-12">
                        <h5 class="alert alert-success py-3" id="page-mesage" data-mdb-color="success">
                            <span class="fa fa-info-circle"></span>
                            Thao tác thành công!
                        </h5>
                    </div>
                    <div class="mb-3 col-12 col-lg-5">
                        <div class="form-outline">
                            <input type="text" class="form-control" id="inputName" data-mdb-showcounter="true" maxlength="50">
                            <label class="form-label">Tên</label>
                            <div class="form-helper"></div>
                        </div>
                    </div>
                    <div class="mb-3 col-12 col-lg-5">
                        <div class="form-outline">
                            <input type="text" class="form-control" id="inputDescripton">
                            <label class="form-label">Mô tả</label>
                        </div>
                    </div>
                    <div class="mb-3 col-12 col-md-2">
                        <div class="form-outline">
                            <label class="form-label">Thực hiện</label>
                            <input type="checkbox" class="form-check-input" id="checkBoxActive">
                        </div>
                    </div>
                    <div class="mb-3 mt-3 col-12">
                        <button type="submit" class="btn btn-primary btn-add" data-id="0">Đồng ý</button>
                        <a href="farmDetail.aspx" class="btn btn-danger" id="getId" runat="server">Quay về trang quản lý</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <script src="Scripts/stepScript.js"></script>

</asp:Content>

