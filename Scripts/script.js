$(function () {
    $(".btn-toggle-menu").on("click", function () {
        $(this).toggleClass("on");
        $("#asideNavbar").toggleClass("on");
    });
});


