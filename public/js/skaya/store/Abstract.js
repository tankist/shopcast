Skaya.namespace('Skaya.Store');

Skaya.Store.Abstract = function(config) {
	Skaya.Store.Abstract.superclass.constructor.apply(this, arguments);
}

Skaya.extend(Skaya.Store.Abstract, Skaya.Object, {
	xtype: 'Skaya.Store.Abstract',
	_items:[],
	_reader:null,
	_proxy:null,
	_autoload:false,
	_params:{},
	_totalRecords:0,
	_order:{},
	applyConfig:function(config) {
		this.addEvents('load', 'beforeload', 'afterload', 'datachanged', 'appendrecord', 'updaterecord', 'removerecord', 'beforecriteriachange', 'aftercriteriachange', 'beforeorder', 'afterorder');
		Skaya.Store.Abstract.superclass.applyConfig.apply(this, arguments);
		
		this._proxy.bind('load', this._onLoad.scope(this));
		this._proxy.bind('afterload', this._onLoadComplete.scope(this));
		
		if (this._autoload) {
			this.bind('init', function(e) {this.load();}.scope(this));
		}
	},
	setReader: function(reader) {
		if (reader instanceof Skaya.Store.Reader.Abstract) {
			this._reader = reader;
			if (this.getProxy() instanceof Skaya.Store.Proxy.Abstract) {
				this.getProxy().setReader(reader);
			}
		}
		return this;
	},
	getReader: function() {
		return this._reader;
	},
	setProxy: function(proxy) {
		if (proxy instanceof Skaya.Store.Proxy.Abstract) {
			this._proxy = proxy;
			if (this.getReader() instanceof Skaya.Store.Reader.Abstract) {
				this._proxy.setReader(this.getReader());
			}
		}
		return this;
	},
	getProxy: function() {
		return this._proxy;
	},
	setAutoload: function(autoload) {
		this._autoload = !!autoload;
		return this;
	},
	getAutoload: function() {
		return this._autoload;
	},
	setParams: function(params) {
		if (!this._params) this._params = {};
		for (var i in params) {
			if (params.hasOwnProperty(i)) {
				this.setParam(i, params[i]);
			}
		}
		return this;
	},
	getParams: function() {
		return this._params;
	},
	setParam:function(name, value) {
		if (value === null) {
			delete this._params[name];
		}
		else {
			this._params[name] = value;
		}
		return this;
	},
	getParam:function(name) {
		return this._params[name];
	},
	hasParam:function(name) {
		return this._params.hasOwnProperty(name);
	},
	getCriteria:function() {
		return this.getParam('criteria');
	},
	setCriteria:function(c, part) {
		var criteria = this.getCriteria();
		if (this.triggerHandler('beforecriteriachange', [c, part])) {
			if (!part) {
				if (c === null || typeof c == 'undefined') {
					criteria = {};
				}
				else criteria = c;
			}
			else {
				//Mapping part name
				var fields = this.getReader().getFields();
				if (fields[part]) {
					part = fields[part];
					
					if (!criteria) criteria = {};
					if (c === null || typeof c == 'undefined') {
						delete criteria[part];
					}
					else criteria[part] = c;
				}
				else {
					throw new Error('Criteria part ' + part + ' was not found in the current store');
				}
			}
			this.setParam('criteria', criteria);
			if (this.triggerHandler('aftercriteriachange', [c, part]) && this.getAutoload()) {
				this.load();
			}
		}
		return this;
	},
	setOrder:function(field, order) {
		if (this.triggerHandler('beforeorder', [field, order])) {
			if (!field) {
				this._order = {};
			}
			else {
				//Mapping part name
				var fields = this.getReader().getFields();
				if (fields[field]) {
					field = fields[field];
					
					if (order === null && this._order[field]) {
						delete this._order[field];
					}
					else {
						this._order[field] = order;
					}
				}
			}
			
			var _o = [], __o;
			for (var i in this._order) {
				if (this._order.hasOwnProperty(i)) {
					__o = {};
					__o[i] = this._order[i];
					_o.push(__o);
				}
			}
			console.log(_o);
			
			this.setParam('order', _o);
			if (this.triggerHandler('afterorder', [field, order]) && this.getAutoload()) {
				this.load();
			}
		}
		return this;
	},
	getOrder:function() {
		return this._order;
	},
	load: function(params) {
		params = $.extend(this.getParams() || {}, params || {});
		if (this._onBeforeLoad(params)) {
			this._proxy.load(params);
		}
	},
	getItems:function() {
		return this._items;
	},
	getItemsCount:function() {
		return this._items.length;
	},
	_onBeforeLoad: function(e, params) {
		return this.triggerHandler('beforeload', [params]);
	},
	_onLoad: function(e, data) {
		return this.triggerHandler('load', [data]);
	},
	_onLoadComplete: function(e, data) {
		this._totalRecords = this.getProxy().getTotalRecordsCount();
		this._items = data;
		return this.triggerHandler('afterload', [data]);
	},
	_onDataChange:function(beforeData, newData) {
		return this.triggerHandler('datachanged', [beforeData, newData]);
	},
	_getTotalRecordsCount:function() {
		return this._totalRecords;
	}
});