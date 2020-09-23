var frm = $('ajaxlogin');
$('#submitbutton').click(function (e) {
    var datasend = { Username: document.formlogin.Username.value, Password: document.formlogin.Password.value };
    $.ajax({
        url: "/Login/Index",
        type: "POST",
        data: datasend,/*Tự mapping đến name trong form login*/
        success: function (result) {
            if (result == "true") {
                window.location.href = '/Home/Trangchu';
            }
            else {
                window.alert("Tài khoản hoặc mật khẩu không chính xác !!");
            }
        },
    })
});