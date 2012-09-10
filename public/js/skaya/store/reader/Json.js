Skaya.namespace('Skaya.Store.Reader');

Skaya.Store.Reader.Json = function(config) {
	Skaya.Store.Reader.Json.superclass.constructor.apply(this, arguments);
}

Skaya.extend(Skaya.Store.Reader.Json, Skaya.Store.Reader.Abstract, {
	xtype:'Skaya.Store.Reader.Json',
	_root:null,
	_dataType:'json',
	read:function(data) {
		var _root = this.getRoot();
		if (!_root) {
			throw new Error('Root property cannot be null or empty');
		}
		return (Skaya.isArray(data[_root]))?Skaya.Store.Reader.Json.superclass.read.call(this, data[_root]):[];
	},
	getRoot:function() {
		return this._root;
	},
	setRoot:function(root) {
		this._root = root;
		return this;
	}
});