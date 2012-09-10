$.widget('sellcast.slider', $.ui.slider, {
	widgetEventPrefix:'sellcast_',
	options: {
		store:null,
		field:'',
		labelMin:null,
		labelMax:null,
		labelLimitMin:null,
		labelLimitMax:null,
		label:''
	},
	_create: function() {
		$.ui.slider.prototype._create.call(this);
		
		var self = this, 
			options = self.options, 
			store = options.store, 
			field = options.field,
			labels = {},
			labelValues = {
				'min':(self.options.range)?self._values()[0]:self._value(),
				'max':(self.options.range)?self._values()[1]:null,
				'limit-min':self._valueMin(),
				'limit-max':self._valueMax()
			};
		
		if (!(store instanceof Skaya.Store.Abstract) || !field || field.length == 0) {
			return;
		}
		
		if (options.label && options.label != '') {
			$('<label>').html(options.label).prependTo(self.element);
		}
		
		function setFieldValue(value) {
			store.setCriteria(value, field);
		};
		
		function createLabel(name) {
			return $('<span>').addClass('ui-slider-label ui-slider-label-' + name).appendTo(self.element);
		};
		
		function renderLabel(name, value) {
			var _v = '', labelName = 'label' + name.dashToCamelCase();
			if (options[labelName] !== null) {
				_v = (Skaya.isFunction(options[labelName]))?options[labelName].call(self, value):value.toString();
			}
			labels[name].html(_v);
		};
		
		function positionLabel(name, value) {
			var w = labels[name].css({left:(value / self._valueMax() * 100).toString() + '%'}).width();
			if (w>0) labels[name].css('margin-left', (-w / 2).toString() + 'px');
		};
		
		function init() {
			self.element.bind('sellcast_change', function(e, ui) {
				var limitMin = self.options.min, limitMax = self.options.max, value = ui.value;
				
				if (self.options.range && Skaya.isArray(ui.values) && ui.values.length > 1) {
					var min = ui.values[0], max = ui.values[1];
					_c = function (f, n) {
						return (f >= min && f <= max); 
					};
				}
				else {
					var _c = null;
					if (value != limitMin && value != limitMax) {
						_c = {lt:value - 0.00001};
					}
				}
				setFieldValue(_c);
				return true;
			});
			
			self.element.bind('sellcast_slide', function(e, ui) {
				var min = (self.options.range)?ui.values[0]:ui.value, 
					max = (self.options.range)?ui.values[1]:null;
					
				renderLabel('min', min);
				renderLabel('max', max);
				
				positionLabel('min', min);
				if (self.options.range) {
					positionLabel('max', max);
				}
			});
		
			for (var i in labelValues) {
				if (labelValues.hasOwnProperty(i)) {
					labels[i] = createLabel(i);
					if (labels[i] instanceof jQuery) {
						renderLabel(i, labelValues[i]);
						positionLabel(i, labelValues[i]);
					}
				}
			}
			
			labels['limit-min'].addClass('ui-slider-label-limits');
			labels['limit-max'].addClass('ui-slider-label-limits');
		};
		
		init();
	}
});