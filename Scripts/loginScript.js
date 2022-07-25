
$(function () {
    $(".btn-login").click(function (e) {
        if ($(".l-userID").val().trim() == "") {
            $(".l-userID").focus();
            $(".l-userID").addClass("bg-warning");
            $(".l-message").text("Bạn chưa nhập tên đăng nhập!");
            e.preventDefault();
            return;
        }
        else $(".l-userID").removeClass("bg-warning");
        if ($(".l-password").val().trim() == "") {
            $(".l-password").focus();
            $(".l-password").addClass("bg-warning");
            $(".l-message").text("Bạn chưa nhập mật khẩu!");
            e.preventDefault();
        }
    });

    $(".btn-register").click(function (e) {
        if ($(".r-userName").val().trim() == "") {
            $(".r-userName").addClass("bg-warning");
            $(".r-message").text("Bạn chưa nhập tên!");
            $(".r-userName").focus();
            e.preventDefault();
            return;
        }
        else $(".r-userName").removeClass("bg-warning");

        if ($(".r-userID").val().trim() == "") {
            $(".r-userID").addClass("bg-warning");
            $(".r-message").text("Bạn chưa nhập tên đăng nhập!");
            $(".r-userID").focus();
            e.preventDefault();
            return;
        }
        else $(".r-userID").removeClass("bg-warning");

        if ($(".r-password").val().trim() == "") {
            $(".r-password").focus();
            $(".r-password").addClass("bg-warning");
            $(".r-message").text("Bạn chưa nhập mật khẩu!");
            e.preventDefault();
            return;
        }
        else $(".r-password").removeClass("bg-warning");

        if ($(".r-rePassword").val().trim() == "") {
            $(".r-rePassword").focus();
            $(".r-rePassword").addClass("bg-warning");
            $(".r-message").text("Bạn chưa nhập lại mật khẩu!");
            e.preventDefault();
            return;
        }
        else $(".r-rePassword").removeClass("bg-warning");

        if ($(".r-password").val() != $(".r-rePassword").val()) {
            $(".r-password").focus();
            $(".r-password").addClass("bg-warning");
            $(".r-rePassword").addClass("bg-warning");
            $(".r-message").text("hai mật khẩu chưa giống nhau!");
            e.preventDefault();
        }
    });
})