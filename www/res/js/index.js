// JavaScript Document
function init() {
document.addEventListener("deviceready", deviceReady, true);
delete init;
}

function deviceReady() {

$("#loginForm").on("submit",function(e) {
    //disable the button so we can't resubmit while we wait
    $("#continue",this).attr("disabled","disabled");
var u = $("#user", this).val();
var p = $("#password", this).val();
if(u != '' && p!= '') {
    $.post("http://www.mrtimeclock.com/scripts/login.cfm", {user:u,password:p}, function(res) {
        if(res == true) {
            $.mobile.changePage("some.html");
        } else {
            navigator.notification.alert("Your login failed", function() {});
        }
         $("#submitButton").removeAttr("disabled");
    },"json");
}
return false;
});

}