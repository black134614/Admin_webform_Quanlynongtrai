$(function () {
    $('#farmList').DataTable();
    $(".btn-delete").on("click", function () {
        if (!confirm('Bạn có muốn xóa')) return false;
        var farmID = $(this).attr("data-id");
        var item = $(this);
        /*$(this).parents("tr").remove();*/
        //this not work ajax
        $.ajax({
            url: "FarmList.aspx/DeleteRow",
            data: "{'id':'" + farmID + "'}",
            dataType: "json",
            type: "POST",
            contentType: "application/json; chartset=utf-8",
            success: async function (data) {
                await alert(data.d);
                item.parents("tr").remove();
            },
            error: function () {
                alert("Error! Please try again.");
            }
        });
    });
    if ("geolocation" in navigator) {
        navigator.geolocation.getCurrentPosition(showcityname);
    }
    $(".watch-weather").on("click", function (e) {
        var pos = $(this).parents("tr").find(".location").text().trim();
        showWeatherByName(pos);
        e.preventDefault();
    });

});

function showcityname(position) {
    var lat = position.coords.latitude;
    var longit = position.coords.longitude;
    var altitude = position.coords.altitude;
    var latitude_text = document.getElementById("latitude-val");
    var altitude_text = document.getElementById("altit");
    var city_name;
    var temp;
    var pressure;
    var wind_speed;
    var country_name;
    var weather_description;
    var apiKey = "5dd765a29b95b2e058dfd9f33a1dbd0d";

    var a = $.getJSON("http://api.openweathermap.org/data/2.5/weather?lat=" + lat + "&lon=" + longit + "&lang=vi&appid=" + apiKey, function (data) {

        city_name = data["name"];
        country_name = data["sys"]["country"];
        weather_description = data["weather"][0]["description"];
        temp = Math.round(data["main"]["temp"] - 273.15);
        humidity = data["main"]["humidity"];
        pressure = data["main"]["pressure"];
        wind_speed = data["wind"]["speed"];

        $(".cur-city").html(city_name + " Có " + weather_description);
        $(".cur-temp").html("<span class='fa fa-temperature-low me-1 text-danger'></span> " + temp);
        $(".cur-humidity").html("Độ ẩm :" + humidity );
        $(".cur-wind").html("<span class='fa fa-wind me-1 text-primary'></span>:" + wind_speed + " m/s");

    })
    console.log(a);

}


function showWeatherByName(position) {
    var city_name = position;
    var temp;
    var pressure;
    var wind_speed;
    var country_name;
    var weather_description;
    var apiKey = "5dd765a29b95b2e058dfd9f33a1dbd0d";
    debugger;
    var a = $.getJSON("http://api.openweathermap.org/data/2.5/weather?q=" + position + "&lang=vi&appid=" + apiKey, function (data) {
        city_name = data["name"];
        country_name = data["sys"]["country"];
        weather_description = data["weather"][0]["description"];
        temp = Math.round(data["main"]["temp"] - 273.15);
        humidity = data["main"]["humidity"];
        pressure = data["main"]["pressure"];
        wind_speed = data["wind"]["speed"];

        $(".show-city").html(city_name + " Có " + weather_description);
        $(".show-temp").html("<span class='fa fa-temperature-low me-1 text-danger'></span> " + temp);
        $(".show-humidity").html("Độ ẩm :" + humidity);
        $(".show-wind").html("<span class='fa fa-wind me-1 text-primary'></span>:" + wind_speed + " m/s");
        $(".show-weather").addClass("alert alert-primary");
    }).fail(function (xhr) {
        if (xhr.status == 404) {
            alert("Tên thành phố không có trong dữ liệu");
            location.reload();
        }
    });
}