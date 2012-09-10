Skaya.namespace('Sellcast');

var DASH_INDEX_URL = '/admin/dash/',
	ORDERS_LIST_URL = DASH_INDEX_URL + 'orders/',
	INVENTORY_LIST_URL = DASH_INDEX_URL + 'inventory/',
	DASH_WIDGET_ITEMS_PER_PAGE = 10;

$(function() {
	var ordersStore = new Sellcast.Store.Paginated({
		reader: new Skaya.Store.Reader.Json({
			fields:{
				order_id:'order_id',
				who:'who',
				date:'date',
				status:'status'
			},
			root:'orders'
		}),
		proxy: new Skaya.Store.Proxy.Http({
			url:ORDERS_LIST_URL,
			dataType:'json',
            data: {
                format: 'json'
            }
		}),
		itemsPerPage:DASH_WIDGET_ITEMS_PER_PAGE,
		autoload:false
	});
	
	$('#dash-orders').dash({
		title:'Orders',
		classPrefix:'orders',
		headerTpl:'dashHeader',
		rowsTpl:'dashOrdersRow',
		switchers:[{
				label:'ALL',
				value:null
			}, {
				label:'PENDING',
				value:'pending'
			}],
		switcherField:'status',
		store:ordersStore,
		header:[
			{label:'Who'}, 
			{label:'Date'}, 
			{label:'Status'}, 
			{label:'&nbsp;'}
		],
		page:1
	}).parent().show();

	ordersStore.setAutoload(true);
	
	var inventoryStore = new Sellcast.Store.Paginated({
		reader: new Skaya.Store.Reader.Json({
			fields:{
				title:'name',
				date:'addDate',
				productivity:'sell_conversion'
			},
			root:'products'
		}),
		proxy: new Skaya.Store.Proxy.Http({
			url:INVENTORY_LIST_URL,
			dataType:'json',
            data: {
                format: 'json'
            }
		}),
		itemsPerPage:DASH_WIDGET_ITEMS_PER_PAGE,
		autoload:false
	});
	
	$('#dash-inventory').dash({
		title:'Inventory',
		classPrefix:'products',
		headerTpl:'dashHeader',
		rowsTpl:'dashInventoryRow',
		switchers:[{
				label:'SOLD OUT',
				value:null
			}, {
				label:'RUNNING LOW',
				value:'low'
			}],
		switcherField:'productivity',
		store:inventoryStore,
		header:[
			{label:'Product'},
			{label:'Date'}
		],
		page:1
	}).parent().show();
	
	inventoryStore.setAutoload(true);
});