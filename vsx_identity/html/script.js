$(function() {
	window.addEventListener('message', function(event) {
		if (event.data.type == "enableui") {
			document.body.style.display = event.data.enable ? "block" : "none";
		}
	});
	document.onkeyup = function (data) {
		if (data.which == 27) {
			$.post('http://vsx_identity/escape', JSON.stringify({}));
		}
	};
	$("#register").submit(function(event) {
		event.preventDefault();
		var date = $("#dateofbirth").val();
		var dateCheck = new Date($("#dateofbirth").val());
		if (dateCheck == "Invalid Date") {
			date == "invalid";
		}
		$.post('http://vsx_identity/register', JSON.stringify({firstname: $("#firstname").val(), lastname: $("#lastname").val(), dateofbirth: date, sex: $(".sex:checked").val(), height: $("#height").val()}));
	});
});