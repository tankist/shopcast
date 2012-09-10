Skaya.namespace('Skaya.Store');

Skaya.Store.Taffy = function(config) {
	Skaya.Store.Taffy.superclass.constructor.apply(this, arguments);
}

Skaya.extend(Skaya.Store.Taffy, Skaya.Store.Abstract, {
	xtype:'Skaya.Store.Taffy',
	applyConfig:function(config) {
		Skaya.Store.Taffy.superclass.applyConfig.call(this, config);
		this.setProxy(new Skaya.Store.Proxy.Taffy({
			data:config.data || {}
		}))
	}
});