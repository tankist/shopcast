//Объявляем пространство имен Skaya
Skaya.namespace('Sellcast');

//Адреса и различные константы
var DASH_INDEX_URL = '/admin/dash/',
	ORDERS_LIST_URL = '/admin/orders/list/',
	ORDER_DETAILS_URL = '/admin/orders/details/',
	ORDER_DELETE_URL = '/admin/orders/delete/',
	ORDERS_GRID_ITEMS_PER_PAGE = 15,
	EXTENDED_ROW_SELECTOR = 'tr.extended',
	SAVE_OPTION_TIMEOUT = 500;

$(function() {
	//Переменные объявляем тут, чтобы они были доступны из локальных функций-обработчиков
	var ordersTaffy, ordersStore;
	
	//Запрос списка заказов с сервера
	function requestOrdersList(callback) {
		$.getJSON(ORDERS_LIST_URL, function(data) {
			__defaultCallback.call(this, data, 'orders', callback);
		});
	};
	
	//Запрос уточненных данных по заданному заказу
	function requestOrderDetails(order_id, callback) {
		$.getJSON(ORDER_DETAILS_URL, {order_id:order_id}, function(data) {
			__defaultCallback.call(this, data, 'order', callback);
		});
	};
	
	//Запрос на отмену заказа
	function requestOrderCancel(order_id, callback) {
		$.post(ORDER_DELETE_URL, {order_id:order_id}, function(data) {
			__defaultCallback.call(this, data, 'order', callback);
		}, 'json');
	};
	
	//Функция обратного вызова при получении списка заказов
	function onRequestOrdersList(orders) {
		//Создаем объект TAFFY из полученных данных. Этот объект будет являться источником данных для Skaya.Store
		ordersTaffy = new TAFFY(orders);
		//Функция для фильтрации пустых данных
		var _taffyFilter = function(f) {return (!!f);},
			//Уникальный набор имен заказчиков, используемый в списке автодополнения
			whoCollection = ordersTaffy.uniqueValues('customer_name').filter(_taffyFilter).sort(),
			//Уникальный набор статусов заказов, используемый в списке автодополнения
			statusCollection = [{label:'All', value:null}].concat(ordersTaffy.uniqueValues('status').filter(_taffyFilter).sort());
		
		//Объект хранилища, с возможностью постраничного вывода
		ordersStore = new Skaya.Store.Paginated({
			reader: new Skaya.Store.Reader.Array({
				//Выставляем соответствие полей данных с сервера и используемых на клиенте
				fields:{
					order_id:'order_id',
					who:'customer_name',
					orderPrice:'orderPrice',
					purchase_date:'date',
					status:'status'
				}
			}),
			proxy: new Skaya.Store.Proxy.Taffy({
				//Источник данных
				data: ordersTaffy
			}),
			itemsPerPage:ORDERS_GRID_ITEMS_PER_PAGE,
			//Не загружать данные автоматически. Это нужно для того, чтобы успели проинициализироваться все компоненты, которые связаны с данным хранилищем. В частности, объект таблицы
			autoload:false
		});
		
		//Создаем объект таблицы, привязанный к заданному блоку на странице
		$("#orders").bigGrid({
			//Хранилище данных
			store:ordersStore,
			//Префикс, который добавляется ко всем классам ячеек таблицы
			classPrefix:'order',
			//Шаблон заголовка таблицы
			headerTpl:'bigGridHeader',
			//Шаблон основной части таблицы
			rowsTpl:'ordersBigGridRows',
			//Указываем селектор строки элемента для того, чтобы определить события щелчка и двойного щелчка только для строк с данными
			itemSelector:'tr.extensible',
			//Поля заголовка. sortField указывает на возможность сортировки по данному полю
			header:[{
				label:'Order ID',
				sortField:'order_id',
				'class':'order-id'
			}, {
				label:'Customer Name',
				sortField:'who',
				'class':'order-customer-name'
			}, {
				label:'Purchase Date',
				sortField:'purchase_date',
				'class':'order-purchase-date'
			}, {
				label:'Order Total',
				sortField:'order_price',
				'class':'order-price'
			}, {
				label:'Status',
				sortField:'status',
				'class':'order-status'
			}],
			//Компоненты заголовка и подвала таблицы
			components:{
				header:{
					'customerNameAutocomplete':{
						helper:'autocomplete',
						source:whoCollection,
						store:ordersStore,
						field:'who',
						label:'<h2>Filter By</h2>',
						attributes:{
							'class':'sc-autocomplete fl'
						}
					},
					'statusCombo':{
						helper:'combobox',
						source:statusCollection,
						store:ordersStore,
						field:'status',
						label:'<h2>Status</h2>',
						attributes:{
							'class':'sc-autocomplete sc-combobox fr'
						}
					}
				},
				footer:{
					'paginator':{
						store:ordersStore,
						attributes:{
							'class':'center'
						}
					}
				}
			}
		})
		//Вешаем событие на отрисовку таблицы
		.bind('biggridrender', function(e, ui) {
			var ordersData = ordersStore.getItems();
			//Ко всем нечетным строкам применяем соответствующий класс (для "зебры")
			$(ui.grid).find('table tr.extensible:odd').addClass('odd').end()
					  .find('table tr.extensible').each(function(index, row) {
						$(row).data('order_id', ordersData[index].order_id);
					  }).end();
			
		})
		//Вешаем событие на щелчок по кнопке разворачивания строки
		.delegate('table button.button-plus', 'click', function(e) {
			//Определяем строку, в которой произошел щелчок и идентификатор заказа
			var _this = $(this), tr = _this.parents('tr:first'), order_id = tr.data('order_id');
			if (order_id >= 0) {
				//Делаем запрос на получение детальных данных заказа
				requestOrderDetails(order_id, function(data) {
					onOrderDetailsRequestSuccess(data, tr);
					//Заносим в строку идентификатор, связывающий данный заказ с источником данных (order_id)
					tr.next(EXTENDED_ROW_SELECTOR).data('order_id', order_id).end();
					//Меняем кнопку "плюс" на кнопку "минус"
					_this.removeClass('button-plus').addClass('button-minus').end();
				});
			}
			return false;
		})
		//Вешаем событие на щелчок по кнопке сворачивания строки
		.delegate('table button.button-minus', 'click', function(e) {
			//Находим строку и сворачиваем ее
			$(this).parents('tr.extensible:first').collapseProductRow();
			return false;
		})
		//Вешаем событие на щелчок по кнопке отмены (удаления) заказа
		.delegate('table button.delete', 'click', function(e) {
			debugger;
			//Определяем строку, в которой произошел щелчок и идентификатор заказа
			var tr = $(this).parents('tr.extensible:first'), order_id = tr.data('order_id');
			if (order_id >= 0) {
				//Делаем запрос на отмену заказа
				requestOrderCancel(order_id, onOrderCancelSuccess.scope(this, [tr], true));
			}
			return false;
		})
		//Устанавливаем событие на выбор элемента из списка компаний в форме доставки. При смене компании устанавливаем соответствующий класс для элемента-контейнера формы, что приводит к скрытию/показу дополнительных полей в зависимости от выбраного типа доставки
		.delegate('#shipping_company', 'change', function(e) {
			$(this).parents('dl:first').removeClass('none').addClass(this.value)
		})
		//Вешаем событие на щелчок по ссылке отмены (удаления) заказа
		.delegate('.order-shipping-control a.cancel', 'click', function() {
			//Определяем идентификатор заказа
			var rowContainer = $(this).parents(EXTENDED_ROW_SELECTOR), order_id = rowContainer.data('order_id');
			if (order_id) {
				//Делаем запрос на отмену заказа
				requestOrderCancel(order_id, function(data) {
					onOrderCancelSuccess(data, rowContainer.prev('tr.extensible'));
				});
			}
			return false;
		});
		
		//Так как все компоненты проинициализированы, то снова разрешаем автозагрузку хранилища и грузим данные из источника
		ordersStore.setAutoload(true).load();
				
		//Fix for #85
		$('#statusCombo-component').find('input.ui-autocomplete-input').val('All');
	};
	
	//Обработчик запроса деталей заказа
	function onOrderDetailsRequestSuccess(orderData, row) {
		//Обновляем данные в источнике данных
		updateTaffyStore(orderData.id, orderData);
		//Выделяем текущую строку, раскрываем ее и заполняем внутренний шаблон данными, полученными с сервера
		row.activateRow().expandProductRow('ordersExtended', orderData)
			//Меняем кнопку "плюс" на кнопку "минус"
		   .find('button.button-plus').removeClass('button-plus').addClass('button-minus').end();
		//В зависимости от статуса заказа...
		switch (orderData.status) {
			//...если "ожидание"...
			case 'pending':
				//...показываем форму доставки,
				row.next(EXTENDED_ROW_SELECTOR).find('.order-shipping-control')
				   .html($.trim(tmpl('orderShippingEdit', orderData)))
				   //эмулируем смену текущего типа доставки для того, чтобы сработало событие и правильно отобразились элементы формы доставки,
				   .find('select').change().end()
				   //устанавливаем идентификатор заказа в форму,
				   .find('#order_id:hidden').val(orderData.id).end()
				   //навешиваем на форму AJAX-загрузку
				   .find('form').ajaxForm(function(data) {
						__defaultCallback.call(this, data, 'order', onOrderShippingSuccess);
				   }).end()
				.end();
				break;
			//...если "доставлено"...
			case 'delivered':
				//..., то устанавливаем соответствующий поясняющий текст
				orderData.statusText = 'PRODUCT HAS BEEN SHIPPED';
			//... если "отменено"...
			case 'canceled':
			default:
				//..., то устанавливаем соответствующий поясняющий текст,
				orderData.statusText = orderData.statusText || 'ORDER HAS BEEN CANCELED';
				//вместо формы доставки показываем краткие сведения о доставке
				row.next(EXTENDED_ROW_SELECTOR).find('.order-shipping-control')
				   .html($.trim(tmpl('orderShippingSummary', orderData)))
				   .addClass(orderData.status)
				.end();
				break;
		}
	};
	
	//Функция обратного вызова для запроса подтверждения заказа
	function onOrderShippingSuccess(data) {
		if (data.id) {
			//Находим соответствующую строку в таблице
			var tr = $('tr[order_id=' + data.id + ']:first');
			//Сворачиваем строку информации
			tr.collapseProductRow();
			//Обновляем строку информации
			onOrderDetailsRequestSuccess(data, tr);
			//Обновляем статус в строке данных
			tr.find('td.order-status').html(data.status.ucwords()).attr('class', 'order-status ' + data.status).end()
		}
	};
	
	//Функция обратного вызова для запроса отмены заказа
	function onOrderCancelSuccess(data, row) {
		//Обновляем данные в источнике данных
		updateTaffyStore(data.id, data);
		//Обновляем статус в строке данных
		row.find('td.order-status').html(data.status.ucwords()).attr('class', 'order-status ' + data.status).end()
		   .collapseProductRow();
	};
	
	function updateTaffyStore(order_id, data) {
		var mappedData = {};
		if (data.shippingInfo) {
			var firstName = data.shippingInfo.firstName || '',
				lastName = data.shippingInfo.lastName || '';
			data.customer_name = firstName + ' ' + lastName;
		}
		var fields = {
			order_id:'id',
			customer_name:'customer_name',
			orderPrice:'orderPrice',
			date:'date_purchased',
			status:'status'
		};
		for(var i in fields) {
			if (fields.hasOwnProperty(i) && data.hasOwnProperty(fields[i])) {
				mappedData[i] = data[fields[i]];
			}
		}
		ordersTaffy.update(mappedData, {order_id:order_id});
	};
	
	//Запрашиваем данные о заказах
	requestOrdersList(onRequestOrdersList);
});