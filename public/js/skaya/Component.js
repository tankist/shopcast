Skaya.Component = function() {
	if (!Skaya.Component._components) {
		Skaya.Component._components = {};
	}
	Skaya.Component._components[this.getId()] = this;
	
	Skaya.Component.superclass.constructor.apply(this, arguments);
}

Skaya.extend(Skaya.Component, Skaya.Object, {
	xtype:'Skaya.Component'
});

Skaya.Component.getComponent = function(name) {
	if (Skaya.Component._components[name]) return Skaya.Component._components[name]; else return false;
};