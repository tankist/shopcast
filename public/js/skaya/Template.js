Skaya.Template = function () {
	Skaya.Template.superclass.constructor.apply(this, arguments);
};

Skaya.extend(Skaya.Template, Skaya.VisualComponent, {
	xtype:'Skaya.Template',
	_template:'',
	_emptyTemplate:'',
	_templateOptions:{},
	applyConfig:function(config) {
		this.addEvents('beforerender', 'render');
		Skaya.Template.superclass.applyConfig.apply(this, arguments);
		if (!this._template || this._template.length == 0) {
			this.setTemplate(this.getContainer().html());
		}
	},
	setEmptyTemplate:function(emptyTemplate) {
		this._emptyTemplate = emptyTemplate;
		return this;
	},
	getEmptyTemplate:function() {
		return this._emptyTemplate;
	},
	setTemplate:function(template) {
		this._template = template;
		return this;
	},
	getTemplate:function() {
		return this._template;
	},
	setTemplateOptions:function(templateOptions) {
		this._templateOptions = templateOptions;
		return this;
	},
	getTemplateOptions:function() {
		return this._templateOptions;
	},
	render:function(data) {
		if (this.triggerHandler('beforerender', [data])) {
			var _c = this.getContainer();
			if (data.length > 0) {
				_c.html(this.getTemplate()).fillTemplate(data);
			}
			else {
				_c.html(this.getEmptyTemplate());
			}
			this.triggerHandler('render', [data]);
			return _c.html();
		}
	}
});