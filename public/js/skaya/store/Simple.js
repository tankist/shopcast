Skaya.namespace('Skaya.Store');

Skaya.Store.Simple = function(config) {
	Skaya.Store.Simple.superclass.constructor.apply(this, arguments);
}

Skaya.extend(Skaya.Store.Simple, Skaya.Store.Abstract, {
	xtype:'Skaya.Store.Simple',
	_url:'',
	setUrl:function(url) {
		this._url = url;
		this.setProxy(new Skaya.Store.Proxy.Http({
			connection: $.extend({}, {url: this.getUrl()}, this.getParams() || {})
		}));
		return this;
	},
	getUrl:function() {
		return this._url;
	}
});