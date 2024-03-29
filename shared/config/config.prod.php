<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Production config overrides & db credentials
 * 
 * Our database credentials and any environment-specific overrides
 * 
 * @package    Focus Lab Master Config
 * @version    1.1.1
 * @author     Focus Lab, LLC <dev@focuslabllc.com>
 */

$env_db['hostname'] = '127.0.0.1';
$env_db['username'] = 'root';
$env_db['password'] = 'root';
$env_db['database'] = 'starkey';

// Sample global variable for Production only
// Can be used in templates like "{global:google_analytics}"
$env_global['global:google_analytics'] = 'UA-38669505-1';

/* End of file config.prod.php */
/* Location: ./config/config.prod.php */