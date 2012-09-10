Skaya.namespace('Skaya.Store.Proxy');

Skaya.Store.Proxy.Local = function(config) {
	Skaya.Store.Proxy.Local.superclass.constructor.apply(this, arguments);
}

Skaya.extend(Skaya.Store.Proxy.Local, Skaya.Store.Proxy.Abstract, {
	xtype:'Skaya.Store.Proxy.Local',
	_data:[],
	load:function(params) {
		if (this.triggerHandler('beforeload', [params])) {
			if (Skaya.isArray(this._data)) this._totalRecords = this._data.length;
			return this._onLoad(this._data, params);
		}
		return false;
	},
	setData:function(data) {
		this._data = data;
		return this;
	},
	getData:function() {
		return this._data;
	},
	_onLoad: function(data, params) {
		if (this.triggerHandler('load', [data])) {
			var records = this.getReader().read(data),
				start = params.start || 0, 
				limit = params.limit || data.length;
			
			records.splice(start, limit);
			return this._onLoadComplete(records);
		}
		return false;
	}
});