function getRandomColor() {
    var r = () => Math.random() * 256 >> 0;
    var color = `rgb(${r()}, ${r()}, ${r()})`;
    return color;
}
function addSeedRow(id, seedName, seedType, plantingMonth, evaluate) {
    $.ajax({
        url: "Default.aspx/addSeedRow",
        data: "{'id':'" + id + "','SeedName':'" + seedName + "','SeedType':'" + seedType + "','PlantingMonth':'" + plantingMonth + "','Evaluate':'" + evaluate + "'}",
        dataType: "json",
        type: "POST",
        contentType: "application/json; chartset=utf-8",
        success: async function (data) {
            debugger;
            alert(await data.d);
            location.reload();
        },
        error: function () {
            alert("Error! Please try again.");
        }
    });
}

function getSpendChart(fromdate, todate) {
    $.ajax({
        url: "Default.aspx/GetSpendingChart",
        data: "{'fromdate':'" + fromdate + "','todate':'" + todate + "'}",
        dataType: "json",
        type: "POST",
        contentType: "application/json; chartset=utf-8",
        success: async function (data) {
            chartData = await data.d;
            var arr = chartData;
            var spendingChartLabel = [];
            var ColorArr = [];
            for (var i = 1; i < arr.length; i++) {
                ColorArr.push(getRandomColor())
            }
            for (var i = 1; i < arr.length; i++) {
                spendingChartLabel.push(arr[i][0])
            }
            var spendingChartData = [];
            for (var i = 1; i < arr.length; i++) {
                spendingChartData.push(arr[i][1])
            }
            console.log(spendingChartData);
            var ctx = document.getElementById('spendingChart').getContext('2d');
            var spendingChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: spendingChartLabel,
                    datasets: [{
                        label: 'Chi tiêu gần đây (VND)',
                        data: spendingChartData,
                        backgroundColor: ColorArr,
                        borderColor: ColorArr,
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        },
        error: function () {
            alert("Error loading data (GetSpendingChart)! Please try again.");
        }
    });
}
function getProfitChart(fromdate, todate) {
    $.ajax({
        url: "Default.aspx/GetProfitChart",
        data: "{'fromdate':'" + fromdate + "','todate':'" + todate + "'}",
        dataType: "json",
        type: "POST",
        contentType: "application/json; chartset=utf-8",
        success: async function (data) {
            chartData = await data.d;
            var arr = chartData;
            var ColorArr = [];
            for (var i = 1; i < arr.length; i++) {
                ColorArr.push(getRandomColor())
            }
            var ProfitChartLabel = [];
            for (var i = 1; i < arr.length; i++) {
                ProfitChartLabel.push(arr[i][0])
            }
            var ProfitChartData = [];
            for (var i = 1; i < arr.length; i++) {
                ProfitChartData.push(arr[i][1])
            }
            var ctx = document.getElementById('profitChart').getContext('2d');
            var ProfitChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ProfitChartLabel,
                    datasets: [{
                        label: 'Thu nhập gần đây (VND)',
                        data: ProfitChartData,
                        backgroundColor: ColorArr,
                        borderColor: ColorArr,
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        },
        error: function () {
            alert("Error loading data (GetProfitChart)! Please try again.");
        }
    });

}
$(function () {
    debugger;
    var dateVar = "2010-10-30";
    var fd = new Date(dateVar).toJSON();
    var td = new Date(Date.now()).toJSON();
    getSpendChart(fd, td);
    getProfitChart(fd, td);
    $("#spendChartByDate").on("click", function () {
        $("#spendingChartReport").find("#spendingChart").remove();
        document.querySelector("#spendingChartReport").innerHTML = '<canvas id="spendingChart"></canvas>';
        var fromdate = $(".spend-from-date").val();
        var todate = $(".spend-to-date").val();
        getSpendChart(fromdate, todate);
    });
    $("#profitChartByDate").on("click", function () {
        $("#profitChartReport").find("#profitChart").remove();
        document.querySelector("#profitChartReport").innerHTML = '<canvas id="profitChart"></canvas>';
        var fromdate = $(".profit-from-date").val();
        var todate = $(".profit-to-date").val();
        getprofitChart(fromdate, todate);
    });

    if ($("#farmList .list-group.list-group-numbered").has("li").length == 0) {
        $("#farmList .watch-btn").addClass("disabled");
        $("#farmList .card-title").html("Bạn chưa có dữ đất trồng để quản lý!");
        $("#farmList .card-title").append("<br /><span class='text-warning'>Vui lòng thêm mới</span>")
    }

    if ($("#seedList .list-group.list-group-numbered").has("li").length == 0) {
        $("#seedList .watch-btn").addClass("disabled");
        $("#seedList .card-title").html("Bạn chưa thêm giống cây trồng!");
        $("#seedList .card-title").append("<br /><span class='text-warning'>Vui lòng thêm mới!</span>")
    }

    $("#btn-addSeed").on("click", function () {
        debugger;
        var id = $(this).attr("data-id");
        var seedName = $("#input-SeedName").val().trim();
        var seedType = $("#input-SeedType").val().trim();
        var plantingMonth = $("#input-PlantingMonth").val().trim();
        var evaluate = $("#textarea-Evaluate").val().trim();
        addSeedRow(id, seedName, seedType, plantingMonth, evaluate);
    });

});