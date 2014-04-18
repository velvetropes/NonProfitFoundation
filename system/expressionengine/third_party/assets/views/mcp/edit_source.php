<?php

if (! $is_new)
{
	$source_settings = $source->settings();
}

echo form_open($base.AMP.'method=save_source', array('id' => 'source_form'));
echo '<input type="hidden" class="setting_field" name="source_id" value="' . ($is_new ? '0' : $source->get_source_row()->source_id) . '" />';

$this->table->set_template($cp_table_template);
$this->table->set_heading(array(
	array('colspan' => '2', 'data' => lang('general_settings'))
));

$this->table->add_row(
	array('style' => 'width: 50%', 'data' => lang('source_name', 'source_name') . '<br/>' . lang('source_name_instructions')),
	form_input('source_name', $is_new ? '' : $source->get_source_row()->name, 'id="source_name" style="width: 98%"')
);

$this->table->add_row(
	array('style' => 'width: 50%', 'data' => lang('source_type', 'source_type')),
	form_dropdown('source_type', $source_types, $is_new ? '' : $source->get_source_row()->source_type, 'id="source_type" style="width: 98%"')
);

echo $this->table->generate();


// S3 specific
	echo '<div class="asset-source-settings assets-hidden" data-type="s3">';

	$this->table->set_heading(array(
		array('colspan' => '2', 'data' => lang('s3_settings'))
	));


	foreach ($setting_fields['s3'] as $field)
	{
		switch ($field)
		{
			case 'subfolder':
			{
				break;
			}

			default:
			{
				$this->table->add_row(
					array('style' => 'width: 50%', 'data' => lang($field, $field)),
					form_input('s3_' . $field, ($is_new OR !isset($source_settings->{$field})) ? '' : $source_settings->{$field}, 'id="s3_' . $field . '" data-type="s3" class="setting_field" style="width: 98%"')
				);
			}
		}
	}

	$bucket_html = '<span id="s3_buckets">';

	if (!empty($source_settings) && isset($source_settings->bucket))
	{
		$bucket_html .= '<select disabled="disabled" data-type="s3">' .
			'<option>'.$source_settings->bucket.'</option>' .
			'</select>' .
			form_hidden('s3_bucket', $source_settings->bucket);
	}

	$bucket_html .= '</span>' .
		' <a href="" class="refresh_buckets">'.lang('refresh').'</a>';

	$this->table->add_row(array(
		array('data' => lang('bucket', 'bucket'), 'style' => 'width: 50%;'),
		$bucket_html
	));

	$this->table->add_row(
		array('style' => 'width: 50%', 'data' => lang('source_subfolder', 'source_subfolder').'<br />'.lang('s3_source_subfolder_instructions')),
		form_input('s3_subfolder', ($is_new OR !isset($source_settings->subfolder)) ? '' : $source_settings->subfolder, 'id="s3_subfolder" data-type="s3" class="setting_field" style="width: 98%"')
	);

	$this->table->add_row(array(
		lang('url_prefix', 'bucket_url_prefix').'<br />'.lang('url_s3_prefix_instructions'),
		form_input(array(
			'id'    => 's3_bucket_url_prefix',
			'name'  => 's3_bucket_url_prefix',
			'value' => (!empty($source_settings) ? $source_settings->url_prefix : ''),
			'data-type' => 's3'
		)),
	));

	$this->table->add_row(array(
		lang('cf_distribution', 'cf_distribution').'<br />'.lang('cf_distribution_instructions'),
		form_input(array(
			'id'    => 'cf_distribution',
			'name'  => 'cf_distribution',
			'value' => (!empty($source_settings->cf_distribution) ? $source_settings->cf_distribution : ''),
			'data-type' => 's3'
		)),
	));


	$this->table->add_row(array(
		lang('cache_duration', 'cache_duration').'<br />'.lang('cache_duration_instructions'),
		form_input(array(
			'id'    => 's3_cache_duration',
			'name'  => 's3_cache_amount',
			'value' => (!empty($source_settings->cache_amount) ? $source_settings->cache_amount : ''),
			'data-type' => 's3',
			'style' => 'width: 50px;'
		)) . ' ' .
		form_dropdown('s3_cache_period', array('' => '', 'seconds' => lang('seconds'), 'minutes' => lang('minutes'), 'hours' => lang('hours'), 'days' => lang('days')), (!empty($source_settings->cache_period) ? $source_settings->cache_period : ''), 'data-type="s3"')
	));

	echo $this->table->generate();
	echo '</div>';

// Google Cloud specific

	echo '<div class="asset-source-settings assets-hidden" data-type="gc">';

	$this->table->set_heading(array(
		array('colspan' => '2', 'data' => lang('gc_settings'))
	));

	foreach ($setting_fields['gc'] as $field)
	{
		switch ($field)
		{
			case 'subfolder':
			{
				break;
			}

			default:
				{
				$this->table->add_row(
					array('style' => 'width: 50%', 'data' => lang($field, $field)),
					form_input('gc_' . $field, ($is_new OR !isset($source_settings->{$field})) ? '' : $source_settings->{$field}, 'id="gc_' . $field . '" data-type="gc" class="setting_field" style="width: 98%"')
				);
				}
		}
	}

	$bucket_html = '<span id="gc_buckets">';

	if (!empty($source_settings) && isset($source_settings->bucket))
	{
		$bucket_html .= '<select disabled="disabled" data-type="gc">' .
			'<option>'.$source_settings->bucket.'</option>' .
			'</select>' .
			form_hidden('gc_bucket', $source_settings->bucket);
	}

	$bucket_html .= '</span>' .
		' <a href="" class="refresh_gc_buckets">'.lang('refresh').'</a>';

	$this->table->add_row(array(
		array('data' => lang('bucket', 'bucket'), 'style' => 'width: 50%;'),
		$bucket_html
	));

	$this->table->add_row(
		array('style' => 'width: 50%', 'data' => lang('source_subfolder', 'source_subfolder').'<br />'.lang('gc_source_subfolder_instructions')),
		form_input('gc_subfolder', ($is_new OR !isset($source_settings->subfolder)) ? '' : $source_settings->subfolder, 'id="gc_subfolder" data-type="gc" class="setting_field" style="width: 98%"')
	);

	$this->table->add_row(array(
		lang('url_prefix', 'bucket_url_prefix').'<br />'.lang('url_gc_prefix_instructions'),
		form_input(array(
			'id'    => 'gc_bucket_url_prefix',
			'name'  => 'gc_bucket_url_prefix',
			'value' => (!empty($source_settings) ? $source_settings->url_prefix : ''),
			'data-type' => 'gc'
		)),
	));

	$this->table->add_row(array(
		lang('cache_duration', 'cache_duration').'<br />'.lang('cache_duration_instructions'),
		form_input(array(
			'id'    => 'gc_cache_duration',
			'name'  => 'gc_cache_amount',
			'value' => (!empty($source_settings->cache_amount) ? $source_settings->cache_amount : ''),
			'data-type' => 's3',
			'style' => 'width: 50px;'
		)) . ' ' .
		form_dropdown('gc_cache_period', array('' => '', 'seconds' => lang('seconds'), 'minutes' => lang('minutes'), 'hours' => lang('hours'), 'days' => lang('days')), (!empty($source_settings->cache_period) ? $source_settings->cache_period : ''), 'data-type="s3"')
	));


	echo $this->table->generate();
	echo '</div>';


// Rackspace specific
	echo '<div class="asset-source-settings assets-hidden" data-type="rs">';

	$this->table->set_heading(array(
		array('colspan' => '2', 'data' => lang('rackspace_settings'))
	));

	foreach ($setting_fields['rs'] as $field)
	{
		switch ($field)
		{
			// Falling through
			case 'region':
			case 'subfolder':
			{
				break;
			}

			default:
			{
				$this->table->add_row(
					array('style' => 'width: 50%', 'data' => lang($field, $field)),
					form_input('rs_' . $field, ($is_new OR !isset($source_settings->{$field})) ? '' : $source_settings->{$field}, 'id="rs_' . $field . '" data-type="rs" class="setting_field" style="width: 98%"')
				);
				break;
			}
		}
	}

	$region_html = '<span id="rs_regions">';

	if (!empty($source_settings) && isset($source_settings->region))
	{
		$region_html .= '<select disabled="disabled" data-type="rs">' .
			'<option>'.$source_settings->region.'</option>' .
			'</select>' .
			form_hidden('rs_region', $source_settings->region);
	}

	$region_html .= '</span>' .
		' <a href="" class="refresh_regions">'.lang('refresh').'</a>';

	$this->table->add_row(array(
		array('data' => lang('rs_region', 'rs_region'), 'style' => 'width: 50%;'),
		$region_html
	));

	$container_html = '<span id="rs_containers">';

	if (!empty($source_settings) && isset($source_settings->container))
	{
		$container_html .= '<select disabled="disabled" data-type="rs">' .
			'<option>'.$source_settings->container.'</option>' .
			'</select>' .
			form_hidden('rs_container', $source_settings->container);
	}

	$container_html .= '</span>' .
		' <a href="" class="refresh_containers">'.lang('refresh').'</a>';

	$this->table->add_row(array(
		array('data' => lang('container', 'container'), 'style' => 'width: 50%;'),
		$container_html
	));

	$this->table->add_row(
		array('style' => 'width: 50%', 'data' => lang('source_subfolder', 'source_subfolder').'<br />'.lang('rs_source_subfolder_instructions')),
		form_input('rs_subfolder', ($is_new OR !isset($source_settings->subfolder)) ? '' : $source_settings->subfolder, 'id="rs_subfolder" data-type="rs" class="setting_field" style="width: 98%"')
	);

	$this->table->add_row(array(
		lang('url_prefix', 'container_url_prefix').'<br />'.lang('url_rs_prefix_instructions'),
		form_input(array(
			'id'    => 'rs_container_url_prefix',
			'name'  => 'rs_container_url_prefix',
			'value' => (!empty($source_settings) ? $source_settings->url_prefix : ''),
			'data-type' => 'rs'
		)),
	));

	echo $this->table->generate();
	echo '</div>';



echo '<input type="hidden" id="s3_bucket_location" name="s3_bucket_location" value="'.(!empty($source_settings) && isset($source_settings->location) ? $source_settings->location : '').'" />';

echo form_submit(array('name' => 'save_source', 'value' => lang('save_source'), 'class' => 'submit'));
echo form_close();
