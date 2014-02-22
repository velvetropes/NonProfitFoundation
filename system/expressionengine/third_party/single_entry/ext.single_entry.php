<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Single Entry Extension
 *
 * @package		ExpressionEngine
 * @subpackage	Addons
 * @category	Extension
 * @author		Viget Labs
 * @copyright	Copyright (c) 2012 Viget Labs, LLC
 * @link		http://viget.com
 */

require_once PATH_THIRD.'single_entry/config.php';

class Single_entry_ext {

	public $settings 		= array();
	public $description		= 'Admin rearrangment for Single Entry Channels';
	public $docs_url		= '';
	public $name			= SINGLE_ENTRY_NAME;
	public $settings_exist	= 'y';
	public $version			= SINGLE_ENTRY_VERSION;

	private $EE;

	/**
	 * Constructor
	 *
	 * @param 	mixed	Settings array or empty string if none exist.
	 */
	public function __construct($settings = '')
	{
		$this->EE =& get_instance();

		$this->EE->lang->loadfile('single_entry');
		$this->settings = $settings;
	}// ----------------------------------------------------------------------

	/**
	 * Activate Extension
	 *
	 * This function enters the extension into the exp_extensions table
	 *
	 * @see http://codeigniter.com/user_guide/database/index.html for
	 * more information on the db class.
	 *
	 * @return void
	 */
	public function activate_extension()
	{
		// Setup custom settings in this array.
		$this->settings = array(
			'single_entry_nav_title' => $this->EE->lang->line('single_entry_nav_title')
		);

		$data = array(
			'class'		=> __CLASS__,
			'method'	=> 'cp_menu_array',
			'hook'		=> 'cp_menu_array',
			'settings'	=> serialize($this->settings),
			'version'	=> $this->version,
			'enabled'	=> 'y'
		);

		$this->EE->db->insert('extensions', $data);

	}

	// ----------------------------------------------------------------------

	/**
	 * cp_menu_array
	 *
	 * @param menu array
	 * @return menu array
	 */
	public function cp_menu_array($menu)
	{
		$this->EE->api->instantiate('channel_structure');

		if ($this->EE->extensions->last_call !== FALSE)
		{
			$menu = $this->EE->extensions->last_call;
		}

		$this->fetch_channels();
		$this->fetch_settings();

		$single_entries = array();

		foreach ($this->channels as $row)
		{

		 	if( ! empty($this->settings['single_entry'][$this->EE->config->item('site_id')][$row['channel_id']]))
			{
				if( ! empty($menu['content']['publish']) && is_array($menu['content']['publish']))
				{
					unset($menu['content']['publish'][$row['channel_title']]);
				}
				if( ! empty($menu['content']['edit']) && is_array($menu['content']['edit']))
				{
					unset($menu['content']['edit'][$row['channel_title']]);
				}

				$this->EE->lang->language['nav_'.$row['channel_name']] = $row['channel_title'];

				$url = BASE.AMP.'C=content_publish'.AMP.'M=entry_form'.AMP.'channel_id='.$row['channel_id'];

				$query = $this->EE->db->get_where('channel_data', array('channel_id' => $row['channel_id']), 1, 0);

				if($query->num_rows() > 0) {
					$entry = $query->row();
					$url .= AMP.'entry_id='.$entry->entry_id;
				}

				unset($query);

				$single_entries[$row['channel_name']] = $url;
			}
		}

		$this->EE->lang->language['nav_Single Entries'] = $this->settings['single_entry_nav_title'];

		if(empty($menu['content']['publish']))
		{
			unset($menu['content']['publish']);
		}

		if(count($menu['content']['edit']) == 1)
		{
			$menu['content']['edit'] = BASE.AMP.'C=content_edit';
		}

		if( ! empty($single_entries) )
		{
			$menu['content'] = array_merge(
				array(
					'Single Entries' => $single_entries,
					'----'
				),
				$menu['content']
			);
		}

		return $menu;
	}

	// ----------------------------------------------------------------------

	/**
	 * Disable Extension
	 *
	 * This method removes information from the exp_extensions table
	 *
	 * @return void
	 */
	function disable_extension()
	{
		$this->EE->db->where('class', __CLASS__);
		$this->EE->db->delete('extensions');
	}

	// ----------------------------------------------------------------------

	/**
	 * Update Extension
	 *
	 * This function performs any necessary db updates when the extension
	 * page is visited
	 *
	 * @return 	mixed	void on update / false if none
	 */
	function update_extension($current = '')
	{
		if ($current == '' OR $current == $this->version)
		{
			return FALSE;
		}

		$this->EE->db->where('class', __CLASS__);
		$this->EE->db->update('extensions',
			array('version' => SINGLE_ENTRY_VERSION)
		);
	}

	// ----------------------------------------------------------------------

	/**
	 * settings_form
	 *
	 * @return	void
	 */
	public function settings_form()
	{
		$this->fetch_channels(TRUE);
		$this->fetch_settings();

		$vars = array(
			'site_id' => $this->EE->config->item('site_id'),
			'action_url' => 'C=addons_extensions'.AMP.'M=save_extension_settings'.AMP.'file=single_entry',
			'settings' => $this->settings,
			'channels' => $this->channels,
		);

		return $this->EE->load->view('index', $vars, TRUE);
	}

	// --------------------------------------------------------------------

	/**
	 * save_settings
	 *
	 * @return	void
	 */
	public function save_settings()
	{

		$this->fetch_channels(TRUE);

		foreach ($this->channels as $row)
		{
			if( ! empty($_POST['single_entry'][$this->EE->config->item('site_id')][$row['channel_id']]))
			{
				$this->settings['single_entry'][$this->EE->config->item('site_id')][$row['channel_id']] = $this->EE->security->xss_clean($_POST['single_entry'][$this->EE->config->item('site_id')][$row['channel_id']]);
			}
		}

		$this->settings['single_entry_nav_title'] = ! empty($_POST['single_entry_nav_title']) ? $this->EE->security->xss_clean($_POST['single_entry_nav_title']) : lang('single_entry_nav_title');

		$this->EE->db->where('class', __CLASS__);

		$this->EE->db->update('extensions', array('settings' => serialize($this->settings)));

		$this->EE->functions->redirect(BASE.AMP.'C=addons_extensions'.AMP.'M=extension_settings'.AMP.'file=single_entry');

	}

	// --------------------------------------------------------------------

	/**
	 * fetch_settings
	 *
	 * @return	void
	 */
	public function fetch_settings()
	{
		if ( ! empty($this->settings))
		{
			return;
		}

		$this->EE->db->select('settings');
		$query = $this->EE->db->get_where('extensions', array('class' => __CLASS__), 1, 0);

		$this->settings = ($query->row('settings')) ? unserialize($query->row('settings')) : array();

		unset($query);
	}

	// --------------------------------------------------------------------

		/**
	 * fetch_channels
	 *
	 * @return	void
	 */
	public function fetch_channels($force_all = FALSE)
	{
		if (isset($this->channels))
		{
			return;
		}

		if($force_all)
		{
			$query = $this->EE->db->get('channels');
			$this->channels = $query->result_array();
		} else {
			$this->EE->load->model('channel_model');
			$query = $this->EE->channel_model->get_channels();
			$this->channels = ! empty($query) ? $query->result_array() : array();
		}

		unset($query);
	}

	// --------------------------------------------------------------------
}

/* End of file ext.single_entry.php */
/* Location: /system/expressionengine/third_party/single_entry/ext.single_entry.php */