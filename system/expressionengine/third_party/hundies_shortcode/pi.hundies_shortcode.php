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

	// --------------------------------------------------------------------
	// PROPERTIES
	// --------------------------------------------------------------------

	/**
	 * Plugin return data
	 *
	 * @var         string
	 */
	public $return_data;

	// --------------------------------------------------------------------
	// METHODS
	// --------------------------------------------------------------------

	/**
	 * Constructor
	 *
	 * @return      string
	 */
	public function __construct()
	{
		// -------------------------------------------
		// Init return data
		// -------------------------------------------

		$this->parsed_data = "";
		$this->return_data = ee()->TMPL->tagdata;

		echo "<pre>";

		echo "</pre>";

		// -------------------------------------------
		// Get parameters
		// -------------------------------------------

		$find    = ee()->TMPL->fetch_param('find');
		$replace = ee()->TMPL->fetch_param('replace', '');
		$case    = ee()->TMPL->fetch_param('casesensitive', ee()->TMPL->fetch_param('case'));
		$flags   = ee()->TMPL->fetch_param('flags');

		$pat = '/(\w+)\s*=\s*"(.*?)"/';

		// TODO: multiple forms
		preg_match_all($pat, $this->return_data, $matches);

		ob_start();
		print_r($matches);

		if(isset($matches[1][0])) {
			$id = $matches[1][0];
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
			$this->return_data = ob_get_contents();
			ob_end_clean();
		}

		// -------------------------------------------
		// Make sure find and replace values are arrays
		// -------------------------------------------

		// Why not?
		return $this->return_data;
	}
	// --------------------------------------------------------------------

	private function parseCode($code) {

		$r = explode("[", $content);
		if (isset($r[1])){
		    $r = explode("]", $r[1]);
		    $innerCode = $r[0];
		}

		$innerCodeParts = explode(' ', $innerCode);
		$command = $innerCodeParts[0];
		$attributeAndValue = $innerCodeParts[1];
		$attributeParts = explode('=', $attributeParts);
		$attribute = $attributeParts[0];
		$attributeValue = str_replace('\"', '', $attributeParts[1]);

		return $command . ' ' . $attribute . '=' . $attributeValue;
	}

}
// END CLASS

/* End of file pi.hundies_shortcode.php */
