Skaya.Application = function () {
	Skaya.Application.superclass.constructor.apply(this, arguments);
};

Skaya.extend(Skaya.Application, Skaya.Component, {
	xtype:'Skaya.Application',
	_templates:{},
	applyConfig:function() {
		this.addEvents('shutdown');
		Skaya.Application.superclass.applyConfig.apply(this, arguments);
	},
	setTemplate:function(name, tpl) {
		if (!name) throw new Error('Name of the template cannot be empty');
		if (tpl instanceof Skaya.Template) {
			this._templates[name] = tpl;
			return this;
		}
		if (typeof tpl == 'object') {
			this._templates[name] = new Skaya.Template(tpl);
			return this;
		}
		throw new Error('Incorrect template provided');
	},
	getTemplate:function(name) {
		return this._templates[name];
	},
	publishBroadcastEvent:function(eventName, publisher) {
		publisher.bind(eventName, {eventName:eventName}, this._applicationEventsHandler, this);
	},
	subscribeBroadcastEvent:function(eventName, callback) {
		if (!eventName || !eventName.length) {
			throw new Error('Unknown event name provided');
		}
		eventName = 'app_' + eventName;
		this.bind(eventName, callback);
	},
	_applicationEventsHandler: function(e) {
		if (this.xtype != 'Skaya.Application') {
			throw new Error('This handler is internal and cannot be called from the outside of the Skaya.Application class');
		}
		var eventName = e.data.eventName, args = Array.prototype.slice.call(arguments, 1);
		if (!eventName || !eventName.length) {
			throw new Error('Unknown event name provided');
		}
		eventName = 'app_' + eventName;
		return this.triggerHandler(eventName, args);
	}
});