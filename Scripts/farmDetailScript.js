function getRandomColor() {
    var r = () => Math.random() * 256 >> 0;
    var color = `rgb(${r()}, ${r()}, ${r()})`;
    return color;
}
$(function () {

    $(".btn-delete").on("click", function () {
        if (!confirm('Bạn có muốn xóa')) return false;
        var cropStepID = $(this).attr("data-id");
        var item = $(this);
        /*$(this).parents("tr").remove();*/
        $.ajax({
            url: "FarmDetail.aspx/DeleteRow",
            data: "{'id':'" + cropStepID + "'}",
            dataType: "json",
            type: "POST",
            contentType: "application/json; chartset=utf-8",
            success: async function (data) {
                debugger;
                await alert(data.d);
                item.parents("tr").remove();
            },
            error: function () {
                alert("Error! Please try again.");
            }
        });
    });

    $(".btn-delete-crop-step").on("click", function (e) {
        if (!confirm('Bạn có muốn xóa')) return false;
        var cropStepID = $(this).attr("data-id");
        var item = $(this);
        /*$(this).parents("tr").remove();*/
        $.ajax({
            url: "FarmDetail.aspx/DeleteCropStep",
            data: "{'id':'" + cropStepID + "'}",
            dataType: "json",
            type: "POST",
            contentType: "application/json; chartset=utf-8",
            success: async function (data) {
                debugger;
                await alert(data.d);
                item.parents("tr").remove();
            },
            error: function () {
                alert("Error! Please try again.");
            }
        });
        e.preventDefault();
    });

    $(".btn-add-crop-step").on("click", function (e) {
        if (!confirm('Bạn có muốn thêm?')) return false;
        var cropStepID = $(this).attr("data-id");
        var item = $(this);
        /*$(this).parents("tr").remove();*/
        $.ajax({
            url: "FarmDetail.aspx/AddCropStep",
            data: "{'id':'" + cropStepID + "'}",
            dataType: "json",
            type: "POST",
            contentType: "application/json; chartset=utf-8",
            success: async function (data) {
                debugger;
                await alert(data.d);
                item.parents("tr").remove();
                location.reload();
            },
            error: function () {
                alert("Error! Please try again.");
            }
        });
    });

    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Lúa', 'Mì', 'Đậu nành', 'Cải thìa', 'Đậu xanh', 'Đậu phụ'],
            datasets: [{
                label: 'Số vụ mùa đã trồng',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            },
                {
                    label: 'Thu nhập (triệu VND)',
                    data: [25,20,40,50,20,10],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                },
                {
                     label: 'Thời gian chăm sóc (tháng)',
                    data: [6, 5, 2, 3, 1, 1.5],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }            ]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
    $.ajax({
        url: "Default.aspx/GetSpendingChart",
        data: "",
        dataType: "json",
        type: "POST",
        contentType: "application/json; chartset=utf-8",
        success: async function (data) {
            chartData = await data.d;
            console.log(chartData);
        },
        error: function () {
            alert("Error loading data (GetSpendingChart)! Please try again.");
        }
    });


    $('#cropManage').DataTable();
});

