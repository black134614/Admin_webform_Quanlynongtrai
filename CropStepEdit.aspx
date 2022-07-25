<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CropStepEdit.aspx.cs" Inherits="CropStepEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Quản lý nông trại - Canh tác</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-content-item">
        <div class="item">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="FarmList.aspx">nông trại</a></li>
                    <li class="breadcrumb-item active">Quản Lý nông trại</li>
                </ol>
            </nav>
            <div class="row item-form">
                <div class="col-12">
                    <h5 class="alert alert-success py-3" id="page_mesage" runat="server" data-mdb-color="success">
                        <span class="fa fa-info-circle"></span>
                        Thao tác thành công! bạn có thể lên kế hoạch canh tác
                                <a href="#">lúa - đông xuân</a> tại đây!
                    </h5>
                </div>
                <div class="mb-3 col-12 col-lg-6">
                    <div class="form-outline">
                        <input type="text" class="form-control" id="input_Title" runat="server" data-mdb-showcounter="true" maxlength="50">
                        <label class="form-label">Tên gợi nhớ</label>
                        <div class="form-helper"></div>
                    </div>
                    <div class="form-text">Ví dụ: Canh tác lúa OM</div>
                </div>
                <div class="mb-3 col-12 col-lg-6">
                    <div class="form-outline">
                        <input type="text" class="form-control" id="input_Detail" runat="server">
                        <label class="form-label">Thông tin thêm</label>
                    </div>
                    <div class="form-text">Ví dụ: Canh tác lúa OM vụ xuân</div>
                </div>
                <div class="mb-3 mt-3 col-6">
                    <span>Chọn hạt giống</span>
                    <asp:DropDownList runat="server" ID="dropdown_Seed" class="form-select">
                    </asp:DropDownList>
                </div>
                <div class="mb-3 mt-3 col-6">
                    <span>Chọn mùa vụ</span>
                     <asp:DropDownList runat="server" ID="dropdown_Crop" class="form-select">
                    </asp:DropDownList>
                </div>
                <div class="mb-3 col-12 col-lg-6">
                    <div class="form-outline">
                        <label class="form-label">Đang trồng</label>
                        <input type="checkbox" class="form-check-input"  ID="checkbox_Active" runat="server" />
                    </div>
                    <div class="form-text">Mô tả: Canh tác này đang thực hiện! chọn để theo dõi!</div>
                </div>
                <div class="mb-3 mt-3 col-12">
                    <div class="form-outline">
                        <textarea class="form-control" rows="4" id="textarea_Evalute" runat="server"></textarea>
                        <label class="form-label">Đánh giá</label>
                    </div>
                </div>
                <div class="col-12">
                    <asp:Button Text="Đồng ý" id="btnAdd" class="btn btn-primary" OnClick="btnAdd_Click" runat="server" />
                    <a href="" class="btn btn-danger" id="getId" runat="server">Quay về trang quản lý</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>

