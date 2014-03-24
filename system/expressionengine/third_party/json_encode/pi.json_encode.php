<?php

if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$plugin_info = array(
  'pi_name' => 'JSON Encode',
  'pi_version' => '1.0',
  'pi_author' => 'Kara Todd',
  'pi_author_url' => 'http://karatodd.com/',
  'pi_description' => 'Clean data before putting it in a json feed',
  'pi_usage' => JSON_encode::usage()
  );

/**
 * JSON_encode Class
 *
 * @package			ExpressionEngine
 * @category		Plugin
 * @author			Airtype Studio
 * @copyright		Copyright (c) 2010, Airtype Studio
 * @link			http://www.airtypestudio.com/
 */

class JSON_encode {

var $return_data = "";

	// --------------------------------------------------------------------

	/**
	 * JSON_encode
	 *
	 * This function runs urlencode() on a string of text
	 *
	 * @access	public
	 * @return	string
	 */


  function JSON_encode()
  {
    $data = html_entity_decode(ee()->TMPL->tagdata, ENT_COMPAT, 'UTF-8');
    $data = json_encode($data);

    // remove wrapper quotes.
    $data = substr($data, 1, (strlen($data)-1));
    $data = substr($data, 0, -1);

    $this->return_data = $data;

    return $this->return_data;
  }
  
  	// --------------------------------------------------------------------

	/**
	 * Usage
	 *
	 * This function describes how the plugin is used.
	 *
	 * @access	public
	 * @return	string
	 */
	
  //  Make sure and use output buffering

  function usage()
  {
  	ob_start(); 
  ?>
The URL Encode plugin urlencodes your string to make it safe for Facebook's Like Button or other applications.

The tag pair is simply:
{exp:json_encode}URL{/exp:json_encode}

Example usage:

{exp:json_encode}http://www.airtypestudio.com/{/exp:json_encode}


  <?php
  	$buffer = ob_get_contents();
	
  	ob_end_clean(); 

  	return $buffer;
  }
  // END

  

}

/* End of file pi.url_encode.php */ 
/* Location: ./system/expressionengine/third_party/url_encode/pi.url_encode.php */
