Skaya.namespace('Sellcast.Widget');

Sellcast.Widget.Abstract = function () {
	Sellcast.Widget.Abstract.superclass.constructor.apply(this, arguments);
};

Skaya.extend(Sellcast.Widget.Abstract, Skaya.VisualComponent, {
	xtype:'Sellcast.Widget.Abstract',
	_rendered:false, 
	_title:'', 
	applyConfig:function(config) {
		this.addEvents('beforechange', 'change');
		Skaya.Widget.Abstract.superclass.applyConfig.apply(this, arguments);
	}, 
	setTitle:function(title) {
		this._title = title;
		return this;
	},
	getTitle:function() {
		return this._title;
	},
	render:function() {
		if (this._onBeforeRender()) {
			if (this._rendered) this.getContainer().empty();
			this._headerElement = $(this._getHeader());
			this._bodyElement = $(this._getBody());
			this._footerElement = $(this._getFooter());
			
			this.getContainer().append(this._headerElement).append(this._bodyElement).append(this._footerElement);
			
			this._onRender();
		}
		return this;
	},
	_onBeforeRender: function() {
		return this.trigger('beforerender');
	},
	_onRender: function() {
		if (this.trigger('render')) {
			this._rendered = true;
			return true;
		}
		return false;
	},
	_getHeader: function() {
		return '';
	},
	_getBody: function() {
		return '';
	},
	_getFooter: function() {
		return '';
	},
	prepare: function() {
		throw new Error('This method must be overriden in descendants classes');
	} 
});