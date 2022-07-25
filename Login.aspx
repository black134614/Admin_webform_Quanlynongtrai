<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Quản lý nông trại - đăng nhập</title>
    <link href="filesUpload/system/favicon.jpg" rel="shortcut icon" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/fontawesome.css" rel="stylesheet" />
    <link href="Content/all.css" rel="stylesheet" />
    <link href="Content/animate.min.css" rel="stylesheet" />
    <link href="plugins/MDB/mdb.min.css" rel="stylesheet" />
    <link href="Content/style.css" rel="stylesheet" />
</head>
<body>
    <form id="Login_Form" runat="server">
        <!--Main Navigation-->
        <header>
            <style>
                #intro {
                    background-image: url(filesUpload/system/loginwaper.jpg);
                    height: 100vh;
                }

                .navbar .nav-link {
                    color: #fff !important;
                }
            </style>
            <!-- Background image -->
            <div id="intro" class="bg-image shadow-2-strong">
                <div class="mask d-flex align-items-center h-100" style="background-color: rgba(0, 0, 0, 0.8);">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-xl-5 col-md-8">
                                <div class="bg-white rounded shadow-5-strong p-5">
                                    <div class="form-outline mb-4">
                                        <input type="text" id="UserID" runat="server" class="form-control l-userID" />
                                        <label class="form-label">Tên Đăng Nhập</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="password" id="Password" runat="server" class="form-control l-password" />
                                        <label class="form-label">Mật Khẩu</label>
                                    </div>

                                    <!-- 2 column grid layout for inline styling -->
                                    <div class="row mb-4">
                                        <div class="col d-flex justify-content-center">
                                            <!-- Checkbox -->
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="Remember" runat="server" />
                                                <label class="form-check-label">
                                                    Ghi nhớ
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col text-center">
                                            <!-- Simple link -->
                                            <a href="#">Quên mật khẩu?</a>
                                        </div>
                                    </div>

                                    <!-- Submit button -->
                                    <asp:Button Text="Đăng nhập" ID="Btn_Login" OnClick="Btn_Login_Click" runat="server" class="btn btn-primary btn-block btn-login" />
                                    <button type="button" class="btn btn-success btn-block" data-bs-toggle="modal" data-bs-target="#registerModal">Đăng kí</button>
                                    <div class="text-center text-warning">
                                        <strong id="l_Mesage" runat="server" class="l-message"></strong>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal -->
                            <div class="modal fade" id="registerModal" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Đăng kí mới</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="bg-white rounded p-5">
                                                <div class="form-outline mb-3">
                                                    <input type="text" id="input_UserName" runat="server" class="form-control r-userName" />
                                                    <label class="form-label">Tên của bạn</label>
                                                </div>
                                                <div class="form-outline mb-3">
                                                    <input type="text" id="input_UserID" runat="server" class="form-control r-userID" />
                                                    <label class="form-label">Tên Đăng Nhập</label>
                                                </div>
                                                <div class="form-outline mb-3">
                                                    <input type="password" id="input_Password" runat="server" class="form-control r-password" />
                                                    <label class="form-label">Mật Khẩu</label>
                                                </div>
                                                <div class="form-outline mb-3">
                                                    <input type="password" class="form-control r-rePassword" />
                                                    <label class="form-label">Nhập lại mật khẩu</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Quay lại đăng nhập</button>
                                            <asp:Button Text="Đăng kí" ID="btn_Register" OnClick="btn_Register_Click" class="btn btn-primary btn-register" runat="server" />
                                            <div class="text-center text-warning">
                                                <strong id="r_Message" runat="server" class="r-message"></strong>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Background image -->
        </header>
        <!--Main Navigation-->
        <section id="script">
            <script src="Scripts/jquery-3.6.0.min.js"></script>
            <script src="Scripts/popper.min.js"></script>
            <script src="Scripts/bootstrap.js"></script>
            <script src="plugins/MDB/mdb.min.js"></script>
            <script src="Scripts/loginScript.js"></script>
        </section>
    </form>
</body>
</html>
