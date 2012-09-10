$.widget("ui.combobox", {
	_create: function() {
		var self = this, select = input = this.element;
		
		if (select.is('select') && !self.options.source) {
			select.hide(),
			self.options.source = function(request, response) {
				var matcher = new RegExp(request.term, "i");
				response(select.children("option").map(function() {
					var text = $(this).text();
					if (!request.term || matcher.test(text))
						return {
							id: $(this).val(),
							label: text.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + request.term.replace(/([\^\$\(\)\[\]\{\}\*\.\+\?\|\\])/gi, "\\$1") + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>"),
							value: text
						};
				}));
			};
			input = $("<input>").insertAfter(select)
		}
		
		input
		.autocomplete({
			source: self.options.source,
			delay: 0,
			select: function(e, ui) {
				if (!ui.item) {
					// remove invalid value, as it didn't match anything
					$(this).val("");
					return false;
				}
				$(this).focus();
				var _item = {item:{}};
				if (select.is('select')) {
					select.val(ui.item.id);
					var o_ = select.find("[value='" + ui.item.id + "']");
					_item.item.label = o_.text();
					_item.item.value = o_.val();
				}
				else {
					select.val(ui.item.value);
					_item = ui;
				}
				self._trigger("selected", null, _item);
			},
			minLength: 0,
			label:self.options.label
		})
		.addClass("ui-widget ui-widget-content ui-corner-left ui-widget-combobox");
		$("<button>&nbsp;</button>")
		.insertAfter(input.find('input'))
		.button({
			icons: {
				primary: "ui-icon-triangle-1-s"
			},
			text: false
		}).removeClass("ui-corner-all")
		.addClass("ui-corner-right ui-button-icon")
		.click(function() {
			// close if already visible
			if (input.autocomplete("widget").is(":visible")) {
				input.autocomplete("close");
				return;
			}
			// pass empty string as value to search for, displaying all results
			input.autocomplete("search", "");
			input.focus();
		});
		
		self.input = input;
	}
});