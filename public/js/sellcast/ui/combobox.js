$.widget('sellcast.combobox', $.ui.combobox, {
	widgetEventPrefix:'sellcast_',
	options: {
		store:null,
		field:'',
		label:''
	},
	_create:function() {
		$.ui.combobox.prototype._create.call(this);
		
		var self = this, 
			options = self.options, 
			store = options.store, 
			field = options.field;
		
		if (!(store instanceof Skaya.Store.Abstract) || !field || field.length == 0) {
			return;
		}
		
		function init() {
			self.element.bind('sellcast_selected', function(e, ui) {
				store.setCriteria(ui.item.value || null, field);
				self.element.find('input').blur();
			});
			self.element.bind('sellcast_select', function(e, ui) {
				if (ui.item.value === null && ui.item.label != '') {
					self.element.find('input').val(ui.item.label);
					return false;
				}
				return true;
			});
		}
		
		init();
	}
});