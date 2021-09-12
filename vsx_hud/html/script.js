$(document).ready(function() {
    $("#page").hide();
});

window.addEventListener('message', function(event) {
    var edata = event.data;
    if (edata.type == "toggle") {
        if (edata.value) {
            $("#page").show();
        } else {
            $("#page").hide();
        }    
    }
    if (edata.type == "update") {
        $("#page").show();
        $("#dirty_money").text(edata.dirty_money);
        $("#money").text(edata.money);
        $("#bank").text(edata.bank);
        $("#job").text(edata.job);    
    }
});