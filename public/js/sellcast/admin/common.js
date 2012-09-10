var showMessage = function(msg, cls) {
	$('#message').html(msg).show().parent().attr('class', 'message-wrapper').addClass(cls);
	var logger = (console && typeof console[cls] == 'function')?console[cls]:console.log;
	logger(msg);
	$(document.body).one('click', function() {
		hideMessage.defer(5000);
	});
};

var hideMessage = function() {
	$('#message').parent().fadeOut('slow');
};

//Функция обратного вызова по-умолчанию
var __defaultCallback = function(data, key, callback) {
	try {
		//Есть код ошибки??
		if (!!data.error) {
			throw new Error(data.error);
		}
		//Если передан ключ, то из данных, полученных с сервера, вернуть только соответствующую часть
		if (key !== null) {
			data = data[key];
		}
		//Вызываем непосредственную функцию обратного вызова
		if (typeof callback == 'function') callback(data || {});
	}
	catch (e) {
		//Была ошибка? Показываем сообщение об этом
		showMessage(e.message, 'error');
	}
};

$.fn.activateRow = function() {
	return this.each(function() {
		if (!$(this).is('tr')) return;
		$(this).siblings().removeClass('active').end().addClass('active');
	});
};

$.fn.expandProductRow = function(tpl, data) {
	var template = tpl, items = data;
	return this.each(function(index, row) {
		var __data = (Skaya.isArray(items))?items[index]:items;
		var content = $($.trim(tmpl(template, __data)));
		$(this).siblings().remove(EXTENDED_ROW_SELECTOR)
			.find('.button-minus').removeClass('button-minus').addClass('button-plus').end()
		.end().after(content);
	});
};

$.fn.collapseProductRow = function() {
	return this.each(function(index, row) {
		$(this).next(EXTENDED_ROW_SELECTOR).remove();
		$(this).find('.button-minus').removeClass('button-minus').addClass('button-plus').end();
	});
};