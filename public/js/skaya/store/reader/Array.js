Skaya.namespace('Skaya.Store.Reader');

Skaya.Store.Reader.Array = function(config) {
	Skaya.Store.Reader.Array.superclass.constructor.apply(this, arguments);
}

Skaya.extend(Skaya.Store.Reader.Array, Skaya.Store.Reader.Json, {
	xtype:'Skaya.Store.Reader.Array',
	_root:null,
	read:function(data) {
		return Skaya.Store.Reader.Abstract.prototype.read.call(this, data);
	}
});