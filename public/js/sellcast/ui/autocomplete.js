$.widget('sellcast.autocomplete', $.ui.autocomplete, {
	widgetEventPrefix:'sellcast_',
	options: {
		store:null,
		field:'',
		label:''
	},
	_create:function() {
		var self = this, 
			options = self.options, 
			store = options.store, 
			field = options.field;
			
		if (!self.element.is('input')) {
			self.element = $('<input>').attr({type:'text'}).appendTo(self.element);
			if (options.name) {
				self.element.attr('name', options.name);
			}
		}
		
		if (options.label && options.label != '') {
			$('<label>').html(options.label).insertBefore(self.element);
		}
		
		$.ui.autocomplete.prototype._create.call(this);
		
		if (!(store instanceof Skaya.Store.Abstract) || !field || field.length == 0) {
			return;
		}
		
		function init() {
			self.element.bind({
				'keydown.autocomplete': function(e) {
					var keyCode = $.ui.keyCode;
					switch (e.keyCode) {
						case keyCode.ENTER:
						case keyCode.NUMPAD_ENTER:
							self._trigger('select', e, {
								item: {
									value:self.element.val(),
									label:self.term
								}
							});
					}
				},
				sellcast_select: function(e, ui) {
					if (ui.item.value === '') {
						store.setCriteria(null, field);
						return true;
					}
					store.setCriteria({'like':ui.item.value || null}, field);
					return true;
				},
				sellcast_change: function(e, ui) {
					if (!ui.item) {
						store.setCriteria(null, field);
					}
					return true;
				}
			});
		}
		
		init();
	}
});