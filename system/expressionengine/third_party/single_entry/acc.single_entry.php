<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Single Entry Accessory
 *
 * @package		ExpressionEngine
 * @subpackage	Addons
 * @category	Accessory
 * @author		Viget Labs
 * @copyright	Copyright (c) 2012 Viget Labs, LLC
 * @link		http://viget.com
 */

require_once PATH_THIRD.'single_entry/config.php';
 
class Single_entry_acc {
	
	public $name			= SINGLE_ENTRY_NAME;
	public $id				= 'single_entry';
	public $version			= SINGLE_ENTRY_VERSION;
	public $description		= 'Removes the "publish another entry" to a single entry\'s preview page';
	public $sections		= array();

	
	/**
	 * Set Sections
	 */
	public function set_sections()
	{
		$EE =& get_instance();

		$js_out = '';

		if($EE->input->get('C') === 'content_publish' && $EE->input->get('M') === 'view_entry')
		{

			$EE->db->select('settings');
			$query = $EE->db->get_where('extensions', array('class' => SINGLE_ENTRY_CLASS), 1, 0);
			
			$settings = ($query->row('settings')) ? unserialize($query->row('settings')) : array();

			unset($query);

			$channel_id = $EE->input->get('channel_id');
			$site_id = $EE->config->item('site_id');

			if(isset($settings['single_entry'][$site_id][$channel_id]) && $settings['single_entry'][$site_id][$channel_id] == 1) {
				$js_out .= "$('#view_content_entry_links a[href$=\"channel_id=$channel_id\"]').parent().remove()";
			}
		}
		
		//Remove the tab
		$this->sections[] = "<script type='text/javascript'>$('#accessoryTabs a.single_entry').parent().remove();$js_out</script>";
		
	}
	
	// ----------------------------------------------------------------
	
}
 
/* End of file acc.single_entry.php */
/* Location: /system/expressionengine/third_party/single_entry/acc.single_entry.php */