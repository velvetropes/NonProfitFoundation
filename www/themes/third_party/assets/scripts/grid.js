(function($){


Assets.Field.gridConfs = {};


Grid.bind('assets', 'display', function(cell){
	var colId = cell.data('column-id');
	var $field = cell.find('.assets-field');

	// ignore if we can't find that field
	if (! $field.length) return;

	var fieldName = cell.find('input[type=hidden]').attr('name').replace('[]', ''),
		fieldId = fieldName.replace(/[^\w\-]+/g, '_');

	$field.attr('id', fieldId);

	cell.assetsField = new Assets.Field(fieldId, fieldName, Assets.Field.gridConfs['col_id_' + colId]);
});


})(jQuery);
