Skaya.namespace('Sellcast.Store');

Sellcast.Store.Paginated = function(config) {
	Sellcast.Store.Paginated.superclass.constructor.apply(this, arguments);
}

Skaya.extend(Sellcast.Store.Paginated, Skaya.Store.Paginated, {
	xtype:'Sellcast.Store.Paginated',
	load:function(params) {
		params = $.extend(this.getParams() || {}, params || {});
		if (this.getPage() > 0) {
			params['page'] = this.getPage();
		}
		params['ipp'] = this.getItemsPerPage();
		return Skaya.Store.Paginated.superclass.load.call(this, params);
	}
});