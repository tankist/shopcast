Skaya.namespace('Skaya');

Skaya.VisualComponent = function() {
	Skaya.VisualComponent.superclass.constructor.apply(this, arguments);
}

Skaya.extend(Skaya.VisualComponent, Skaya.Component, {
	xtype:'Skaya.VisualComponent',
	_container:null,
	_rendered:false,
	applyConfig:function(config) {
		this.addEvents('beforerender', 'render');
		Skaya.VisualComponent.superclass.applyConfig.apply(this, arguments);
	},
	render:function() {
		throw new Error('This method must be overriden in descendant class');
	},
	setContainer:function(container) {
		this._container = $(container);
		return this;
	},
	getContainer:function() {
		return this._container;
	}
});