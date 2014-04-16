<?php

echo '<select name="rs_region">';

foreach ($region_list as $region_name)
{
	$selected = '';
	if ( isset($source_settings->region) && $region_name == $source_settings->region)
	{
		$selected = ' selected="selected"';
	}
	echo '<option value="'.htmlentities($region_name).'"'.$selected.'>' .
		$region_name .
		'</option>';
}

echo '</select>';
