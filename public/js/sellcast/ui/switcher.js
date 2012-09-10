$.widget('sellcast.switcher', {
	widgetEventPrefix:'sellcast_',
	options:{
		store:null,
		switchers:[],
		field:''
	},
	_create:function() {
		var self = this, options = self.options, 
			switchersCount = 0, store = options.store, field = options.field;
		
		var switcherConfig, label, value, id;
		
		for (var i=0;i<options.switchers.length;i++) {
			if (options.switchers[i]) {
				switcherConfig = options.switchers[i];
				label = (typeof switcherConfig == 'string')?switcherConfig:switcherConfig.label;
				id = label.toLowerCase().wikify('-');
				value = (typeof switcherConfig.value !== 'undefined')?switcherConfig.value:label;
				
				$('<input>')
					.attr({
						type:'radio',
						name:'switcher',
						id:'radio-' + id
					})
					.val(value)
					.bind('click', function(e, ui) {
						var value = this.value;
						if (value.length == 0) {
							value = null;
						}
						if (store instanceof Skaya.Store.Abstract && !!field.length) {
							store.setCriteria(value, field);
						}
						self._trigger('switch', e, {
							switcher:value
						});
					})
					.appendTo(self.element);
				$('<label></label>')
					.attr('for', 'radio-' + id)
					.text(label)
					.addClass('ui-switcher-' + id)
					.appendTo(self.element);
				switchersCount++;
			}
		}
		if (switchersCount > 0) {
			self.element
				.addClass('sc-switcher-widget')
				.buttonset();
		}
	}
})