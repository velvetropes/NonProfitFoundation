(function($){


	ContentElements.bind('assets', 'display', function(element){
		var $field = $('.assets-field', element);

		// ignore if we can't find that field
		if (! $field.length) return;

		var opts = $field.data('ce_options');

		if (typeof opts == "undefined")
		{
			opts = {};
		}

		var name = $field.parent().find('input[name*="[data]"]').attr('name').replace(/\[\]$/, '');
		$field.attr('id', name.replace(/[\[\]]+/g, '_'));
		$field.assetsField = new Assets.Field($field.attr('id'), name, opts);
	});


})(jQuery);
