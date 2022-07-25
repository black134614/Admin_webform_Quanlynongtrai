<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="farmEdit.aspx.cs" Inherits="farmEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Quản lý nông trại - nông trại</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-content-item">
        <div class="item">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                   <li class="breadcrumb-item active">Nông trại</li>
                </ol>
            </nav>
            <div class="row item-form">
                <div class="col-12">
                    <h5 class="alert alert-success py-3" id="page_message" data-mdb-color="success" runat="server">
                        <span class'fa fa-info-circle'></span>
                        Thao tác thành công! bạn có thể quản lý cánh đồng
                                <a href="#">lúa - đông xuân</a> tại đây!
                    </h5>
                </div>
                <div class="mb-3 col-12 col-lg-6">
                    <div class="form-outline">
                        <input type="text" class="form-control title" id="input_TypeOfCrop" runat="server" data-mdb-showcounter="true" maxlength="50">
                        <label class="form-label">Tên cánh đồng</label>
                        <div class="form-helper"></div>
                    </div>
                    <div class="form-text">Ví dụ: Đất nhà</div>
                </div>
                <div class="mb-3 col-12 col-lg-6">
                    <div class="form-outline">
                        <input type="text" class="form-control" id="input_Detail" runat="server" data-mdb-showcounter="true" maxlength="50">
                        <label class="form-label">Mô tả nhanh</label>
                        <div class="form-helper"></div>
                    </div>
                    <div class="form-text">Ví dụ: Đất nhà 3 phèn</div>
                </div>
                <div class="mb-3 col-12 col-lg-6">
                    <div class="form-outline">
                        <input type="text" class="form-control location" id="input_FarmLocation" runat="server">
                        <label class="form-label">Vị trí cánh đồng</label>
                    </div>
                    <div class="form-text">Hỗ trợ tên cấp huyện có hoặc không dấu. ví dụ: Châu thành Tây Ninh hoặc Chau Thanh</div>
                </div>
                <div class="mb-3 mt-3 col-12">
                    <div class="form-outline">
                        <textarea class="form-control" rows="4" id="textarea_Note" runat="server"></textarea>
                        <label class="form-label">Ghi chú thêm</label>
                    </div>
                </div>
                <div class="col-12">
                    <asp:Button CssClass="btn btn-primary btn-add" Text="Đồng ý" ID="Btn_Add" OnClick="Btn_Add_Click" runat="server" />
                    <a href="FarmList.aspx" class="btn btn-danger">Danh sách cánh đồng</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <script>
        $(function () {
            $(".btn-add").click(function (e) {
                if ($(".title").val().trim() == "") {
                    $(".title").focus();
                    $(".title").addClass("bg-warning");
                    e.preventDefault();
                    return;
                }
                else $(".location").removeClass("bg-warning");
                if ($(".location").val().trim() == "") {
                    $(".location").focus();
                    $(".location").addClass("bg-warning");
                    e.preventDefault();
                    return;
                }
            })
        })
    </script>
</asp:Content>

