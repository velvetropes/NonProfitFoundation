<?php

/**
 * hundies_shortcode config file
 *
 * @package        hundies_shortcode
 * @author         Juan Daniel Ornelas <daniel@100yea.rs>
 * @link           http://ahundredyears.com/
 * @license        MIT
 */

if ( ! defined('HUNDIES_SHORTCODE_NAME'))
{
	define('HUNDIES_SHORTCODE_NAME',    '100YRS ShortCode');
	define('HUNDIES_SHORTCODE_PACKAGE', 'hundies_shortcode');
	define('HUNDIES_SHORTCODE_VERSION', '1.0');
	define('HUNDIES_SHORTCODE_DOCS',    ''); //TODO: fill in
}

/**
 * < EE 2.6.0 backward compat
 */
if ( ! function_exists('ee'))
{
	function ee()
	{
		static $EE;
		if ( ! $EE) $EE = get_instance();
		return $EE;
	}
}

/**
 * NSM Addon Updater
 */
$config['name']    = HUNDIES_SHORTCODE_NAME;
$config['version'] = HUNDIES_SHORTCODE_VERSION;
$config['nsm_addon_updater']['versions_xml'] = HUNDIES_SHORTCODE_DOCS.'/feed';
