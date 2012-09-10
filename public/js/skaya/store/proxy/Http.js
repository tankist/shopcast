Skaya.namespace('Skaya.Store.Proxy');

Skaya.Store.Proxy.Http = function(config) {
	Skaya.Store.Proxy.Http.superclass.constructor.apply(this, arguments);
}

Skaya.extend(Skaya.Store.Proxy.Http, Skaya.Store.Proxy.Abstract, {
	xtype:'Skaya.Store.Proxy.Http',
	_connection:{},
	load:function(params) {
		params = $.extend({
			data:params
		}, {
			success : function(data) {
				if (data.totalRecords) {
					this._totalRecords = parseInt(data.totalRecords);
				}
				this._onLoad.call(this, data, params);
			}.scope(this),
			dataType:this.getDataType()
		}, this._connection);
		if (this.triggerHandler('beforeload', [params])) {
			$.ajax(params);
			return true;
		}
	},
	setConnection:function(connection) {
		this._connection = connection;
		return this;
	},
	getConnection:function() {
		return this._connection;
	},
	setUrl:function(url) {
		this._connection.url = url;
		return this;
	},
	getUrl:function() {
		return this._connection.url;
	},
	setDataType:function(dataType) {
		this._connection.dataType = dataType;
		return this;
	},
	getDataType:function() {
		if (!this._connection.dataType) {
			this.setDataType(this.getReader().getDataType());
		}
		return this._connection.dataType;
	}
});