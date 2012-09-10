var store_id = $('#id');
var form = $('#profileImage');
var input_file = $('#profileImage input');
var deleteProfileImage = $('#deleteProfileImage');
var logo = $('#logo');

$(function(){
	$('div.body form').submit(function() {
		$(this).ajaxSubmit();
		return false;
	});
	
	if ( logo.val() ) {
		var data = {'image':{'name':logo.val()}};
		showResponse(data);
	} else {
		showDefault();
	}
	
	
	
	$('#deleteProfileImage').click(function(){
		var options = { 
			//target:        '#output1',   // target element(s) to be updated with server response 
			beforeSubmit:  showDeleteRequest,  // pre-submit callback 
			success:       showDefault,  // post-submit callback 
	 
			// other available options: 
			url:       '/admin/store/delete-profile-image',         // override for form's 'action' attribute 
			type:      'post',        // 'get' or 'post', override for form's 'method' attribute 
			dataType:  'json',        // 'xml', 'script', or 'json' (expected server response type) 
			//clearForm: true        // clear all form fields after successful submit 
			//resetForm: true        // reset the form after successful submit 
			data:{'format':'json'}
	 
			// $.ajax options can be used here too, for example: 
			//timeout:   3000 
		}; 
		$('#profileImage').ajaxSubmit(options);
		
		return false;
	});

})

input_file.change(function(){
	var options = { 
		//target:        '#output1',   // target element(s) to be updated with server response 
		beforeSubmit:  showRequest,  // pre-submit callback 
		success:       showResponse,  // post-submit callback 
 
		// other available options: 
		//url:       url         // override for form's 'action' attribute 
		type:      'post',        // 'get' or 'post', override for form's 'method' attribute 
		dataType:  'json',        // 'xml', 'script', or 'json' (expected server response type) 
		//clearForm: true        // clear all form fields after successful submit 
		//resetForm: true        // reset the form after successful submit 
		data:{'format':'json'},
		iframe:true
 
		// $.ajax options can be used here too, for example: 
		//timeout:   3000 
	}; 
	form.ajaxSubmit(options);

});

// pre-submit callback 
function showRequest(formData, jqForm, options) {
	$('.profile-image-loading span.file-name').html(formData[0]['value']);
	$('.profile-image-loading').show();
	$('.profile-file-name, .input-file-bg, #profileImage').hide();
	
	return true; 
}

// show delete request
function showDeleteRequest() {
	$('.profile-image-loading span.file-name').html('deleting...');
	$('.profile-image-loading').show();
	$('.profile-file-name, .input-file-bg, #profileImage').hide();
	
	return true; 
} 
 
// post-submit callback 
function showResponse(data)  {
	$('.profile-file-name span.file-name').html(data['image']['name']);
	$('.profile-file-name').show();
	$('.profile-image-loading, .input-file-bg, #profileImage').hide();
	logo.val(data['image']['name']);
	
	form.resetForm();
}

// show file input
function showDefault()  {
	$('.input-file-bg, #profileImage').show();
	$('.profile-image-loading, .profile-file-name').hide();
	
	form.resetForm();
}

