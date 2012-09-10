Skaya.namespace('Sellcast');

var DASH_INDEX_URL = '/admin/dash/',
	PRODUCTS_INDEX_URL = '/admin/products/',
	ORDERS_LIST_URL = '/admin/orders/list/',
	PRODUCTS_LIST_URL = '/admin/products/list/',
	PRODUCTS_OPTIONS_LIST_URL = '/admin/products/options/',
	PRODUCT_OPTION_QUANTITY_SET_URL = '/admin/products/set-option-quantity/',
	PRODUCT_DELETE_URL = '/admin/products/delete/',
	PRODUCTS_GRID_ITEMS_PER_PAGE = 15,
	EXTENDED_ROW_SELECTOR = 'tr.extended',
	SAVE_OPTION_TIMEOUT = 500;

$(function() {
	var optionsStorage;

	function requestProductOptions(productData, callback) {
		if (productData.product_id) {
			$.getJSON(PRODUCTS_OPTIONS_LIST_URL, {product_id:productData.product_id}, function(data) {
				if (data.options && data.options.slice) {
					var o = data.options.slice(0);
					if (TAFFY.isTAFFY(optionsStorage)) {
						var tmpTaffyStore = new TAFFY(o);
						tmpTaffyStore.remove({id:optionsStorage.uniqueValues('id')});
						o = tmpTaffyStore.get();
						optionsStorage.insert(o);
					}
					else {
						optionsStorage = new TAFFY(o);
					}
				}
				__defaultCallback.call(this, data, 'options', callback);
			});
		}
	};
	
	function requestProductOptionQuantityChange(product_id, option_id, quantity, callback) {
		$.post(PRODUCT_OPTION_QUANTITY_SET_URL, {product_id:product_id, option_id:option_id, quantity:quantity}, function(data) {
			if (data.option) {
				var o = data.option;
				optionsStorage.update({quantity:o.quantity}, {id:o.id});
			}
			__defaultCallback.call(this, data, 'option', callback);
		}, 'json');
	};
	
	function requestProductDelete(product_id, callback) {
		$.post(PRODUCT_DELETE_URL, {product_id:product_id}, function(data) {
			__defaultCallback.call(this, data, null, callback);
		}, 'json');
	};
	
	$.getJSON(PRODUCTS_LIST_URL, function(data) {
		try {
			if (!!data.error) {
				throw new Error(data.error);
			}
			if (!data.products) {
				throw new Error("Data provided empty or in invalid format");
			}
			var productsTaffy = new TAFFY(data.products), 
				minPrice = productsTaffy.min('price'), 
				maxPrice = productsTaffy.max('price'),
				labelFormatter = function(value) {return '$' + value.toFixed(2);},
				_taffyFilter = function(f) {return (!!f);},
				whoCollection = productsTaffy.uniqueValues('product_name').filter(_taffyFilter).sort(),
				statusCollection = [{label:'All', value:null}].concat(productsTaffy.uniqueValues('status').filter(_taffyFilter).sort());
				
			var productsStore = new Skaya.Store.Paginated({
				reader: new Skaya.Store.Reader.Array({
					fields:{
						product_id:'product_id',
						product_name:'product_name',
						price:'price',
						inventory:'inventory',
						status:'status'
					}
				}),
				proxy: new Skaya.Store.Proxy.Taffy({
					data: productsTaffy
				}),
				itemsPerPage:PRODUCTS_GRID_ITEMS_PER_PAGE,
				autoload:false
			});
			
			var clickTimer = null;
			
			var $productGrid = $('#product-grid')
				.bigGrid({
					store:productsStore,
					classPrefix:'product',
					headerTpl:'bigGridHeader',
					rowsTpl:'productsBigGridRows',
					itemSelector:'tr.extensible',
					header:[{
						label:'Product Name',
						sortField:'product_name'
					}, {
						label:'Price',
						sortField:'price'
					}, {
						label:'Inventory',
						sortField:'inventory'
					}, {
						label:'Status',
						sortField:'status'
					}],
					components:{
						header:{
							'productNameAutocomplete':{
								helper:'autocomplete',
								source:whoCollection,
								store:productsStore,
								field:'product_name',
								label:'<h2>Name</h2>',
								attributes:{
									'class':'sc-autocomplete fl'
								}
							},
							'priceSlider':{
								helper:'slider',
								min:minPrice,
								max:maxPrice,
								range:true,
								values:[minPrice,maxPrice],
								animate:true,
								store:productsStore,
								field:'price',
								labelMin:labelFormatter,
								labelMax:labelFormatter,
								labelLimitMin:labelFormatter,
								labelLimitMax:labelFormatter,
								label:'<h2>Price</h2>'
							},
							'statusCombo':{
								helper:'combobox',
								source:statusCollection,
								store:productsStore,
								field:'status',
								label:'<h2>Status</h2>',
								attributes:{
									'class':'sc-autocomplete sc-combobox fr'
								}
							}
						},
						footer:{
							'paginator':{
								store:productsStore,
								attributes:{
									'class':'center'
								}
							}
						}
					}
				})
				.bind('biggridrender', function(e, ui) {
					$(ui.grid).find('table tr.extensible:odd').addClass('odd').end();
				})
				.bind('biggridrowdblclick', function(e, ui) {
					var tr = $(ui.row), product_id = ui.data.product_id;
					requestProductOptions(ui.data, function(data) {
						onOptionRequestSuccess(tr, data);
						tr.next(EXTENDED_ROW_SELECTOR).data('product_id', product_id).end();
					});
					return false;
				})
				.delegate('table button.button-plus', 'click', function(e) {
					var tr = $(this).parents('tr:first'), index = tr.index('tr.extensible');
					if (index >= 0) {
						var productData = productsStore.getItems()[index];
						requestProductOptions(productData, function(data) {
							onOptionRequestSuccess(tr, data);
							tr.next(EXTENDED_ROW_SELECTOR).data('product_id', productData.product_id).end();
						});
					}
					return false;
				})
				.delegate('table button.button-minus', 'click', function(e) {
					var tr = $(this).parents('tr:first');
					tr.next(EXTENDED_ROW_SELECTOR).remove();
					$(this).removeClass('button-minus').addClass('button-plus');
					return false;
				})
				.delegate('table button.delete', 'click', function(e) {
					var tr = $(this).parents('tr:first'), index = tr.index('tr.extensible');
					if (index >= 0) {
						var productData = productsStore.getItems()[index];
						requestProductDelete(productData.product_id, function(data) {
							productsTaffy.remove({product_id:productData.product_id});
							productsStore.load();
						});
					}
				})
				.delegate(EXTENDED_ROW_SELECTOR + ' a.edit', 'click', function(e) {
					$(this).parents('.quantity-edit-container').removeClass('view')
						.find('input.quantity').each(function(index, element) {
							element.select();
						}).end();
					return false;
				})
				.delegate(EXTENDED_ROW_SELECTOR + ' a.save', 'click', function(e) {
					var product_id = $(this).parents(EXTENDED_ROW_SELECTOR).data('product_id'),
						optionStorage = $(this).parents('.quantity-edit-container'),
						option = optionStorage.data('option_data'),
						quantity = optionStorage.find('input.quantity').val();
					if (quantity < 0) quantity = 0;
					if (quantity != option.quantity) {
						option.quantity = quantity;
						optionSaveQuantity.call(this, product_id, option, optionStorage);
					}
					else {
						optionStorage.addClass('view');
					}
					return false;
				})
				.delegate(EXTENDED_ROW_SELECTOR + ' button.plus', 'click', function(e) {
					clearTimeout(clickTimer);
					var product_id = $(this).parents(EXTENDED_ROW_SELECTOR).data('product_id'),
						optionStorage = $(this).parents('.quantity-edit-container'),
						option = optionStorage.data('option_data');
					clickTimer = optionSaveQuantity.defer(SAVE_OPTION_TIMEOUT, this, [product_id, option, optionStorage]);
					option.quantity++;
					optionStorage.find('span.quantity').text(option.quantity);
					return false;
				})
				.delegate(EXTENDED_ROW_SELECTOR + ' button.minus', 'click', function(e) {
					clearTimeout(clickTimer);
					var product_id = $(this).parents(EXTENDED_ROW_SELECTOR).data('product_id'), 
						optionStorage = $(this).parents('.quantity-edit-container'),
						option = optionStorage.data('option_data');
					clickTimer = optionSaveQuantity.defer(SAVE_OPTION_TIMEOUT, this, [product_id, option, optionStorage]);
					option.quantity--;
					if (option.quantity < 0) option.quantity = 0;
					optionStorage.find('span.quantity').text(option.quantity);
					return false;
				});
				
				var onOptionRequestSuccess = function(tr, data) {
					var options_data = data;
					tr.activateRow().expandProductRow('productsExtended', {options:data})
						.next(EXTENDED_ROW_SELECTOR).find('div.quantity-edit-container').each(function(index, row) {
							$(row).data('option_data', options_data[index]);
						}).end();
					tr.find('button.button-plus').removeClass('button-plus').addClass('button-minus');
				};
				
				var optionSaveQuantity = function(product_id, option, optionStorage) {
					optionStorage.find('.sc-loader').removeClass('hidden');
					requestProductOptionQuantityChange(product_id, option.id, option.quantity, function(option) {
						var inventoryQuantity = optionsStorage.sum('quantity', {product_id:product_id});
						productsTaffy.update({inventory:inventoryQuantity}, {product_id:product_id});
						$productGrid.find('tr[product_id=' + product_id + '] td.product-inventory').text(inventoryQuantity);
						
						optionStorage.data('option_data', option)
							.find('span.quantity').text(option.quantity).end()
							.find('input.quantity').val(option.quantity).end()
							.find('.sc-loader').addClass('hidden').end()
							.addClass('view');
					});
				};
				
				productsStore.setAutoload(true).load();
				
				//Fix for #85
				$('#statusCombo-component').find('input.ui-autocomplete-input').val('All');
		}
		catch (e) {
			showMessage(e.message);
		}
	});
});