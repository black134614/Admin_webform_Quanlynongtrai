<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CropStepList.aspx.cs" Inherits="CropStepList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Quản lý nông trại - canh tác</title>
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
            <div class="row item-form">
                <div class="col-12">
                    <h5 class="alert alert-success py-3" id="page-mesage" data-mdb-color="success">
                        <span class="fa fa-info-circle"></span>
                        Thao tác thành công! bạn có thể lên kế hoạch canh tác
                                <a href="#">lúa - đông xuân</a> tại đây!
                    </h5>
                </div>
                <div class="mb-3 col-12 col-lg-6">
                    <div class="form-outline">
                        <input type="text" class="form-control" id="input_TypeOfCrop" data-mdb-showcounter="true" maxlength="50">
                        <label class="form-label">Tên gợi nhớ</label>
                        <div class="form-helper"></div>
                    </div>
                    <div class="form-text">Ví dụ: Canh tác lúa OM</div>
                </div>
                <div class="mb-3 col-12 col-lg-6">
                    <div class="form-outline">
                        <input type="text" class="form-control" id="input_FarmLocation">
                        <label class="form-label">Thông tin thêm</label>
                    </div>
                    <div class="form-text">Ví dụ: Canh tác lúa OM vụ xuân</div>
                </div>
                <div class="mb-3 mt-3 col-6">
                    <select class="form-select">
                        <option selected>Chọn Giống</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <div class="mb-3 mt-3 col-6">
                    <select class="form-select">
                        <option selected>Mùa vụ</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <div class="mb-3 mt-3 col-12">
                    <div class="form-outline">
                        <textarea class="form-control" rows="4" id="textarea_Note"></textarea>
                        <label class="form-label">Đánh giá</label>
                    </div>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">Đồng ý</button>
                    <button type="submit" class="btn btn-danger">Hủy</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>

