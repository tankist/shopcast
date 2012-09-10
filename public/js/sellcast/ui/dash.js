/** Dash small widget **/

$.widget('sellcast.dash', {
	widgetEventPrefix:'sellcast_',
	options:{
		store:null,
		title:'',
		switchers:null,
		page:null,
		switcherField:''
	},
	_create:function() {
		var self = this, options = self.options, title = options.title, store = options.store;
		if (!store || !(store instanceof Skaya.Store.Abstract)) {
			return false;
		}
		var _wikiTitle = title.toLowerCase().wikify('-'), 
			components = {
				header:{},
				footer:{}
			};
		
		if (!!options.switchers) {
			components.header[_wikiTitle + '-switcher'] = {
				helper:'switcher',
				store:store,
				switchers:options.switchers,
				field:options.switcherField
			};
		}
		
		if (!!options.page) {
			components.footer[_wikiTitle + '-paginator'] = {
				helper:'paginator',
				page:options.page,
				store:store,
				buttons:['prev', 'next'],
				pageInput:false,
				pageLabel:false,
				loaderPosition:'append'
			};
		}
		
		var header = $('<h2></h2>')
			.addClass('sc-dash-widget-header-title')
			.text(title);
		
		options.components = components;
		self.element.bigGrid(options);
		self.element
			.addClass('sc-dash-widget')
			.find('.sc-bigGrid-header').prepend(header);
	}
});