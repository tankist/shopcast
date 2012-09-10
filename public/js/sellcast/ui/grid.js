$.widget('sellcast.grid', {
	_table:null,
	_header:null,
	_rows:null,
	options:{
		classPrefix:'',
		header:null,
		store:null,
		itemSelector:'tr',
		headerTpl:'<% if (header && header.length>0) { %><tr><% for (var i=0;i<header.length;i++) { %><th class="<%=options.classPrefix%><%=header[i].label.toLowerCase()%>"><% if (!!header[i].sortField) { %><a href="" rel="<%=header[i].sortField%>" class="sort"><span class="sc-grid-header-title"><%=header[i].label%></span><span class="sc-grid-header-sort asc">&nbsp;▲</span><span class="sc-grid-header-sort desc">&nbsp;▼</span></a><% } else {%><%=header[i].label%><%}%></th><%}%></tr><% } %>',
		rowsTpl:'<% for (var i=0;i<rows.length;i++) { %><tr>' + 
				'<% for (var j in rows[i]) { if (rows[i].hasOwnProperty(j)) {%><td class="<%=options.classPrefix%><%=j.toLowerCase()%>"><%=rows[i][j]%></td><% }} %>' + 
				'</tr><% } %>'
	},
	_create:function() {
		var self = this, options = self.options;
		
		if (!(options.store instanceof Skaya.Store.Abstract)) {
			return;
		}
		
		var store = options.store;data = store.getItems();
		
		function _initHeader() {
			if (!options.header) {
				options.header = [];
				if (data.length > 0) {
					var _d = data[0];
					for (var i in _d) {
						if (_d.hasOwnProperty(i)) {
							options.header.push({
								label:i.toString().ucwords(),
								sortField:null
							});
						}
					}
				}
			}
		};
		
		function _sort(field, type) {
			store.setOrder(field, type);
			if (!store.getAutoload()) {
				store.load();
			}
		}
		
		function init() {
			if (options.classPrefix.length > 0) options.classPrefix += '-';
		
			store.bind('afterload', function(e, data) {
				self._renderRows.call(self, data);
				self._render.call(self, data);
			});
		
			_initHeader();
			self.element.addClass('sc-grid-container');
			
			if (store.getAutoload()) {
				self._render(data);
			}
			
			$(self.element).delegate('th a.sort', 'click', function(e) {
				var _this = $(this), _sortField = _this.attr('rel'), _sortType = null;
				if (!_sortField) return false;
				var isAsc = _this.hasClass('asc'), isDesc = _this.hasClass('desc'), isNone = !isAsc && !isDesc;
				if (isAsc) {
					_this.removeClass('asc').addClass('desc');
					_sortType = 'logicaldesc';
				}
				if (isDesc) {
					_this.removeClass('desc').removeClass('asc');
					_sortType = null;
				}
				if (isNone) {
					_this.removeClass('desc').addClass('asc');
					_sortType = 'logic';
				}
				self._trigger('sort', e, {grid:self.element, sortField:_sortField, sortType: _sortType});
				_sort(_sortField, _sortType);
				return false;
			});
			
			$(self.element).delegate(options.itemSelector, 'click', function(e) {
				var _this = $(this), index = _this.index(options.itemSelector), ui = {
					grid:self.element, 
					row:_this, 
					rowIndex: index, 
					data:store.getItems()[index]
				};
				if (_this.find('th').length == 0) {
					self._trigger('rowclick', e, ui);
				}
				else {
					ui.rowIndex = -1;
					delete ui.data;
					self._trigger('headerrowclick', e, ui);
				}
			});
			
			$(self.element).delegate(options.itemSelector, 'dblclick', function(e) {
				var _this = $(this), index = _this.index(options.itemSelector), ui = {
					grid:self.element, 
					row:_this, 
					rowIndex: index, 
					data:store.getItems()[index]
				};
				if (_this.find('th').length == 0) {
					self._trigger('rowdblclick', e, ui);
				}
				else {
					ui.rowIndex = -1;
					delete ui.data;
					self._trigger('headerrowdblclick', e, ui);
				}
			});
		};
		
		init();
	},
	_render:function(data) {
		if (!this._table) {
			this.element.empty();
			this._table = $('<table>')
				.addClass('sc-grid')
				.appendTo(this.element)

		}
		if (!this._header) {
			this._renderHeader(data);
		}
		
		if (!this._rows) {
			this._renderRows(data);
		}
		
		this._table.empty().append(this._header).append(this._rows);
		
		this._trigger('render', null, {grid:this.element});
	},
	_renderHeader:function(data) {
		this._header = $.trim(tmpl(this.options.headerTpl, {
			options:this.options,
			header:this.options.header,
			rows:data
		}));
		if (this._header && this._header.length > 0) {
			this._header = $(this._header);
		}
	},
	_renderRows:function(data) {
		this._rows = $.trim(tmpl(this.options.rowsTpl, {
			options:this.options,
			header:this.options.header,
			rows:data
		}));
		if (this._rows && this._rows.length > 0) {
			this._rows = $(this._rows);
		}
	}
});