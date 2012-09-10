$.widget('sellcast.paginator', {
	widgetEventPrefix:'sellcast_',
	_buttons:{},
	options:{
		page:1,
		store:null,
		buttons:null,
		icons:{
			first:'ui-icon-seek-prev',
			prev:'ui-icon-triangle-1-w',
			next:'ui-icon-triangle-1-e',
			last:'ui-icon-seek-next'
		},
		pageInput:true,
		pageLabel:true,
		loaderPosition:'prepend'
	},
	_create:function() {
		var self = this,
			options = self.options,
			store = options.store,
			icons = options.icons,
			uiPaginatorContainer = $('<div></div>')
				.addClass('sc-paginator-container')
				.appendTo(this.element),
				
			uiLoader = $('<span>')
				.html('&nbsp;')
				.addClass('sc-loader ui-helper-hidden');
				
			self.element.addClass('sc-paginator');
				
		$(self).data('input_id', 'sc-paginator-' + Math.ceil(Math.random()*1000) + new Date().getMilliseconds().toString());
		
		if (options.loaderPosition == 'prepend') {
			uiLoader.appendTo(uiPaginatorContainer)
		}
		
		if (!(store instanceof Skaya.Store.Paginated)) {
			this._setOption('store', null);
		}
		
		$.each(options.buttons || ['first', 'prev', 'next', 'last'], function(index, cls) {
			self._buttons[cls] = $('<button></button>')
				.addClass(cls)
				.appendTo(uiPaginatorContainer)
				.data('type', cls)
				.bind('click', function(e) {
					var page = this._getPage(), type = $(e.currentTarget).data('type'), targetPage = 1;
					if (type && type.length > 0) {
						var action = '_' + type + 'Page';
						if (typeof this[action] == 'function') {
							targetPage = this[action].call(this);
							if (page !== targetPage) {
								this._trigger('page', e, {page:targetPage, type:type});
								this._setPage(targetPage);
							}
						}
					}
				}.scope(this))
				.button({
					text:false,
					icons:{primary:icons[cls]}
				});
		}.scope(this));
		
		if (options.loaderPosition == 'append') {
			uiLoader.appendTo(uiPaginatorContainer)
		}
		
		if (options.pageInput) {
			var uiPaginatorPageInput = $('<input>')
				.attr({
					type:'text',
					id:$(self).data('input_id')
				})
				.val(this._getPage())
				.addClass('sc-paginator-page')
				.insertAfter($('.ui-button.prev', uiPaginatorContainer));
		}
		
		if (options.pageLabel) {
			var uiPaginatorPageInputLabel = $('<label>')
				.attr('for', $(self).data('input_id'))
				.html(this._getPage().toString() + ' of ' + this._getPagesCount().toString())
				.addClass('sc-paginator-page-label')
				.appendTo(uiPaginatorContainer);
		}
		
		this._getStore().bind('beforeload', function() {
			uiLoader.removeClass('ui-helper-hidden');
		});
		
		this._getStore().bind('afterload', function(e, data) {
			uiLoader.addClass('ui-helper-hidden');
			var page = this._getPage();
			if (uiPaginatorPageInput) uiPaginatorPageInput.val(page);
			if (uiPaginatorPageInputLabel) uiPaginatorPageInputLabel.html(this._getPage().toString() + ' of ' + this._getPagesCount().toString());
			if (page <= 1) {
				if (this._buttons.first) this._buttons.first.addClass('disabled');
				if (this._buttons.prev) this._buttons.prev.addClass('disabled');
			}
			else {
				if (this._buttons.first) this._buttons.first.removeClass('disabled');
				if (this._buttons.prev) this._buttons.prev.removeClass('disabled');
			}
			if (page >= this._getPagesCount()) {
				if (this._buttons.next) this._buttons.next.addClass('disabled');
				if (this._buttons.last) this._buttons.last.addClass('disabled');
			}
			else {
				if (this._buttons.next) this._buttons.next.removeClass('disabled');
				if (this._buttons.last) this._buttons.last.removeClass('disabled');
			}
			return true;
		}.scope(this));
		
		if (options.page) {
			this._setPage(options.page);
		}
		else {
			if (this._buttons.first) this._buttons.first.addClass('disabled');
			if (this._buttons.prev) this._buttons.prev.addClass('disabled');
		}
	},
	_getStore:function() {
		return this.options.store;
	},
	_checkStore:function() {
		return (this.options.store instanceof Skaya.Store.Paginated)
	},
	_getPage:function() {
		return (this._checkStore())?this._getStore().getPage():-1;
	},
	_setPage:function(page) {
		if (this._checkStore()) {
			this._getStore().setPage(page);
			if (!this._getStore().getAutoload()) {
				this._getStore().load();
			}
		}
		return this;
	},
	_getPagesCount:function() {
		return (this._checkStore())?this._getStore().getPagesCount():-1;
	},
	_firstPage:function() {
		return 1;
	},
	_nextPage:function() {
		return this._getPage() + 1;
	},
	_prevPage:function() {
		return this._getPage() - 1;
	},
	_lastPage:function() {
		return this._getPagesCount();
	}
});