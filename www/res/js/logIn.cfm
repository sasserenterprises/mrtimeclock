
// JavaScript Document
$(document).ready(function(){


function go(){

    
    
             password = $('#password').val();
			 hashStart = sha256_digest(password);
			 hash = hashStart.toUpperCase();
			 email = $('#email').val();
		var xhr  = new XMLHttpRequest();
		xhr.open("POST", 'loginProccessing.cfm', true);
			var boundary1 = '------multipartformboundary' + (new Date).getTime(); 
			dashdash = '--'; 
			crlf = '\r\n';
			
			content = dashdash+boundary1+crlf+'Content-Disposition: form-data; name="data"'+crlf+crlf+email+'~'+hash+crlf+dashdash+boundary1+dashdash+crlf;
		xhr.setRequestHeader("Content-type", "multipart/form-data; boundary="+boundary1);
		<!--xhr.setRequestHeader("Content-length", content.length);-->
		<!--xhr.setRequestHeader("Connection", "close");-->
		// execute
		xhr.onreadystatechange = function() {
     var serverresponse = xhr.responsetext;
xhr.onload = function () {
    // do something to response
    if(this.responseText==0){
		$('#end').html(
			'<form action="http://photophlipper.com" method="post" enctype="multipart/form-data" id="redirect" target="_top"><input id="data" name="data" type="hidden" value="'+email+'~'+hash+'" /></form>'
		);
		$('#redirect').submit();
	
    
    
    
    
    
    }else if(this.responseText==2){
		$('#invalid').html(' &nbsp; User does not exist &nbsp; ');
	}else if(this.responseText==1){
		$('#invalid').html(' &nbsp; password does not match &nbsp; ');
    }else if(this.responseText==3){
		$('#invalid').html(' &nbsp; check you email to complete &nbsp; <br /> &nbsp; registration &nbsp; ');
	};
};

   };

		xhr.send(content);
};






function validateEmail(sEmail) {
    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (filter.test(sEmail)) {
        return true;
}
else {
        return false;
}
	}

$('#continue').bind('vclick',function(e){
        var sEmail = $('#email').val();
        if ($.trim(sEmail).length == 0) {
            $('#invalid').html(' &nbsp; Please enter valid email address &nbsp; ');
            e.preventDefault();
        }
        if (validateEmail(sEmail)) {
            
            	if($('#password').val()!=""){
            go();}else{
            $('#invalid').html(' &nbsp; enter a password &nbsp; ')
            };
   
        }
        else {
            $('#invalid').html(' &nbsp; Invalid Email Address &nbsp; ');
            e.preventDefault();
        }
    });

});