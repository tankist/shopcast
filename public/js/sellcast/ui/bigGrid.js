$.widget('sellcast.bigGrid', {
	_components:{
		header:{},
		footer:{}
	},
	options: {
		store:null,
		components:{
			header:{},
			footer:{}
		}
	},
	_create:function() {
		var self = this, options = self.options, store = options.store, componentsOptions = options.components || {};
		if (!store || !(store instanceof Skaya.Store.Abstract)) {
			return false;
		}
		
		delete options.components;
		
		var gridHeader = $('<div>')
			.addClass('sc-bigGrid-header ui-widget-header')
			.appendTo(self.element),
			
			gridBody = $('<div>')
			.addClass('sc-bigGrid-body ui-widget-content')
			.grid(options)
			.bind({
				gridrender:function(e, ui) {
					self._trigger('render', e, ui);
				},
				gridsort:function(e, ui) {
					self._trigger('sort', e, ui);
				},
				gridrowclick:function(e, ui) {
					self._trigger('rowclick', e, ui);
				},
				gridheaderrowclick:function(e, ui) {
					self._trigger('headerrowclick', e, ui);
				},
				gridrowdblclick:function(e, ui) {
					self._trigger('rowdblclick', e, ui);
				},
				gridheaderrowdblclick:function(e, ui) {
					self._trigger('headerrowdblclick', e, ui);
				}
			})
			.appendTo(self.element),
			
			gridFooter = $('<div>')
			.addClass('sc-bigGrid-footer ui-widget-footer')
			.appendTo(self.element);
			
		var containers = {
			header:gridHeader,
			footer:gridFooter
		}
			
		var headerComponents = componentsOptions.header || {}, 
			footerComponents = componentsOptions.footer || {}, 
			id = helperName = '', 
			_component, _componentOptions;
		
		for (var i in componentsOptions) {
			if (componentsOptions.hasOwnProperty(i)) {
				/** Header or footer addition**/
				for (var h in componentsOptions[i]) {
					if (componentsOptions[i].hasOwnProperty(h)) {
						_componentOptions = componentsOptions[i][h];
						helperName = _componentOptions.helper || h;
						id = _componentOptions.id;
						if (!id || $('#'+id).length > 0) {
							id = h + '-component';
							var _counter = 1;
							while ($('#'+id).length > 0) {
								id = h + '-component' + _counter.toString();
								_counter++;
							}
						}
						_component = self._components[i][id] = $('<div>').attr('id', id).appendTo(containers[i]);
						if (_componentOptions.attributes) {
							_component.attr(_componentOptions.attributes);
						}
						if (typeof _component[helperName] == 'function') {
							_component[helperName].call(_component, _componentOptions);
						}
					}
				}
			}
		}
		
		var _getUiDataFromTableCell = function(cell) {
			var uiData = {}, _tr = $(cell).parents('tr:first');
			if (_tr.length > 0) {
				var rowNum = parseInt(_tr.attr('row')), data = store.getItems();
				if (!isNaN(rowNum) && data && data.length > 0 && data[rowNum]) {
					uiData.data = data[rowNum];
					uiData.rowIndex = rowNum;
				}
			}
			return uiData;
		};
		
		gridBody
			.find('button.button-plus').bind('click', function(e) {
				var uiData = _getUiDataFromTableCell(this);
				self._trigger('plus', e, uiData);
			}).end()
			.find('button.button-delete').bind('click', function(e) {
				var uiData = _getUiDataFromTableCell(this);
				self._trigger('delete', e, uiData);
			}).end()
			.find('td').bind('dblclick', function(e) {
				var uiData = _getUiDataFromTableCell(this);
				self._trigger('plus', e, uiData);
			});
	}
});