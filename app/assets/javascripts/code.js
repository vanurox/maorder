$(document).ready(function(){
	
	fadeOutSharedMessage();
	
});

function fadeOutSharedMessage()
{
	$("#shared_msg").delay(3000).fadeOut(500);
	$("#shared_error").delay(3000).fadeOut(2000);

}