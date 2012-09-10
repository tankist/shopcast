Skaya.namespace('Skaya.Store.Reader');

Skaya.Store.Reader.Abstract = function(config) {
	Skaya.Store.Reader.Abstract.superclass.constructor.apply(this, arguments);
}

Skaya.extend(Skaya.Store.Reader.Abstract, Skaya.Object, {
	xtype:'Skaya.Store.Reader.Abstract',
	_fields:{},
	_dataType:'',
	read:function(data) {
		if (!Skaya.isArray(data)) {
			throw new Error('Data must be an array');
		}
		for (var i=0, _data = [];i<data.length;i++) {
			_data.push(this._extractRow(data[i]));
		}
		return _data;
	},
	getFields:function() {
		return this._fields;
	},
	setFields:function(fields) {
		this._fields = fields;
		return this;
	},
	getDataType:function() {
		return this._dataType;
	},
	setDataType:function(datatype) {
		this._dataType = datatype;
		return this;
	},
	_extractRow:function(row) {
		var _row = {};
		if (Skaya.isObject(row)) {
			var fields = this.getFields();
			for (var field in fields) {
				_row[field] = this._extractField(row, field);
			}
		}
		return _row;
	},
	_extractField:function(row, field) {
		var fields = this.getFields(), name = (typeof fields[field] == 'string')?fields[field]:fields[field].name, value = null;
		if (row.hasOwnProperty(name)) {
			value = row[name];
			if (fields[field].type) {
				value = this._setValueType(value, fields[field].type);
			}
		}
		return value;
	},
	_setValueType:function(value, type) {
		switch (type.toLowerCase()) {
			case 'int': return parseInt(value);
			case 'float': return parseFloat(value);
			case 'string': return String(value);
			default: return value;
		}
	}
});