Skaya.namespace('Skaya.Store');

Skaya.Store.Local = function(config) {
	Skaya.Store.Local.superclass.constructor.apply(this, arguments);
}

Skaya.extend(Skaya.Store.Local, Skaya.Store.Abstract, {
	xtype:'Skaya.Store.Local',
	_onLoadComplete: function(e, data) {
		try {
			var taffyStore = new TAFFY(data);
			taffyStore.onInsert = function(r) {
				return this.triggerHandler('appendrecord', [r]);
			}.scope(this);
			taffyStore.onUpdate = function(newRecord, oldRecord) {
				return this.triggerHandler('updaterecord', [newRecord, oldRecord]);
			}.scope(this);
			taffyStore.onInsert = function(r) {
				return this.triggerHandler('removerecord', [r]);
			}.scope(this);
			this.setStore(taffyStore);
		} catch (err) {
			return false;
		}
		return Skaya.Store.Local.superclass._onLoadComplete.apply(this, arguments);
	}
});