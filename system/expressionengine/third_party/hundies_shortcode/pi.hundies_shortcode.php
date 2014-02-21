<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

// include config file
include(PATH_THIRD.'hundies_shortcode/config.php');

$plugin_info = array(
	'pi_name'        => HUNDIES_SHORTCODE_NAME,
	'pi_version'     => HUNDIES_SHORTCODE_VERSION,
	'pi_author'      => 'Juan Daniel Ornelas',
	'pi_author_url'  => HUNDIES_SHORTCODE_DOCS,
	'pi_description' => 'A small implementation of WordPress-like shortcodes for ExpressionEngine.',
	'pi_usage'       => 'See '.HUNDIES_SHORTCODE_DOCS.' for more info.'
);

/**
 * Shorcodes class
 *
 * @package        hundies_shortcode
 * @author         Juan Daniel Ornelas <juan@100yea.rs>
 * @link           http://ahundredyears.com/
 * @license        MIT
 */
class hundies_shortcode {

	public $return_data;
	public $codes = array("gallery", "form");

	public function __construct()
	{
		$this->parsed_data = "";
		$this->return_data = ee()->TMPL->tagdata;

		foreach($this->codes as $code) {
			preg_match_all('/'.$this->getRe($code).'/s', $this->return_data, $matches);
			if(isset($matches['2']) && count($matches['2']) > 0) {
				foreach($matches['2'] as $index => $attr) {
					if($id = $this->getId($attr)) {
						switch($code) {
							case "gallery":
								$data = $this->getGallery($id);
							break;
							case "form":
								$data = $this->getForm($id);
							break;
						}
						$this->return_data = str_ireplace($matches['0'][$index], $data, $this->return_data);
					}
				}
			}
		}

		return $this->return_data;
	}
	// --------------------------------------------------------------------

	private function getForm($id) {
		ob_start();
		?>
		{exp:freeform:form form:class="flatform" form_id="<?=$id?>" return="/#thank_you"}
		    <dl>
		    {freeform:all_form_fields}
		        <dt><label>{freeform:field_label}</label></dt>
		        <dd>{freeform:field_output}</dd>
		    {/freeform:all_form_fields}
		    </dl>
		    {freeform:submit}
		{/exp:freeform:form}
		<?
		$content = ob_get_contents();
		ob_end_clean();
		return $content;
	}

	private function getGallery($id) {
		ob_start();
		?>
		
		  {exp:channel:entries channel="gallery" dynamic="no" url_title="<?=$id?>" limit="1"}
			  {item}
				  {if count == 1}<gallery slides="{total_rows}">{/if}
					  	<gallery-slide
					  	 image-url="{item:image}"
					  	 video-url="{item:video}"
					  	></gallery-slide>
				  {if count == total_rows}</gallery>{/if}
			  {/item}
			  {if no_results}<!-- No gallery found -->{/if}
		  {/exp:channel:entries}
		
		<?
		$content = ob_get_contents();
		ob_end_clean();
		return $content;
	}

	private function getId($attr) {
		$id = str_replace("\"", "", next(explode("id=", $attr)));
		if($id) {
			return $id;
		} else {
			return false;
		}
	}

	private function getRe($tag) {
		return '\[('.$tag.')\b(.*?)(?:(\/))?\](?:(.+?)\[\/\2\])?';
	}
}
// END CLASS

/* End of file pi.hundies_shortcode.php */
