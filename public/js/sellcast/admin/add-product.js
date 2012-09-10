//Адреса и различные константы
var CATEGORY_DELETE_URL = '/admin/store/delete-category/',
	CATEGORY_POSITION_UPDATE_URL = '/admin/store/categories-position-update/',
	CATEGORY_SAVE_URL = '/admin/store/save-category/',
	CATEGORY_POSITION_UPDATE_TIMEOUT = 2000;
	IMAGE_DELETE_URL = '/admin/products/delete-product-image/';
	IMAGE_ADD_URL = '/admin/products/add-product-image';

$(function() {
	var imageForm = $('#productImage'), 
		product_id = getProductId(),
		defaultOptions = {
			beforeSubmit:  onBeforeRequest,  // pre-submit callback 
			type:      'post',        // 'get' or 'post', override for form's 'method' attribute 
			dataType:  'json',        // 'xml', 'script', or 'json' (expected server response type) 
			data:{
				product_id:product_id,
				format:'json'
			}
		},
		deferTimerId;

	$('#product-images-block').delegate('button.delete', 'click', function(){
		imageForm.ajaxSubmit($.extend(defaultOptions, {
			success: showDeleteResult,
			url:     IMAGE_DELETE_URL,
			data:    $.extend(defaultOptions.data, {
						id:$(this).attr('image_id')
					 })
		}));
		return false;
	});
	
	imageForm.find('input[type=file]').change(function(){
		imageForm.ajaxSubmit($.extend(defaultOptions, {
			success: showResponse, 
			url:		IMAGE_ADD_URL,
			iframe:  true
		}));
	});
	
	// pre-submit callback 
	function onBeforeRequest(formData, jqForm, options) {
		$('#add-profile-image-loading').show();
		$('#add-profile-image, #productImage').hide();
		return true; 
	};
	
	function onAfterRequest() {
		$('#add-profile-image-loading').hide();
		$('#add-profile-image, #productImage').show();
		return true;
	};
	 
	// post-submit callback 
	function showResponse(data)  {
		onAfterRequest();
		var length = $('#product-images-block img').length, 
			checked = ( length == 0 )?'checked':'',
			imageFilename = data['image']['name'],
			imageFilenameParts = imageFilename.split('.'), 
			imageData = {
				imageFolder: data['image']['path'],
				name: imageFilenameParts.slice(0, -1).join('.'), 
				ext: imageFilenameParts.slice(-1).shift(),
				image_id: data['image']['id'],
				checked: checked
			};
		$('#product-images-block').append($.trim(tmpl('imageTpl', imageData)));
		imageForm.resetForm();
	};

	function showDeleteResult(data)  {
		if ( data['result']['status'] == 'success' ) {
			$('#'+data['result']['id']).parents('div.product-image-wrapper:first').remove();
		}
		onAfterRequest();
		imageForm.resetForm();
	};
	
	$('.content-narrow').resize(function() {
		var addButton = $('#add-profile-image button'), abPos = addButton.position();
		imageForm.css('top', abPos.top);
	}).resize();
	
	$('.sortable').sortable({
		items:'>dl:not(.non-sortable)',
		handle:'.button-replace'
	});
	
	$('.product-categories.sortable').bind('sortstop', function(e, ui) {
		if (ui.item) {
			var container = ui.item.parent(), 
				categoriesIds = container.find('input:checkbox:visible[rel=saved]').map(function() {
					return parseInt(this.value);
				});
			if (deferTimerId) {
				clearTimeout(deferTimerId);
			}
			deferTimerId = requestSaveCategoriesPositions.defer(CATEGORY_POSITION_UPDATE_TIMEOUT, this, [categoriesIds, function(data) {
				
			}]);
		}
	});
	
	$('.product-options.sortable').bind('sortstop', function(e, ui) {
		if (ui.item) {
			optionsIdsArray = [];
			countOptions();
 		}
	});
	
	$('button.button-add-category').bind('click', function(e) {
		var editBox = $.trim(tmpl('addCategoryBox', {category:{}})), 
			newLine = $('<dl>').addClass('add-category-container').html(editBox);
		$(this).parents('dl:first').before(newLine);
		return false;
	});
	
	$('button.button-add-new-option').bind('click', function(e) {
		var option_id = (new Date()).getMilliseconds(),
			editBox = $.trim(tmpl('addOptionBox', {option:{
				id:option_id
			}})), 
			newLine = $('<dl>').html(editBox);
		$(this).parents('dl:first').before(newLine);
		
		var allOptionsIds = $('#new_options_ids').val();
		allOptionsIds = (allOptionsIds.length > 0)?allOptionsIds.split(','):allOptionsIds = [];
		allOptionsIds.push(option_id);
		$('#new_options_ids').val(allOptionsIds.join(','));
		
		return false;
	});
	
	$('.product-categories')
		.delegate('a.edit', 'click', function(e) {
			var dl = $(this).parents('dl:first'), categoryName = dl.find('label').text();
			dl.addClass('add-category-container')
			  .find('input:text').val(categoryName).end();
			return false;
		})
		.delegate('button.button-add', 'click', function(e) {
			var dl = $(this).parents('dl:first'), 
				categoryName = dl.find('input:text').val();
			if (categoryName != '') {
				dl.find('span.sc-loader').show();
				requestCategorySave({name:categoryName}, onSaveCategory.scope(this));
			}
			return false;
		})
		.delegate('button.button-save', 'click', function(e) {
			var dl = $(this).parents('dl:first'), 
				categoryName = dl.find('input:text').val(),
				category = dl.data('category'),
				oldName = dl.find('label').html();
			if (!category) {
				category = {
					id:dl.find('input:checkbox').val(),
					name: oldName
				}
			}
			if (categoryName != '' && category.name != categoryName) {
				dl.find('span.sc-loader').show();
				requestCategorySave({name:categoryName, id:category.id}, onSaveCategory.scope(this));
			}
			else {
				onSaveCategory.call(this, category);
			}
			return false;
		})
		.delegate('button.delete', 'click', function(e) {
			var dl = $(this).parents('dl:first'), 
				checkbox = dl.find('input:checkbox');
				isSaved = checkbox.attr('rel');
			if (isSaved) {
				var category_id = checkbox.val();
				dl.find('span.sc-loader').show();
				requestCategoryDelete(category_id, function(data) {
					dl.remove();
				});
			}
			else {
				dl.remove();
			}
			return false;
		});
	
	var optionsIdsArray = [];
	$('.product-options')
		.delegate('button.delete', 'click', function() {
			var dl = $(this).parents('dl:first'), label = dl.find('label.name-label'), hiddenId = label.attr('for');
			if (hiddenId && hiddenId.length > 0) {
				hiddenId = hiddenId.match(/option_(\d+)-name/i);
				if (hiddenId && hiddenId.length > 0) {
					hiddenId = hiddenId.pop();
					var allOptionsIds = $('#new_options_ids').val();
					allOptionsIds = (allOptionsIds.length > 0)?allOptionsIds.split(','):allOptionsIds = [];
					var elementIndex = allOptionsIds.indexOf(hiddenId);
					if (elementIndex >= 0) {
						allOptionsIds = allOptionsIds.slice(0, elementIndex).concat(allOptionsIds.slice(elementIndex + 1));
						$('#new_options_ids').val(allOptionsIds.join(','));
					}
				}
			}
			dl.remove();
		});
	
	$('#shipping_type').change(function() {
		if (this.value == 'no') {
			$('#shipping-options-subform').hide();
		}
		else {
			$('#shipping-options-subform').show();
		}
	});
	
	$('#shipping_type').change();

	$('#reset-form-button').click(function() {
		$(this).parents('form').each(function() {
			this.reset();
		});
		return false;
	})
	
	function countOptions() {
		$('.product-options').find('label.name-label').each(function(index, el) {
			var hiddenId = $(this).attr('for');
			if (hiddenId && hiddenId.length > 0) {
				hiddenId = hiddenId.match(/option_(\d+)-name/i);
				if (hiddenId && hiddenId.length > 0) {
					hiddenId = hiddenId.pop();
					optionsIdsArray.push(hiddenId);
				}
			}
			$('#new_options_ids').val(optionsIdsArray.join(','));
		}).end();
	};

	countOptions();
	
	function requestCategoryDelete(category_id, callback) {
		$.post(
			CATEGORY_DELETE_URL, 
			{category_id:category_id}, 
			function(data) {
				__defaultCallback(data, null, callback);
			}, 
			'json'
		);
	};
	
	function requestCategorySave(category, callback) {
		$.post(
			CATEGORY_SAVE_URL,
			{category:category},
			function(data) {
				__defaultCallback(data, 'category', callback);
			},
			'json'
		);
	};
	
	function requestSaveCategoriesPositions(categoriesIds, callback) {
		$.post(
			CATEGORY_POSITION_UPDATE_URL,
			{categories:categoriesIds},
			function(data) {
				__defaultCallback(data, 'categories', callback);
			},
			'json'
		);
	};
	
	function onSaveCategory(category) {
		var dl = $(this).parents('dl:first');
		dl.removeClass('add-category-container')
		  .find('span.sc-loader').hide().end()
		  .find('input:checkbox').attr({
			id:'categories-' + category.id,
			'rel':'saved',
			'value':category.id
		  }).end()
		  .find('label').html(category.name).attr('for', 'categories-' + category.id).end()
		  .find('button.button-add').removeClass('button-add').addClass('button-save').end()
		  .data('category', category);
	};
	
	function getProductId() {
		if (!this.product_id) {
			this.product_id = parseInt($('input:hidden#id').val());
		}
		return this.product_id;
	};
});