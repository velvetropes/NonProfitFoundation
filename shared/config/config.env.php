<?php
/**
 * Environment Declaration
 *
 * This switch statement sets our environment. The environment is used primarily
 * in our custom config file setup. It is also used, however, in the front-end
 * index.php file and the back-end admin.php file to set the debug mode
 *
 * @package    Focus Lab Master Config
 * @version    1.1.1
 * @author     Focus Lab, LLC <dev@focuslabllc.com>
 */
if ( ! defined('ENV'))
{
	switch (strtolower($_SERVER['HTTP_HOST'])) {

		case "starkey.ahundredyears.com":
			define('ENV', 'stage');
			define('ENV_FULL', 'Staging');
			define('ENV_DEBUG', FALSE);
		break;

		case "starkeyhearingfoundation.org":
		case "www.starkeyhearingfoundation.org":
		case "production.starkey.ahundredyears.com":
			define('ENV', 'prod');
			define('ENV_FULL', 'Production');
			define('ENV_DEBUG', FALSE);
		break;

		case "starkey.local":
			define('ENV', 'local');
			define('ENV_FULL', 'Local');
			define('ENV_DEBUG', TRUE);
		break;

		default :
			die("ERROR: Configure site in shared/config/config.env.php");
		break;

	}
}

/* End of file config.env.php */
/* Location: ./config/config.env.php */
