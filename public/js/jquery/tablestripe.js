$.fn.tablestripe = function() {
	return this.each(function () {
		$(this)
			.find('tr:even').addClass('even').end()
			.find('tr:odd').addClass('odd').end()
			.find('tr>th').each(function() {
				$(this).parent().removeClass('even odd');
			});
	});
}