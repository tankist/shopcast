Skaya.namespace('Skaya.Store.Proxy');

Skaya.Store.Proxy.Abstract = function(config) {
	Skaya.Store.Proxy.Abstract.superclass.constructor.apply(this, arguments);
}

Skaya.extend(Skaya.Store.Proxy.Abstract, Skaya.Object, {
	xtype:'Skaya.Store.Proxy.Abstract',
	_reader:null,
	_totalRecords:0,
	applyConfig:function(config) {
		this.addEvents('load', 'beforeload', 'afterload');
		Skaya.Store.Proxy.Abstract.superclass.applyConfig.apply(this, arguments);
	},
	load:function(params) {
		throw new Error('This method must be implemented in descendant class');
	},
	getReader: function() {
		return this._reader;
	},
	setReader: function(reader) {
		if (!(reader instanceof Skaya.Store.Reader.Abstract)) {
			throw new Error('Skaya.Store.Reader.Abstract instance must be provided');
		}
		this._reader = reader;
		return this;
	},
	getTotalRecordsCount:function() {
		return this._totalRecords;
	},
	_onLoad: function(data, params) {
		if (this.triggerHandler('load', [data])) {
			var records = this.getReader().read(data);
			return this._onLoadComplete(records);
		}
		return false;
	},
	_onLoadComplete: function(records) {
		return this.triggerHandler('afterload', [records]);
	}
});