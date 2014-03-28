<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$plugin_info = array(
  'pi_name' => 'Hundies Get Option Label',
  'pi_version' => '1.0',
  'pi_author' => 'Kara Todd',
  'pi_author_url' => 'http://karatodd.com',
  'pi_description' => 'Simple plugin to fetch the option label from MX Select Plus',
);

/**
 * Shorcodes class
 *
 * @package        Hundies_option_label
 * @author         Juan Daniel Ornelas <juan@100yea.rs>
 * @link           http://ahundredyears.com/
 * @license        MIT
 */
class Hundies_option_label {

  public $return_data = "";

  function __construct()
  {
    
    ee()->load->library('api'); 
    ee()->api->instantiate('channel_fields');

    $field_id = ee()->TMPL->fetch_param('field_id');
    $option   = ee()->TMPL->fetch_param('option');

    $settings = ee()->api_channel_fields->get_settings($field_id);

    if (array_key_exists("options", $settings) && is_array($settings["options"]) && array_key_exists($option, $settings["options"]))
    {
      $this->return_data = $settings["options"][$option];
    }
    else
    {
      $this->return_data = "no";
    }
  }

  // --------------------------------------------------------------------

}
// END CLASS

/* End of file pi.hundies_option_label.php */
