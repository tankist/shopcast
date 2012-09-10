Skaya.namespace('Skaya.Store.Proxy');

Skaya.Store.Proxy.Taffy = function(config) {
	Skaya.Store.Proxy.Taffy.superclass.constructor.apply(this, arguments);
}

Skaya.extend(Skaya.Store.Proxy.Taffy, Skaya.Store.Proxy.Local, {
	xtype:'Skaya.Store.Proxy.Taffy',
	_data:null,
	setData:function(data) {
		if (!TAFFY.isTAFFY(data)) {
			if (Skaya.isArray(data) || Skaya.isObject(data)) {
				return Skaya.Store.Proxy.Taffy.superclass.setData.call(this, new TAFFY(data));
			}
			throw new Error('Data cannot be recognized as compatible with TAFFY');
		}
		return Skaya.Store.Proxy.Taffy.superclass.setData.call(this, data);
	},
	_onLoad: function(data, params) {
		if (this.triggerHandler('load', [data])) {
			var records = _r = [], 
				criteria = params.criteria || {}, 
				order = params.order,
				length = data.getLength(), 
				start = params.start || 0, 
				limit = params.limit || length,
				pos = recordsPushed = fetchedRecordsCount = 0,
				__tmpData = data.clone();
			
			if (__tmpData) {
				if (order) {
					__tmpData.orderBy(order);
				}
				
				__tmpData.forEach(function(f, n) {
					if (pos++ >= start && recordsPushed < limit) {
						_r.push(f);
						recordsPushed++;
					}
					fetchedRecordsCount++;
				}, criteria);
				
				delete __tmpData;
			}
			
			this._totalRecords = fetchedRecordsCount;
			records = this.getReader().read(_r);
			return this._onLoadComplete(records);
		}
		return false;
	},
	_onLoadComplete: function(records) {
		return this.triggerHandler('afterload', [records]);
	}
});