Skaya.namespace('Skaya.Store.Reader');

Skaya.Store.Reader.Xml = function(config) {
	Skaya.Store.Reader.Xml.superclass.constructor.apply(this, arguments);
}

Skaya.extend(Skaya.Store.Reader.Xml, Skaya.Store.Reader.Json, {
	xtype:'Skaya.Store.Reader.Xml',
	_dataType:'xml'
});