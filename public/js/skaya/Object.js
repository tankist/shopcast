Skaya.namespace('Skaya');

Skaya.Object = function(config) {
	var _xtype = (config && config.xtype)?config.xtype:this.xtype;
	Skaya.Object.superclass.init.call(this, document.createElement(_xtype));
	if (Skaya.isFunction(this.applyConfig)) this.applyConfig(config || {});
	this.selector = _xtype;
	this.triggerHandler('init');
}

Skaya.extend(Skaya.Object, jQuery, {
	xtype:'Skaya.Object',
	_events:{},
	_id:'',
	addEvents:function() {
		var a = arguments, eventName = '';
		for (var i=0;i<a.length;i++) {
			if (typeof a[i] =='string') {
				eventName = a[i].toLowerCase();
				if (!this._events[eventName]) {
					this._events[eventName] = true;
				}
			}
		}
	},
	applyConfig:function(config) {
		this.addEvents('init');
		var setterName = '';
		$.each(config, function(name, configItem) {
			setterName = 'set' + name.capitalize();
			if (this[setterName] && typeof this[setterName] == 'function') {
				this[setterName].call(this, configItem);
			}
		}.scope(this));
		return this;
	},
	setEvents:function(events) {
		for (var i in events) {
			if (this._events[i] && typeof events[i] == 'function') this.bind(i, events[i]);
		}
		return this;
	},
	setId:function(id) {
		this._id = id;
		return this;
	},
	getId:function() {
		if (!this._id) {
			if (!Skaya.Object.__statId) Skaya.Object.__statId = 1;
			this.setId('sk-' + String(++Skaya.Object.__statId));
		}
		return this._id;
	},
	bind: function(type, data, fn, thisObject) {
		if (jQuery.isFunction(data) && !fn) {
			fn = this;
		}
		else {
			if (!thisObject) thisObject = this;
		}
		return Skaya.Object.superclass.bind.call(this, type, data, fn, thisObject);
	},
	triggerHandler: function(type, data) {
		var e = Skaya.Object.superclass.triggerHandler.call(this, type, data);
		return (e !== false);
	}
});