$(function () {
    var cropStepID = getUrlVars()["cropStepID"];
    callLoadData(cropStepID);
    $(".btn-add").on("click", function (e) {
        debugger;
        var StepID = $(this).attr("data-id");
        var name = $("#inputName").val();
        var description = $("#inputDescripton").val();
        var isActive = false;
        if ($("#checkBoxActive").prop("checked")) {
            isActive = true;
        }
        addRow(StepID, cropStepID, name, description, isActive);
        callLoadData(cropStepID)
        e.preventDefault();
    });
});
function getUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}
function callLoadData(cropStepID) {
    $.ajax({
        url: "StepManage.aspx/LoadContent",
        data: "{'id':'" + cropStepID + "'}",
        dataType: "json",
        type: "POST",
        contentType: "application/json; chartset=utf-8",
        success: function (data) {
            getData = data.d;
            console.log(getData);
            var arrStepID = [];
            for (var i = 0; i < getData.length; i++) {
                arrStepID.push(getData[i][0]);
            }
            var arrStepName = [];
            for (var i = 0; i < getData.length; i++) {
                arrStepName.push(getData[i][1]);
            }
            var arrStepDescription = [];
            for (var i = 0; i < getData.length; i++) {
                arrStepDescription.push(getData[i][2]);
            }
            var arrisActive = [];
            for (var i = 0; i < getData.length; i++) {
                if (getData[i][3] == null) {
                    arrisActive.push(false);
                }
                else arrisActive.push(getData[i][3]);
            }
            var arrUpdateDate = [];
            for (var i = 0; i < getData.length; i++) {
                var a = new Date(1622912400000);
                var day = a.getDate();
                var m = a.getMonth();
                var y = a.getFullYear();
                arrUpdateDate.push(day + '/' + m + '/' + y);
            }
            $("#step-data").empty();
            for (var i = 0; i < arrStepID.length; i++) {
                $("#step-data").append('<tr><td class="stt"> ' + (i + 1) + '</td><td class="step-name">' + arrStepName[i] + '</td><td class="step-description">' + arrStepDescription[i] + '</td><td class="step-date">' + arrUpdateDate[i] + '</td> <td class="text-center"><input type="checkbox" class="form-check-input input-active" data-id=' + arrStepID[i] + ' onclick="activeRow(event, this)" /></td><td class="text-center"><a class="text-primary btn-step-edit" href="" data-id=' + arrStepID[i] + ' onclick="editRow(event, this)"><span class="fa fa-edit"></span></a></td><td class="text-center"><a class="text-danger bt-step-delete" href="" data-id=' + arrStepID[i] + ' onclick="deleteRow(event, this)"><span class="fa fa-trash"></span></a></td></tr>');
            }
            var input = document.getElementsByClassName("input-active");
            for (var i = 0; i < input.length; i++) {
                if (arrisActive[i]) {
                    input[i].checked = true;
                    input[i].setAttribute("disabled", "");
                }
            }
        },
        error: function () {
            alert("Error loading data ()! Please try again.");
        }
    });
}
function deleteRow(e, d) {
    debugger;
    if (!confirm('Bạn có muốn xóa')) return false;
    var StepID = $(d).attr("data-id");
    $.ajax({
        url: "StepManage.aspx/DeleteRow",
        data: "{'id':'" + StepID + "'}",
        dataType: "json",
        type: "POST",
        contentType: "application/json; chartset=utf-8",
        success: async function (data) {
            debugger;
            await alert(data.d);
            var cropStepID = getUrlVars()["cropStepID"];
            callLoadData(cropStepID);
        },
        error: function () {
            alert("Error! Please try again.");
        }
    });
    e.preventDefault();
}
function activeRow(e, d) {
    debugger;
    if (!confirm('Bạn đã hoàn thành công đoạn này chứ?')) { e.preventDefault(); return false };
    var StepID = $(d).attr("data-id");
    $.ajax({
        url: "StepManage.aspx/activeRow",
        data: "{'id':'" + StepID + "'}",
        dataType: "json",
        type: "POST",
        contentType: "application/json; chartset=utf-8",
        success: async function (data) {
            debugger;
            await alert(data.d);
        },
        error: function () {
            alert("Error! Please try again.");
        }
    });
    $(d).prop("disabled", true);
}
function editRow(e, d) {
    debugger;
    alert('Cập nhật / chỉnh sửa ở form bên dưới!');
    var StepID = $(d).attr("data-id");
    $.ajax({
        url: "StepManage.aspx/LoadEditRow",
        data: "{'id':'" + StepID + "'}",
        dataType: "json",
        type: "POST",
        contentType: "application/json; chartset=utf-8",
        success: async function (data) {
            debugger;
            var getData = await data.d;
            var name = getData[0][0];
            var description = getData[0][1];
            var isActive = false;
            if (getData[0][2] || getData[0][2] == null) {
                isActive = true;
            }
            $("#inputName").val(name);
            $("#inputName").addClass("active");
            $("#inputDescripton").val(description);
            $("#inputDescripton").addClass("active");
            $("#checkBoxActive").prop("checked", false);
            if (isActive) {
                $("#checkBoxActive").prop("checked", true);
            }
        },
        error: function () {
            alert("Error! Please try again.");
        }
    });
    $(".btn-add").attr("data-id", StepID);
    e.preventDefault();
}
function addRow(StepID, cropStepID, name, description, isActive) {
    $.ajax({
        url: "StepManage.aspx/addRow",
        data: "{'id':'" + StepID + "','cropStepID':'" + cropStepID + "','name':'" + name + "','description':'" + description + "','isActive':'" + isActive + "'}",
        dataType: "json",
        type: "POST",
        contentType: "application/json; chartset=utf-8",
        success: async function (data) {
            debugger;
            alert(await data.d);
        },
        error: function () {
            alert("Error! Please try again.");
        }
    });
    $(".btn-add").attr("data-id", "0");
    $("#inputName").val("");
    $("#inputDescripton").val("");
    $("#checkBoxActive").prop("checked", false);
}