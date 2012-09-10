Skaya.ApplicationComponent = function () {
	Skaya.ApplicationComponent.superclass.constructor.apply(this, arguments);
};

Skaya.extend(Skaya.ApplicationComponent, Skaya.Component, {
	xtype:'Skaya.ApplicationComponent',
	_application:null,
	setApplication:function(applicationInstance) {
		if (!applicationInstance instanceof Skaya.Application) {
			throw new Error('Provided object is not an Skaya.Application instance');
		}
		this._application = applicationInstance;
		return this;
	},
	getApplication:function() {
		return this._application;
	}
});