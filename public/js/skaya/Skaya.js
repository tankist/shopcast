var Skaya = {
	UNKNOWN:2147483647,
	emptyFn:function() {return true;},
	apply:function(obj, config) {
		for (var i in config) {
			obj[i] = config[i];
		}
	},
	
	extend: function(bc, sc, o) {
		var f = function() {};
		f.prototype = sc.prototype;
		bc.prototype = new f();
		bc.prototype.constructor = bc;
		bc.superclass = sc.prototype;
		for (var m in o)
			bc.prototype[m] = o[m];
	},

	setScope: function(callback, scope) {
		return function() {
			return callback.apply(scope, arguments);
		};
	},

	namespace: function() {
		var ns, d;
		for (var i = 0; i < arguments.length; i++) {
			ns = window;
			d = arguments[i].split(".");
			for (var j in d)
				ns = ns[d[j]] = ns[d[j]] ? ns[d[j]] : {};
		};
	},
	
	isObject: function(obj) {
		return (obj && obj.constructor && obj.constructor == Object.prototype.constructor && !obj.nodeName)
			? true : false;
	},

	isArray: function(arr) {
		return  (arr && /array/i.test(arr.constructor)) ? true : false;
	},
	
	isFunction: function(obj) {
		return (typeof obj == 'function');
	},
	
	isEmpty: function(o) {
		for(var i in o) {
			if (o.hasOwnProperty(i)) return false;
		}
		return true;
	}
};

if (!Array.prototype.indexOf) {
	Array.prototype.indexOf = function(v){
		   for(var i = this.length; i-- && this[i] !== v;);
		   return i;
	}
};

Array.prototype.range = function(min,max) {
	this.splice(0, this.length);
	for(var i = min;i<=max;i++) this.push(i);
	return this;
};

Array.prototype.extract = function(propertyName) {
	var _r = [];
	for (var i = 0;i<this.length;i++) {
		_r.push(this[i][propertyName]);
	}
	return _r;
};

if (!Array.prototype.filter) {
    Array.prototype.filter = function(fun){
        var len = this.length;
        if (typeof fun != "function") 
            throw new TypeError();
        
        var res = [], thisp = arguments[1] || this;
        for (var i = 0; i < len; i++) {
            if (i in this) {
                var val = this[i]; // in case fun mutates this
                if (fun.call(thisp, val, i, this)) 
                    res.push(val);
            }
        }
        
        return res;
    };
};

Function.prototype.scope = function(obj, args, appendArgs){
	var method = this;
	return function() {
		var callArgs = args || arguments;
		if(appendArgs === true){
			callArgs = Array.prototype.slice.call(arguments, 0);
			callArgs = callArgs.concat(args);
		}else if(typeof appendArgs == "number"){
			callArgs = Array.prototype.slice.call(arguments, 0); // copy arguments first
			var applyArgs = [appendArgs, 0].concat(args); // create method call params
			Array.prototype.splice.apply(callArgs, applyArgs); // splice them in
		}
		return method.apply(obj || window, callArgs);
	};
};

Function.prototype.defer = function(millis, obj, args, appendArgs){
	var fn = this.scope(obj, args, appendArgs);
	if(millis){
		return setTimeout(fn, millis);
	}
	fn();
	return 0;
};

String.prototype.wikify = function(separator) {
	return this.replace(/[\s\/\\%&\*\+\)\(\[\]\{\}]+/ig, separator || '_');
};

String.prototype.unwikify = function(separator) {
	return this.replace(separator || '_', ' ');
};

String.prototype.capitalize = function() {
	return (this != '')?this.substr(0, 1).toUpperCase() + this.substr(1):'';
};

String.prototype.uncapitalize = function() {
	return (this != '')?this.substr(0, 1).toLowerCase() + this.substr(1):'';
};

String.prototype.separatorToCamelCase = function(separator) {
	var parts = this.split(separator);
	for (var i=0, len = parts.length;i<len;i++) {
		parts[i] = parts[i].capitalize();
	}
	return parts.join('');
};

String.prototype.dashToCamelCase = function() {
	return this.separatorToCamelCase('-');
};

String.prototype.underscoreToCamelCase = function() {
	return this.separatorToCamelCase('_');
};

String.prototype.ucwords = function() {
	var _tokens = this.split(' ');
	for (var i=0;i<_tokens.length;i++) {
		_tokens[i] = _tokens[i].capitalize();
	}
	return _tokens.join(' ');
};