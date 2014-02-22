<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * ExpressionEngine - by EllisLab
 *
 * @package   ExpressionEngine
 * @author    ExpressionEngine Dev Team
 * @copyright Copyright (c) 2003 - 2014, EllisLab, Inc.
 * @license   http://expressionengine.com/user_guide/license.html
 * @link    http://expressionengine.com
 * @since   Version 2.0
 * @filesource
 */

/**
 * Hundies Region Select Fieldtype
 *
 * @package   ExpressionEngine
 * @subpackage  Addons
 * @category  Fieldtype
 * @author    Kara Todd
 * @link    http://karatodd.com
 */

class Hundies_region_select_ft extends EE_Fieldtype {

	var $info = array(
		'name'		=> 'Hundies Region Select',
		'version'	=> '1.0'
	);

	// --------------------------------------------------------------------

	/**
	 * Display field
	 *
	 * @param   $data the entry data
	 * @return  string
	 *
	 */
	public function _display_field($data, $field_name)
	{
		if ( ! ee()->session->cache(__CLASS__, __FUNCTION__))
		{
			ee()->load->library('javascript');

			ee()->cp->add_to_foot('<script type="text/javascript" src="'.URL_THIRD_THEMES.'hundies_region_select/lib/chosen/chosen.jquery.min.js"></script>');
			ee()->cp->add_to_foot('<link rel="stylesheet" media="all" href="'.URL_THIRD_THEMES.'hundies_region_select/lib/chosen/chosen.min.css">');

			ee()->javascript->output('
				function init_chosen() {
					$(".chosen-select").each(function () {
						$(this).chosen({width: "95%"});
						$(".chosen-disabled").remove();
					});

				}
				init_chosen();
				Grid.bind("hundies_region_select", "display", function(cell)
				{
				   init_chosen();
				   console.log($(".chosen-select"));
				});
			');

			ee()->session->set_cache(__CLASS__, __FUNCTION__, true);
		}

		$field_options = $this->_get_field_options($data);
		$field_id = (ctype_digit($this->field_id)) ? 'field_id_'.$this->field_id : $this->field_id;

		return form_dropdown($field_name, $field_options, $data, 'id="'.$field_id.'" class="chosen-select"');
	}

	public function display_field($data)
	{
		return $this->_display_field($data, $this->field_name);
	}

	/**
	 * Display Low Variable field
	 **/
	public function display_var_field($data)
	{
		return $this->_display_field($data, $this->field_name);
	}

	/**
	 * Display Matrix cell field
	 **/
	public function display_cell($data)
	{
		if (is_string($data)) $data = str_replace('"', '&quot;', html_entity_decode($data, ENT_QUOTES));

		return $this->_display_field($data, $this->cell_name);
	}


	// -----------------------------------------


	/**
	 * Save
	 *
	 * @param $data
	 * @return string
	 */
	public function save($data)
	{
		return $data;
	}

	/**
	 * Save Low Variable
	 **/
	public function save_var_field($data)
	{
		return $this->save($data);
	}
	/**
	 * Save Matrix cell
	 **/
	public function save_cell($data)
	{
		return $this->save($data);
	}

	// -----------------------------------------

	/**
	 * Replace tag
	 *
	 * @param $data
	 * @param $params tag params array
	 * @param $tagdata the tagdata string
	 * @return string
	 */
	public function replace_tag($data, $params = array(), $tagdata = FALSE)
	{
		
		return $data;
		
	}

	/**
	 * Replace Low Variable tag
	 **/
	public function display_var_tag($data, $params = array(), $tagdata = false)
	{
		return $this->replace_tag($data, $params, $tagdata);
	}


	// -----------------------------------------


	public function _display_settings($data)
	{
		return array(
			$this->field_formatting_row($data, 'hundies_region_select')
		);
	}


	public function grid_display_settings($data)
	{
		return array(
			$this->grid_field_formatting_row($data)
	    );
	}

	/**
	 * Display channel field settings
	 **/
	public function display_settings($data)
	{
		foreach ($this->_display_settings($data) as $row)
		{
			ee()->table->add_row($row[0], $row[1]);
		}
	}

	/**
	 * Display Matrix cell settings
	 **/
	public function display_cell_settings($data)
	{
		return $this->_display_settings($data);
	}

	/**
	 * Display Low Variable settings
	 **/
	public function display_var_settings($data)
	{
		return $this->_display_settings($data);
	}


	// -----------------------------------------


	/**
	 * Save settings
	 **/
	public function _save_settings($data)
	{
		return $data;
	}

	/**
	 * Save channel field settings
	 **/
	public function save_settings()
	{
		return array_merge($this->_save_settings($_POST), array(
			'field_fmt' => 'none',
			'field_show_fmt' => 'n',
		));
	}

	/**
	 * Save Matrix cell settings
	 **/
	public function save_cell_settings($data)
	{
		return $this->_save_settings($data);
	}

	/**
	 * Save Low Variable settings
	 **/
	public function save_var_settings($data)
	{
		return $this->_save_settings($data);
	}


	/**
	 * Grid Compatibility
	 **/
	public function accepts_content_type($name)
	{
		return ($name == 'channel' || $name == 'grid');
	}


	function _get_field_options($data)
	{
		$us = json_decode(file_get_contents(PATH_THIRD.'hundies_region_select/lib/map_codes/us.json'), true);
		$world = json_decode(file_get_contents(PATH_THIRD.'hundies_region_select/lib/map_codes/regions.json'), true);

		$field_options = array(
			"" => "Select a Region Map",
			"International Regions" => $world,
			"United States Regions" => $us,
		);

		return $field_options;
	}

}


/* End of file ft.hundies_region_select.php */
/* Location: /system/expressionengine/third_party/hundies_region_select/ft.hundies_region_select.php */
