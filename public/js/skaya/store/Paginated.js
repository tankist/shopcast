Skaya.namespace('Skaya.Store');

Skaya.Store.Paginated = function(config) {
	Skaya.Store.Paginated.superclass.constructor.apply(this, arguments);
}

Skaya.extend(Skaya.Store.Paginated, Skaya.Store.Abstract, {
	xtype:'Skaya.Store.Paginated',
	_page: 1,
	_itemsPerPage: 10,
	applyConfig:function(config) {
		this.addEvents('beforepagechange', 'afterpagechange');
		Skaya.Store.Paginated.superclass.applyConfig.apply(this, arguments);
	},
	getItemsPerPage:function() {
		return this._itemsPerPage;
	},
	setItemsPerPage:function(ipp) {
		var isUpdate = (this._itemsPerPage != ipp);
		this._itemsPerPage = ipp;
		if (isUpdate && this.getAutoload()) this.load();
		return this;
	},
	getPage:function() {
		return this._page;
	},
	setPage:function(page) {
		if (page < 1) page = 1;
		if (page > this.getPagesCount() && this.getPagesCount() > 0) page = this.getPagesCount();
		var isUpdate = (this._page != page);
		this._page = page;
		if (isUpdate && this.getAutoload()) this.load();
		return this;
	},
	getPagesCount:function() {
		var itemsCount = this._getTotalRecordsCount(), ipp = this.getItemsPerPage();
		if (itemsCount == 0 || ipp == 0) return 0;
		var pagesCount = Math.ceil(itemsCount / ipp);
		return pagesCount;
	},
	nextPage:function() {
		return this.setPage(this.getPage() + 1);
	},
	prevPage:function() {
		return this.setPage(this.getPage() - 1);
	},
	firstPage:function() {
		return this.setPage(1);
	},
	lastPage:function() {
		return this.setPage(this.getPagesCount());
	},
	load:function(params) {
		params = $.extend(this.getParams() || {}, params || {});
		var ipp = this.getItemsPerPage(), 
			page = this.getPage(),
			start = (page - 1) * ipp, 
			count = this._getTotalRecordsCount();
		if (start < 0) start = 0;
		if (start >= count && count > 0) start = count - 1;
		params = $.extend(params, {
			start:start,
			limit:ipp
		});
		return Skaya.Store.Paginated.superclass.load.call(this, params);
	}
});