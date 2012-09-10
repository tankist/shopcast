//Адреса и различные константы
var ADD_TO_SHOPPING_CART_URL = '/index/add-to-shopping-cart/';
	
$(function() {
	var big_image = $('#main-photo'),
		small_images = $('.pd_adding img'),
		add_option_button = $('.add-to-cart-btn'),
		product_id = $('#product_id'),
		sc_item = $('#sc-items span'),
		sc_total = $('#sc-total span'),
		form = $('#product-params'),
		defaultOptions = {
			beforeSubmit:  onBeforeRequest,  // pre-submit callback 
			type:      'post',        // 'get' or 'post', override for form's 'method' attribute 
			dataType:  'json',        // 'xml', 'script', or 'json' (expected server response type) 
			data:{
				format:'json'
			}
		};

	small_images.click(function(){
		var src = $(this).attr('src');
		var point = src.indexOf('_s.');
		var name = src.substr(0,point);
		var ext = src.substr(point+2);
		big_image.attr('src',name + '_b' + ext);
	});
	
	
	add_option_button.click(function(){
		form.ajaxSubmit($.extend(defaultOptions, {
			success: showResponse,
			url:     ADD_TO_SHOPPING_CART_URL,
			data:    defaultOptions.data
		}));
		return false;
	});
	
	// pre-submit callback 
	function onBeforeRequest(formData, jqForm, options) {
		return true; 
	};
	
	function showResponse(data)  {
		if (data.responce['status'] == 'success') {
			sc_item.text(data.responce['count']);
			sc_total.text(data.responce['totalPrice']);
		}
		form.resetForm();
	};
});