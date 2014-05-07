<?php

/**
 * Developed by Biber Ltd. (http://www.biberltd.com)
 * 
 * version:         2.0.4
 * last update:     08 December 2012
 * author:          Can Berkol
 * copyright:       Biber Ltd. (http://biberltd.com)
 * 
 * description:
 * This plugin enables you to replace occurences of strings with a new value
 * that are defined by you.
 * 
 * license:
 * 
 * This license is a legal agreement between you and Biber Bilisim Teknolojileri ve Dis Tic. Ltd. Sti
 * (Biber Ltd.) for the use of our add-ons and other software (the “Software”). 
 * By downloading any Biber Ltd. software you agree to be bound by the terms and conditions of this 
 * license. Biber Ltd. reserves the right to alter this agreement at any time, for any reason, without 
 * notice.
 * 
 * PERMITTED USE
 * 
 * One license grants the right to perform one installation of the Software. Each additional 
 * installation of the Software requires an additional purchased license. Development systems 
 * are not included in these restrictions, you may install the Software on development systems 
 * as needed.
 * 
 * RESTRICTIONS
 * 
 * Unless you have been granted prior, written consent from Biber Ltd., you may not:
 * 
 *      Reproduce, distribute, or transfer the Software, or portions thereof, to any third party.
 *      Sell, rent, lease, assign, or sublet the Software or portions thereof.
 *      Grant rights to any other person.
 *      Use the Software in violation of any laws of the Republic of Turkiye or international 
 *      law or regulation.
 * 
 * DISPLAY OF COPYRIGHT NOTICES
 * 
 * All copyright and proprietary notices and logos in the Control Panel and within the Software 
 * files must remain intact.
 * 
 * MAKING COPIES
 * 
 * You may make copies of the Software for back-up purposes, provided that you reproduce the 
 * Software in its original form and with all proprietary notices on the back-up copy.
 * 
 * SOFTWARED MODIFICIATIONS
 * 
 * You may alter, modify, or extend the Software for your own use, or commission a third-party 
 * to perform modifications for you, but you may not resell, redistribute or transfer 
 * the modified or derivative version without prior written consent from Biber Ltd. Components 
 * from the Software may not be extracted and used in other programs without prior written consent 
 * from Biber Ltd.
 * 
 * TECHNIOCAL SUPPORT
 * 
 * Technical support is available through emailing Software Support at support@biberltd.com. 
 * Biber Ltd. does not provide direct phone support. No representations or guarantees are made 
 * regarding the response time in which support questions are answered.
 * 
 * REFUNDS
 * 
 * Biber Ltd. offers refunds on software within 15 days of purchase. All transaction fees will 
 * be deducted before refund is applied. Send a refund request for assistance.
 * 
 * INDEMNITY
 * 
 * You agree to indemnify and hold harmless Biber Ltd. for any third-party claims, actions or suits, 
 * as well as any related expenses, liabilities, damages, settlements or fees arising from your use 
 * or misuse of the Software, or a violation of any terms of this license.
 * 
 * DISCLAIMER OF WARRANTY
 * 
 * THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESSED OR IMPLIED, INCLUDING, 
 * BUT NOT LIMITED TO, WARRANTIES OF QUALITY, PERFORMANCE, NON-INFRINGEMENT, MERCHANTABILITY, OR 
 * FITNESS FOR A PARTICULAR PURPOSE.  FURTHER, BIBER LTD DOES NOT WARRANT THAT THE SOFTWARE OR 
 * ANY RELATED SERVICE WILL ALWAYS BE AVAILABLE.
 * 
 * LIMITIATIONS OF LIBRARY
 * 
 * YOU ASSUME ALL RISK ASSOCIATED WITH THE INSTALLATION AND USE OF THE SOFTWARE. IN NO EVENT SHALL 
 * THE AUTHORS OR COPYRIGHT HOLDERS OF THE SOFTWARE BE LIABLE FOR CLAIMS, DAMAGES OR OTHER LIABILITY
 *  ARISING FROM, OUT OF, OR IN CONNECTION WITH THE SOFTWARE. LICENSE HOLDERS ARE SOLELY RESPONSIBLE 
 * FOR DETERMINING THE APPROPRIATENESS OF USE AND ASSUME ALL RISKS ASSOCIATED WITH ITS USE, INCLUDING 
 * BUT NOT LIMITED TO THE RISKS OF PROGRAM ERRORS, DAMAGE TO EQUIPMENT, LOSS OF DATA OR SOFTWARE 
 * PROGRAMS, OR UNAVAILABILITY OR INTERRUPTION OF OPERATIONS.
 * 
 * 
 * It is hereby understood that the downloading of any Biber Ltd.software automatically binds you to 
 * all the terms of this Software License Agreement.
 * 
 */ 

if ( ! defined('BASEPATH')) exit('No direct script access allowed');


$plugin_info = array(
  'pi_name'     => 'Advanced Prev Next Entry',
  'pi_version'  => '2.0.4',
  'pi_author'   => 'Biber Ltd',
  'pi_author_url'=>'http://biberltd.com/wiki/English:bbr_prevnext_entry/',
  'pi_description'=>'Used to grab previous or next entries\' details.',
  'pi_usage' => Bbr_prevnext_entry::usage()
);

class Bbr_prevnext_entry {
    public $return_data = '';
    public $site_id = 1;    
    public $current_entry_id = '';
    public $current_url_title = ''; 
    public $channel_id = '';
    public $channel_name = '';
    public $category = '';
    public $category_group = '';
    public $orderby = 'entry_date';
    public $sort = 'asc';
    public $status = '';
    public $show_expired = 'no';
    public $show_future_entries = 'no';
    public $return_fields = 'url_title|entry_id';
    public $search = '';
    public $cycle = 'yes';
    public $reverse_order = 'no';
    private $empty_next = false;
    private $empty_prev = false;
    private $prfx;
    private $standard_fields;
    private $field_type;
    private $field_content_type = 'numeric';

    /**
     * Constructor
     * 
     * @since       1.0.0
     * @date        28.02.2012
     * @author      Can Berkol
     * 
     * @version     2.0.0
     * 
     * PHP 5.0 & above
     */ 
    public function __construct(){
        $this->EE =& get_instance();
        $this->prfx = $this->EE->db->dbprefix;
        $this->standard_fields = array('entry_id', 'site_id', 'channel_id', 'author_id', 'pentry_id', 
                                'forum_topic_id', 'ip_address', 'title', 'url_title', 'status', 
                                'versioning_enabled', 'view_count_one', 'view_count_two', 
                                'view_count_three', 'view_count_four', 'allow_comments', 'sticky', 
                                'entry_date', 'dst_enabled', 'year', 'month', 'day', 'expiration_date',
                                'comment_expiration_date', 'edit_date', 'recent_comment_date',
                                'comment_total');
        /**
         * Grap all supplied parameters.
         */ 
        $supplied_params = array();
        foreach($this->EE->TMPL->tag_data as $tagdata){
            if($tagdata['class'] == 'bbr_prevnext_entry'){
                $supplied_params = $tagdata['params'];
            }
        }
        
        /**
         * Now set parameters to object.
         */ 
        foreach($supplied_params as $key => $value){
            switch($key){
                /**
                 * if both supplied, then channel_id will be ignored 
                 */
                case 'channel_id':
                case 'channel_name':
                case 'category':
                case 'category_group':
                case 'current_entry_id':
                case 'current_url_title':
                case 'show_expired':
                case 'show_future_entries':
                case 'orderby':
                case 'sort':
                case 'status':
                case 'cycle':
                case 'reverse_order':
                case 'site_id':
                    $this->$key = $value;
                    break;
                /** search parameter requires special care */ 
                case strncmp($key, 'search:', 7) === 0:
                    $field = explode('search:', $key);
                    $this->search = $field[1].'*'.$value;
                    break;
                /** url_title, title, and entry_id fields are returned by default for convenience */
                case 'return_fields':
                    $this->return_fields = $value;
                    if(substr_count($this->return_fields, 'url_title') === 0){
                        $this->return_fields = 'url_title|'.$this->return_fields;
                    }
                    if(substr_count($this->return_fields, 'entry_id') === 0){
                        $this->return_fields = 'entry_id|'.$this->return_fields;
                    }
                    if(substr_count($this->return_fields, 'title') === 0){
                        $this->return_fields = 'title|'.$this->return_fields;
                    }
                    break;
            }
        }
        if($this->orderby == 'entry_date' || $this->orderby == 'expiration_date' || $this->orderby == 'edit_date' 
            || $this->orderby == 'comment_expiration_date' || $this->orderby == 'recent_comment_date'){
            $this->field_type = 'date';
        }
        else if($this->orderby == 'entry_id' || $this->orderby == 'site_id' || $this->orderby == 'channel_id' 
            || $this->orderby == 'author_id' || $this->orderby == 'pentry_id' || $this->orderby == 'forum_topic_id' 
            || $this->orderby == 'view_count_one' || $this->orderby == 'view_count_two' 
            || $this->orderby == 'view_count_three' || $this->orderby == 'view_count_four' || $this->orderby == 'year' 
            || $this->orderby == 'day' || $this->orderby == 'month' || $this->orderby == 'comment_total'){
            $this->field_type = 'numeric';
        }
        
        /**
         * It's time to run the main engine.
         */ 
        $this->return_data = $this->get_details();
    }
    function Bbr_prevnext_entry(){
        $this->__construct();
    }
    /**
     * Destructor
     * 
     * @since       1.0.0
     * @date        16.07.2010
     * @author      Can Berkol
     * 
     * PHP 5.0 & above
     */ 
    public function __destructor(){
        foreach($this as $property => $value){
            $this->$property = null;
        }
    }
    /**
     * get_details
     * 
     * @since       1.0.0
     * @date        28.02.2012
     * @author      Can Berkol
     * 
     * @version     2.0.3
     * 
     * Get finished html parsing.
     */ 
    private function get_details(){
       /**
        * Read tagdata for further modifications.
        */  
       $tagdata = $this->EE->TMPL->tagdata;
       /**
        * Let's grab all the things that are absolutly necessary
        * 
        * channel_name parameter preceeds channel_id parameter and
        * 
        * current_url_title parameter preceeds current_url_id parameter.
        */
       if(!empty($this->channel_name)){
            $this->channel_id = $this->get_channel_id($this->channel_name, $this->site_id);
       }
       if(!empty($this->current_url_title)){
            $this->current_entry_id = $this->get_entry_id($this->current_url_title, $this->channel_id);
       }
       if(empty($this->current_entry_id)){
            /** if current entry's id cannot be read then return tagdata as is */
            return $tagdata;
       }
       /**
        * Build category filter.
        */ 
       $filter_by = array();
       if(!empty($this->category) && strtolower($this->category) != "uncategorized"){
            $filter_by['category'] = $this->prepare_cat_filter($this->category);
       }
       /**
        * Build category group filter.
        */ 
       if(!empty($this->category_group)){
            $filter_by['category_group'] = $this->prepare_catgroup_filter($this->category_group);
       }
       /**
        * Build channel filter.
        */
       if(!empty($this->channel_id)){
            $filter_by['channel'] = $this->prepare_channel_filter($this->channel_id);
       }
       /**
        * Build site filter.
        */
       if(!empty($this->site_id)){
            $filter_by['site'] = $this->prepare_site_filter($this->site_id);
       }
       /**
        * Build status filter.
        */
       if(!empty($this->status)){
            $filter_by['status'] = $this->prepare_status_filter($this->status);
       }
       /**
        * Build search filter.
        */
       if(!empty($this->search)){
            $filter_by['search'] = $this->prepare_search_filter($this->search);
       }
       /**
        * Build expiration filter.
        */
       if(!empty($this->show_expired)){
            $filter_by['expired'] = $this->prepare_expired_filter($this->show_expired);
       }
       /**
        * Build show future entries filter.
        */
       if(!empty($this->show_future_entries)){
            $filter_by['future'] = $this->prepare_future_filter($this->show_future_entries);
       }
       /**
        * Build fields to select.
        */
       $fields_to_select = $this->prepare_fields_to_select($this->return_fields, $this->standard_fields);
       /**
        * Build order by.
        */
       $order_by = $this->prepare_order_by($this->orderby, $this->sort);

       $entries = $this->load_entries($filter_by, $order_by);

       unset($filter_by['category'], $filter_by['category_group']);
       if(strtolower($this->category) == 'uncategorized'){
             $categories = $this->load_categories();
             $filter_by['category'] = ' ecp.cat_id IN ('.implode(',', $categories).') ';
             $all_entries = $this->load_entries($filter_by, $order_by);
             $entries = array_diff($entries, $all_entries);
       }

       $curr_entry = $this->current($fields_to_select, $entries);
       $next_entry = $this->next($fields_to_select, $entries);
       $prev_entry = $this->prev($fields_to_select, $entries);
       /** Now that we are done with entries, we can free our memory */
       unset($entries);
       /**
        * If reversed swap next with previous
        */ 
       if($this->reverse_order == 'yes'){
            $tmp_entry = $next_entry;
            $next_entry = $prev_entry;
            $prev_entry = $tmp_entry;
            unset($tmp_entry);
       }
       /**
        * Prepare the tagdata
        */ 
       $exploded = explode('|', $this->return_fields);
       $tags_to_replace = array();
       $tag_pairs = array();
       foreach($exploded as $tag_prep){
            $tp_check = explode(':', $tag_prep);
            if(count($tp_check) > 1){
                $tag_prep = $tp_check[0];
                $tag_pairs[$tag_prep][] = $tp_check[1]; 
            }
            $tags_to_replace[] = '{curr_'.$tag_prep.'}';
            $tags_to_replace[] = '{prev_'.$tag_prep.'}';
            $tags_to_replace[] = '{next_'.$tag_prep.'}';
       }
       $tags_to_replace[] = '{empty_next}';
       $tags_to_replace[] = '{empty_prev}';
       foreach($tags_to_replace as $tag){
            $sanitized_tag = substr($tag, 6);
            $sanitized_tag = rtrim($sanitized_tag, '}');
            switch($tag){
                case '{empty_next}':
                    if(!$this->empty_next){
                        $tagdata = str_replace($tag, 'no', $tagdata);
                    }
                    else{
                        $tagdata = str_replace($tag, 'yes', $tagdata);
                    }
                    break;
                case '{empty_prev}':
                    if(!$this->empty_prev){
                        $tagdata = str_replace($tag, 'no', $tagdata);
                    }
                    else{
                        $tagdata = str_replace($tag, 'yes', $tagdata);
                    }
                    break;
                case strncmp($tag, '{curr_', 6) === 0:
                    if(isset($curr_entry->$sanitized_tag)){
                        if(is_array($curr_entry->$sanitized_tag)){
                            $search_tag = 'curr_'.$sanitized_tag;
                            preg_match("/".LD.$search_tag.RD."(.*?)".LD.'\/'.$search_tag.RD."/s", $tagdata, $match);
                            $tp_string = '';
                            if(count($match) > 0){
                                $to_be_replaced = $match[1];
                                /** Support for {switch="|"}*/
                                $alternate = array();
                                preg_match("/".LD."switch\s*\=\s*\"(.*?)\"".RD."/s", $to_be_replaced, $switch_match);
                                if(count($switch_match) > 0){
                                    $alternate = explode('|', $switch_match[1]);
                                }
                                $count = 1;
                                $alternate_size = count($alternate);
                                $alternate_count = 0;
                                /** Now replace tag pair tags. */
                                foreach($curr_entry->$sanitized_tag as $tag => $data){
                                    $tag = '{curr_'.$tag.'}';
                                    foreach($data as $value){
                                        $tmp_string = str_replace($tag, $value, $to_be_replaced); 
                                        $tp_string .= $tmp_string;
                                        if($alternate_size > 0 && $alternate_count < $alternate_size){
                                            $tp_string = preg_replace("/".LD."switch\s*\=\s*\"(.*?)\"".RD."/s", $alternate[$alternate_count], $tp_string);
                                            $alternate_count++;
                                        }
                                        else if ($alternate_size > 0){
                                            $alternate_count = 0;
                                            $tp_string = preg_replace("/".LD."switch\s*\=\s*\"(.*?)\"".RD."/s", $alternate[$alternate_count], $tp_string);
                                            $alternate_count++;
                                        }
                                        $count++;
                                    }
                                }
                            }
                            $tagdata = preg_replace("/".LD.$search_tag.RD."(.*?)".LD.'\/'.$search_tag.RD."/s", $tp_string, $tagdata);
                        }
                        else{
                            $tagdata = str_replace($tag, $curr_entry->$sanitized_tag, $tagdata);
                        }
                    }
                    else{
                        $tagdata = str_replace($tag, '', $tagdata);
                    }
                    break;
                case strncmp($tag, '{prev_', 6) === 0:
                    if(isset($prev_entry->$sanitized_tag)){
                        if(is_array($prev_entry->$sanitized_tag)){
                            $search_tag = 'prev'.$sanitized_tag;
                            preg_match("/".LD.$search_tag.RD."(.*?)".LD.'\/'.$search_tag.RD."/s", $tagdata, $match);
                            $tp_string = '';
                            if(count($match) > 0){
                                $to_be_replaced = $match[1];
                                /** Support for {switch="|"}*/
                                $alternate = array();
                                preg_match("/".LD."switch\s*\=\s*\"(.*?)\"".RD."/s", $to_be_replaced, $switch_match);
                                if(count($switch_match) > 0){
                                    $alternate = explode('|', $switch_match[1]);
                                }
                                $count = 1;
                                $alternate_size = count($alternate);
                                $alternate_count = 0;
                                /** Now replace tag pair tags. */
                                foreach($prev_entry->$sanitized_tag as $tag => $data){
                                    $tag = '{prev_'.$tag.'}';
                                    foreach($data as $value){
                                        $tmp_string = str_replace($tag, $value, $to_be_replaced); 
                                        $tp_string .= $tmp_string;
                                        if($alternate_size > 0 && $alternate_count < $alternate_size){
                                            $tp_string = preg_replace("/".LD."switch\s*\=\s*\"(.*?)\"".RD."/s", $alternate[$alternate_count], $tp_string);
                                            $alternate_count++;
                                        }
                                        else if ($alternate_size > 0){
                                            $alternate_count = 0;
                                            $tp_string = preg_replace("/".LD."switch\s*\=\s*\"(.*?)\"".RD."/s", $alternate[$alternate_count], $tp_string);
                                            $alternate_count++;
                                        }
                                        $count++;
                                    }
                                }
                            }
                            
                            $tagdata = preg_replace("/".LD.$search_tag.RD."(.*?)".LD.'\/'.$search_tag.RD."/s", $tp_string, $tagdata);
                        }
                        else{
                            $tagdata = str_replace($tag, $prev_entry->$sanitized_tag, $tagdata);
                        }
                    }
                    else{
                        $tagdata = str_replace($tag, '', $tagdata);
                    }
                    break;
                case strncmp($tag, '{next_', 6) === 0:
                    if(isset($next_entry->$sanitized_tag)){
                        if(is_array($next_entry->$sanitized_tag)){
                            $search_tag = 'next_'.$sanitized_tag;
                            preg_match("/".LD.$search_tag.RD."(.*?)".LD.'\/'.$search_tag.RD."/s", $tagdata, $match);
                            $tp_string = '';
                            if(count($match) > 0){
                                $to_be_replaced = $match[1];
                                /** Support for {switch="|"}*/
                                $alternate = array();
                                preg_match("/".LD."switch\s*\=\s*\"(.*?)\"".RD."/s", $to_be_replaced, $switch_match);
                                if(count($switch_match) > 0){
                                    $alternate = explode('|', $switch_match[1]);
                                }
                                $count = 1;
                                $alternate_size = count($alternate);
                                $alternate_count = 0;
                                /** Now replace tag pair tags. */
                                foreach($curr_entry->$sanitized_tag as $tag => $data){
                                    $tag = '{next_'.$tag.'}';
                                    foreach($data as $value){
                                        $tmp_string = str_replace($tag, $value, $to_be_replaced); 
                                        $tp_string .= $tmp_string;
                                        if($alternate_size > 0 && $alternate_count < $alternate_size){
                                            $tp_string = preg_replace("/".LD."switch\s*\=\s*\"(.*?)\"".RD."/s", $alternate[$alternate_count], $tp_string);
                                            $alternate_count++;
                                        }
                                        else if ($alternate_size > 0){
                                            $alternate_count = 0;
                                            $tp_string = preg_replace("/".LD."switch\s*\=\s*\"(.*?)\"".RD."/s", $alternate[$alternate_count], $tp_string);
                                            $alternate_count++;
                                        }
                                        $count++;
                                    }
                                }
                            }  
                            $tagdata = preg_replace("/".LD.$search_tag.RD."(.*?)".LD.'\/'.$search_tag.RD."/s", $tp_string, $tagdata);
                        }
                        else{
                            $tagdata = str_replace($tag, $next_entry->$sanitized_tag, $tagdata);
                        }
                    }
                    else{
                        if(!$next_entry){
                            $tagdata = str_replace($tag, '', $tagdata);
                        }
                        else{
                            $tagdata = str_replace($tag, '', $tagdata);
                        }
                        
                    }
                    break;
            }
       }
       return $tagdata;
    }
    /**
     * current
     * 
     * @since       1.0.0
     * @date        28.12.2012
     * @author      Can Berkol
     * 
     * Gets the current entry.
     * 
     * @version     2.0.0
     * 
     * @param       string      $fields_to_select
     * 
     * @return      object
     */ 
    private function current($fields_to_select){
        return $this->load_entry($this->current_entry_id, $fields_to_select);
    }
    /**
     * load_entry
     * 
     * @since       2.0.0
     * @date        28.12.2012
     * @author      Can Berkol
     * 
     * Loads requested entry with its selected fields
     * 
     * @param       integer     $entry_id
     * @param       string      $fields_to_select
     * 
     * @return      object
     */ 
    private function load_entry($entry_id, $fields_to_select = 'ect.url_title AS url_title, ect.title AS title'){
        if(!is_numeric($entry_id)){
            return FALSE;
        }
        $query = 'SELECT '.$fields_to_select
                    .' FROM '.$this->prfx.'channel_titles AS ect'
                    .' INNER JOIN '.$this->prfx.'channel_data AS ecd ON ect.entry_id = ecd.entry_id'
                    .' WHERE ect.entry_id = '.$entry_id;
                    
        $result = $this->EE->db->query($query);
        if($result->num_rows() != 1){
            return FALSE;
        }
        $entry = new stdClass();
        $fields = explode('|', $this->return_fields);
        foreach($fields as $field){
            /**
             * Third party field type support
             */ 
            $tp_check = explode(':', $field);
            if(count($tp_check) > 1){
                $field = $tp_check[0];
                $tp_field = $tp_check[1];
                $sort = 'asc';
                if(isset($tp_check[2])){
                    $sort = $tp_check[2];
                }
                $field_id = $this->get_field_id($field, $this->site_id);
                $field_type = $this->get_field_type($field_id);
                switch($field_type){
                    /** Matrix support */
                    case 'matrix':
                        $tp_field_value = $this->get_matrix_data($field_id, $tp_field, $entry_id, $tp_field, $sort);
                        break;
                }
                $entry->$field = $tp_field_value;                
            }
            else{
                $entry->$field = $result->row($field);
            }
        }
        return $entry;
    }
    /**
     * load_entries
     * 
     * @since       2.0.0
     * @date        28.12.2012
     * @author      Can Berkol
     * 
     * Loads set of entries (only their ids) based on given filter and order.
     * 
     * @param       array       $filter_by
     * @param       string      $order_by
     * 
     * @return      array
     */ 
    private function load_entries($filter_by, $order_by){
        /**
         * start with building the necessary query.
         */ 
        $query = 'SELECT DISTINCT(ect.entry_id) AS entry_id, ect.url_title AS url_title FROM '.$this->prfx.'channel_titles AS ect '
                         .'INNER JOIN ';
        $join_std = ' ON ecd.entry_id = ect.entry_id';
        $join_cat = '';
        $join_cat_group = '';
        $filter_available = FALSE;
        if(count($filter_by) > 0){
            $filter_available = TRUE;
        }
        if(isset($filter_by['category']) && isset($filter_by['category_group'])){
            /**
             * if category filter is set we will ignore category group filter.
             */ 
             unset($filter_by['category_group']);
        }
        /** build the join to filter by category */
        if(isset($filter_by['category'])){
            $join_cat = '('.$this->prfx.'channel_data AS ecd '
                            .'INNER JOIN '.$this->prfx.'category_posts AS ecp'
                            .' ON ecp.entry_id = ecd.entry_id) ';
        }
        /** build the join filter by category group */
        else if(isset($filter_by['category_group']) && !isset($filter_by['category'])){
            $join_cat_group = '('.$this->prfx.'channel_data AS ecd '
                            .'INNER JOIN ('.$this->prfx.'category_posts AS ecp '
                            .'INNER JOIN '.$this->prfx.'categories AS ec '
                            .'ON ec.cat_id = ecp.cat_id) '
                            .'ON ecp.entry_id = ecd.entry_id) ';
        }
        else{
            $query .= $this->prfx.'channel_data AS ecd';
        }
        $query .= $join_cat.$join_cat_group.$join_std;
        if(count($filter_by) > 0){
          $query .= ' WHERE ';
        }
        if($filter_available){
            foreach($filter_by as $key => $value){
                $query .= $value.' AND';
            }
            $query = rtrim($query, ' AND');
            
        }
        $query .= $order_by.'';
        $result = $this->EE->db->query($query);
     //    echo $query.'<br><br>';
        $entries = array();
      /**
         *  if there is no result
         **/
        if($result->num_rows() < 1){
            return $entries;
        }
        foreach($result->result_array() as $row){
            $entries[] = $row['entry_id'];
        }
        return $entries;
    }
    /**
     * load_categories
     * 
     * @since       2.1.3
     * @date        08.12.2012
     * @author      Can Berkol
     * 
     * Loads set of categories (only their ids) based on given filter and order.
     * 
     * @param       array       $filter_by
     * @param       string      $order_by
     * 
     * @return      array
     */ 
    private function load_categories(){
        /**
         * start with building the necessary query.
         */ 
        $query = 'SELECT cat_id FROM '.$this->prfx.'categories';
        $result = $this->EE->db->query($query);
        $categories = array();
      /**
         *  if there is no result
         **/
        if($result->num_rows() < 1){
            return $entries;
        }
        foreach($result->result_array() as $row){
            $categories[] = $row['cat_id'];
        }
        return $categories;
    }
    /**
     * next
     * 
     * @since       1.0.0
     * @date        29.02.2012
     * @author      Can Berkol
     * 
     * @version     2.0.0
     * 
     * Get the next entry.
     */ 
    private function next($fields_to_select, $entries){
        /**
         * Get the keys of current element.
         */ 
        $key['first'] = 0;
        $key['last'] = count($entries) - 1;
        $key['current'] = array_search($this->current_entry_id, $entries);
        $key['next'] = $key['current'] + 1;
        $key['prev'] = $key['current'] - 1;
        /**
         * Does next entry exist?
         */ 
        if(!isset($entries[$key['next']])){
            /**
             * If NOT, do we want to cycle?
             */ 
            $this->empty_next = true;
            if($this->cycle == 'yes'){
                /**
                 * If yes set next to first entry
                 */ 
               $key['next'] = $key['first'];
            }
        }
        /**
         * Now that we know which entry to grab..
         */ 
        if(isset($entries[$key['next']])){
            return $this->load_entry($entries[$key['next']], $fields_to_select);
        }
        else{
            return FALSE;
        }
        
    }
   /**
     * prev
     * 
     * @since       1.0.0
     * @date        29.02.2012
     * @author      Can Berkol
     * 
     * @version     2.0.0
     * 
     * Get the prev entry.
     */ 
    private function prev($fields_to_select, $entries){
        /**
         * Get the keys of current element.
         */ 
        $key['first'] = 0;
        $key['last'] = count($entries) - 1;
        $key['current'] = array_search($this->current_entry_id, $entries);
        $key['next'] = $key['current'] + 1;
        $key['prev'] = $key['current'] - 1;
        /**
         * Does next entry exist?
         */ 
        if(!isset($entries[$key['prev']])){
            /**
             * If NOT, do we want to cycle?
             */ 
            $this->empty_prev = true;
            if($this->cycle == 'yes'){
                /**
                 * If yes set next to first entry
                 */ 
               $key['prev'] = $key['last'];
            }
        }
        /**
         * Now that we know which entry to grab..
         */ 
        if(isset($entries[$key['prev']])){
            return $this->load_entry($entries[$key['prev']], $fields_to_select);
        }
        else{
            return FALSE;
        }
    }
    /**
     * get_entry_id
     * 
     * @since       1.0.0
     * @date        28.12.2010
     * @author      Can Berkol
     * 
     * Gets the current entry id by its title.
     * 
     * @param       string      $url_title
     * @param       int         $channel_id        optional
     * 
     * @return      string
     */ 
    private function get_entry_id($url_title, $channel_id){
        $query = 'SELECT ct.entry_id AS entry_id FROM '
                    .$this->prfx.'channel_titles AS ct WHERE ct.url_title = "'.$url_title
                    .'" AND ct.channel_id = '.$channel_id.' LIMIT 1';
        $result = $this->EE->db->query($query);
        if($result->num_rows() > 0){
            return $result->row('entry_id');
        }
        return '';
    }
    /**
     * get_matrix_data
     * 
     * @since       2.0.0
     * @date        29.12.2012
     * @author      Can Berkol
     * 
     * Gets matrix data.
     * 
     * @param       integer     $entry_id
     * @param       string      $fields_to_select
     * 
     * @return      string
     */ 
    private function get_matrix_data($field_id, $field_name, $entry_id, $tp_field, $sort = 'asc'){
        /**
         * Get Matrix Column ID
         */ 
        $query = 'SELECT col_id FROM '.$this->prfx.'matrix_cols WHERE field_id = '.$field_id.' AND site_id = '.$this->site_id.' AND col_name = "'.$field_name.'" LIMIT 1';
        $result = $this->EE->db->query($query);
        $col_id = $result->row('col_id');
        /**
         * Now get the data
         */ 
        $query = 'SELECT col_id_'.$col_id.' FROM '.$this->prfx.'matrix_data WHERE site_id = '.$this->site_id.' AND field_id = '.$field_id.' AND entry_id = '.$entry_id
                 .' ORDER BY row_order '.strtoupper($sort);
        $result = $this->EE->db->query($query);
        $matrix_data = array();
        if($result->num_rows() < 1){
            return $matrix_data;
        }
        $data = array();
        foreach($result->result_array() as $row){
            $data[] = $row['col_id_'.$col_id];
        }
        
        $matrix_data[$tp_field] = $data;
        return $matrix_data;
    }
    /**
     * get_channel_id
     * 
     * @since       1.0.0
     * @date        28.12.2010
     * @author      Can Berkol
     * 
     * Gets the channel id by its name.
     * 
     * @param       string      $channel_name
     * @param       int         $site_id        optional
     * 
     * @return      string
     */ 
    private function get_channel_id($channel_name, $site_id = 1){
        $query = 'SELECT c.channel_id AS channel_id FROM '
                    .$this->prfx.'channels AS c WHERE c.channel_name = "'.$channel_name.'" LIMIT 1';
        $result = $this->EE->db->query($query);
        if($result->num_rows() > 0){
            return $result->row('channel_id');
        }
        return '';
    }
    /**
     * prepare_cat_filter
     * 
     * @since       1.0.0
     * @date        28.12.2010
     * @author      Can Berkol
     * 
     * Prepares category filter.
     * 
     * @param       string      $categories
     * 
     * @return      string
     */ 
    private function prepare_cat_filter($categories){
        if($categories == "UNCATEGORIZED"){
          $filter = '';
          return $filter;
        }
        $negation = explode(' ', $categories);
        $equation = ' = ';
        $filter = '';
        if(strncmp(strtolower($categories), 'not ', 4) === 0){
            $equation = ' != ';
            $categories = substr($categories, 4);
        }
        $or = explode('|', $categories);
        $and = explode('&&', $categories);
        if(count($or) > 1 && count($and) > 1){
            if($this->debug_mode == 'on'){
                return 'BBRxPNEx0003 :: You cannot combine | and &.'; 
            }
            return $filter;
        }
        if(count($or) == 1 && count($and) == 1){
            $filter = ' ecp.cat_id'.$equation.$or[0];
        }
        if(count($or) > 1){
            foreach($or as $cat_id){
                $filter .= 'ecp.cat_id'.$equation.$cat_id.' OR ';
            }
            $filter = ' ('.rtrim($filter, ' OR ').')';
        }
        if(count($and) > 1){
            foreach($and as $cat_id){
                $filter .= 'ecp.cat_id'.$equation.$cat_id.' AND ';
            }
            $filter = ' ('.rtrim($filter, ' AND ').')';
        }
        return $filter;
    }
    /**
     * prepare_catgroup_filter
     * 
     * @since       1.0.0
     * @date        17.11.2010
     * @author      Can Berkol
     * 
     * Prepares category group filter.
     * 
     * @param       string      $categorygroups
     * 
     * @return      string
     */ 
    private function prepare_catgroup_filter($categorygroups){
        $negation = explode(' ', $categorygroups);
        $equation = ' = ';
        $filter = '';
        if(strncmp(strtolower($categorygroups), 'not ', 4) === 0){
            $equation = ' != ';
            $categorygroups = substr($categorygroups, 4);
        }
        $or = explode('|', $categorygroups);
        $and = explode('&&', $categorygroups);
        if(count($or) > 1 && count($and) > 1){
            if($this->debug_mode == 'on'){
                return 'BBRxPNEx0003 :: You cannot combine | and &.'; 
            }
            return $filter;
        }
        if(count($or) == 1 && count($and) == 1){
            $filter = ' ec.group_id'.$equation.$or[0];
        }
        if(count($or) > 1){
            foreach($or as $group_id){
                $filter .= 'ec.group_id'.$equation.$group_id.' OR ';
            }
            $filter = ' ('.rtrim($filter, ' OR ').')';
        }
        if(count($and) > 1){
            foreach($and as $group_id){
                $filter .= 'ec.group_id'.$equation.$group_id.' AND ';
            }
            $filter = ' ('.rtrim($filter, ' AND ').')';
        }
        return $filter;
    }
    /**
     * prepare_channel_filter
     * 
     * @since       1.0.0
     * @date        29.12.2010
     * @author      Can Berkol
     * 
     * Prepares channel filter.
     * 
     * @param       int     channel_id
     * 
     * @return      string
     */ 
    private function prepare_channel_filter($channel_id){
        if(empty($channel_id) || !is_numeric($channel_id)){
            return '';
        }
        $filter = ' ect.channel_id = '.$channel_id;
        return $filter;
    }
    /**
     * prepare_site_filter
     * 
     * @since       1.0.0
     * @date        28.12.2010
     * @author      Can Berkol
     * 
     * Prepares site filter.
     * 
     * @param       int     $site_id
     * 
     * @return      string
     */ 
    private function prepare_site_filter($site_id){
        if(empty($site_id) || !is_numeric($site_id)){
            return '';
        }
        $filter = ' ect.site_id = '.$site_id;
        return $filter;
    }
    /**
     * prepare_status_filter
     * 
     * @since       1.0.0
     * @date        28.12.2010
     * @author      Can Berkol
     * 
     * Prepares status filter.
     * 
     * @param       string     $status
     * 
     * @return      string
     */ 
    private function prepare_status_filter($status){
        if(empty($status)){
            return '';
        }
        $eq = ' = ';
        if(strtolower(strncmp($status, 'not ', 4)) === 0){
            $eq = ' != ';
            $status = substr($status, 4);
        }
        $exploded = explode('|', $status);
        $filter = '';
        foreach($exploded as $a_status){
            $filter .= 'ect.status = "'.$a_status.'" OR ';
        }
        $filter = ' ('.rtrim($filter, 'OR ').')';
        return $filter;
    }
    /**
     * prepare_expired_filter
     * 
     * @since       1.0.0
     * @date        03.02.2011
     * @author      Can Berkol
     * 
     * Prepares expiration filter.
     * 
     * @param       string     $status
     * 
     * @return      string
     */ 
    private function prepare_expired_filter($expired){
        if(empty($expired)){
            return '';
        }
        $today = time();
        $eq = ' = ';
        switch($expired){
            case 'yes':
                $filter = '';
                break;
            case 'no':
                $filter = ' (ect.expiration_date = 0 OR ect.expiration_date > '.$today.') ';
        }
        return $filter;
    }
    /**
     * prepare_future_filter
     * 
     * @since       1.0.0
     * @date        03.02.2011
     * @author      Can Berkol
     * 
     * Prepares show future entries filter.
     * 
     * @param       string     $status
     * 
     * @return      string
     */ 
    private function prepare_future_filter($show_future){
        if(empty($show_future)){
            return '';
        }
        $today = time();
        $eq = ' = ';
        switch($show_future){
            case 'yes':
                $filter = '';
                break;
            case 'no':
                $filter = ' ect.entry_date <= '.$today;
        }
        return $filter;
    }
    /**
     * prepare_status_filter
     * 
     * @since       1.0.0
     * @date        14.02.2012
     * @author      Can Berkol
     * @since       1.2.0
     * @version     2.0.3
     * Prepares status filter.
     * 
     * @param       string     $search
     * 
     * @return      string
     */ 
    private function prepare_search_filter($search){
        if(empty($search)){
            return '';
        }
        $eq = ' = ';
        $wildcart = '';
        $exploded = explode('*', $search);
        $field_name = $exploded[0];
        
        $search = $exploded[1];
        if(strtolower(strncmp($search, 'not ', 4)) === 0){
            $eq = ' != ';
            $search = substr($search, 4);
        }
        /**
         * @since v 1.1.4
         * Support for IS_EMPTY
         */ 
        $is_empty_search = FALSE;
        if($search == 'IS_EMPTY'){
            $search = '';
            $is_empty_search = TRUE;
        }
        /** **** */
        if(strncmp($search, '=', 1) === 0 || strncmp($search, '>', 1) === 0 || strncmp($search, '<', 1) === 0){
            $search = substr($search, 1);           
        }
        else if(strncmp($search, '%', 1) === 0){
            $search = substr($search, 1);
            $wildcart = '%';
            $eq = ' LIKE ';
        }
        /**
         * @since v 1.1.4
         * Support for IS_EMPTY
         */ 
        if(!$is_empty_search && (empty($search) || !$search)){
            return '';
        }
        $and = explode('&&', $search);
        $or = explode('|', $search);
        $filter = '';
        /**
         * Get field id for use with query.
         */ 
        if(in_array($field_name, $this->standard_fields)){
            $field_id = 'std';
        }
        else{
            $field_id = $this->get_field_id($field_name, $this->site_id);
        }
        /** if a wrong field name is provided for search then return the empty filter string */
        if(empty($field_id)){
            return $filter;
        }
        /**
         * @since v 1.2.0
         * Playa Field Type Support
         * 
         * Playa field type support requires the following syntax:
         * 
         * search:playa_field_name:"search_term"
         * 
         * search term can be either a collection of integers (entry ids) or url_titles
         * 
         */ 
        $field_type =  $this->get_field_type($field_id);

        if(count($or) > 1 && count($and) > 1){
            return $filter;
        }
        if(count($or) == 1 && count($and) == 1){
            if($field_id == 'std'){
                $filter = ' ect.'.$field_name.' '.$eq.' "'.$wildcart.$or[0].$wildcart.'"';
            }
            else{
                /**
                 * @since v 1.2.0
                 * Playa Field Type Support
                 **/
                switch($field_type){
                    case 'playa':
                        if(is_numeric($or[0])){
                            $term = '['.$or[0].']';
                        }
                        else{
                            $term = $or[0];
                        }
                        $eq = ' LIKE ';
                        $term = '%'.$term.'%';
                        break;
                    default:
                        $term = $or[0];
                        break;
                }
                $filter = ' ecd.field_id_'.$field_id.' '.$eq.' "'.$wildcart.$term.$wildcart.'"';
            }
        }
        if(count($or) > 1){
            if($field_id == 'std'){
                foreach($or as $term){
                    $filter .= ' ect.'.$field_name.' '.$eq.' "'.$wildcart.$term.$wildcart.'" OR ';
                }
            }
            else{
                foreach($or as $term){
                    /**
                     * @since v 1.2.0
                     * Playa Field Type Support
                     **/
                    switch($field_type){
                        case 'playa':
                            if(is_numeric($term)){
                                $term = '['.$term.']';
                            }
                            $eq = ' LIKE ';
                            $term = '%'.$term.'%';
                            break;
                        default:
                            break;
                    }
                    $filter .= 'ecd.field_id_'.$field_id.' '.$eq.' "'.$wildcart.$term.$wildcart.'" OR ';
                }
            }
            $filter = ' ('.rtrim($filter, ' OR ').')';
        }
        if(count($and) > 1){
            if($field_id == 'std'){
                foreach($and as $term){
                    $filter .= ' ect.'.$field_name.' '.$eq.' "'.$wildcart.$term.$wildcart.'" AND ';;
                }
            }
            else{
                foreach($and as $term){
                    /**
                     * @since v 1.2.0
                     * Playa Field Type Support
                     **/
                    switch($field_type){
                        case 'playa':
                            if(is_numeric($term)){
                                $term = '['.$term.']';
                            }
                            $eq = ' LIKE ';
                            $term = '%'.$term.'%';
                            break;
                        default:
                            break;
                    }
                    $filter .= ' ecd.field_id_'.$field_id.' '.$eq.' "'.$wildcart.$term.$wildcart.'" AND ';;
                }
            }
            $filter = ' ('.rtrim($filter, ' AND ').')';
        }
        return $filter;
    }
    /**
     * get_field_id
     * 
     * @since       1.0.0
     * @date        29.12.2010
     * @author      Can Berkol
     * 
     * Used to read field id.
     * 
     * @param       string     $field_name
     * @param       int        $site_id 
     * 
     * @return      mixed
     */ 
    private function get_field_id($field_name, $site_id = 1){
        if(empty($site_id) || !is_numeric($site_id)){
            return '';
        }
        $query = 'SELECT field_id, field_type, field_content_type FROM '.$this->prfx.'channel_fields WHERE field_name = "'.$field_name.'" AND site_id = '.$site_id;
        $result = $this->EE->db->query($query);
        if($result->num_rows() > 0){
            // $this->field_type = $result->row('field_type');
            $this->field_content_type = $result->row('field_content_type');
            return $result->row('field_id');
        }
        return '';
    }
    /**
     * get_field_type
     * 
     * @since       1.2.0
     * @date        14.02.2010
     * @author      Can Berkol
     * 
     * Used to read field type.
     * 
     * @param       int     $field_id
     * 
     * @return      mixed
     */ 
    private function get_field_type($field_id){
        if(empty($field_id) || !is_numeric($field_id)){
            return '';
        }
        $query = 'SELECT field_type FROM '.$this->prfx.'channel_fields WHERE field_id = "'.$field_id.'"';
        $result = $this->EE->db->query($query);
        if($result->num_rows() > 0){
            return $result->row('field_type');
        }
        return '';
    }
    /**
     * prepare_fields_to_select
     * 
     * @since       1.0.0
     * @date        29.02.2012
     * @author      Can Berkol
     * 
     * @version     2.0.0       Matrix support added.
     * Prepares SELECT fields.
     * 
     * @param       string     $selected_fields
     * 
     * @return      string
     */ 
    private function prepare_fields_to_select($selected_fields, $as = TRUE){
        if(empty($selected_fields)){
            return ' ect.url_title AS url_title, ect.entry_id AS entry_id, ect.title AS title ';
        }
        $select = '';
        $exploded = explode('|', $selected_fields);
        foreach($exploded as $field){
            /**
             * Matrix support requires matrix_field:field_name notation
             */ 
            $tp_field_check = explode(':', $field);
            if(count($tp_field_check) > 1){
                $field = $tp_field_check[0];
            }
            if(in_array($field, $this->standard_fields)){
                if($as){
                    $select .= ' ect.'.$field.' AS '.$field.', ';
                }
                else{
                    $select .= ' ect.'.$field.', ';
                }
            }
            else{
                $field_id = $this->get_field_id($field, $this->site_id);
                if($as){
                    $select .= ' ecd.field_id_'.$field_id.' AS '.$field.', ';
                }
                else{
                    $select .= ' ecd.field_id_'.$field_id.',';
                }
            }
        }
        $select = rtrim($select, ', ');
        return $select;
    }
    /**
     * prepare_order_by
     * 
     * @since       1.0.0
     * @date        28.12.2012
     * @author      Can Berkol
     * 
     * @version     2.0.0
     * 
     * Prepares order by part of query.
     * 
     * @param       string     $field
     * @param       string     $sort
     * @param       string     $unique
     * 
     * @return      string
     */ 
    private function prepare_order_by($field, $sort){
        $order_by = ' ORDER BY ';
        if(in_array($field, $this->standard_fields)){
            $order_by .= 'ect.'.$field.' '.strtoupper($sort);
        }
        else{
            $custom_field = 'field_id_'.$this->get_field_id($field, $this->site_id);
            $order_by .= 'ecd.'.$custom_field.' '.strtoupper($sort);
        }
        return $order_by;
    }
    /**
     * usage
     * 
     * @since       1.0.0
     * @date        05.08.2010
     * @author      Can Berkol
     * 
     * Shows usage information in plugin control panel.
     */ 
    function usage(){
      ob_start(); 
      ?>
    This plugin helps you get the previous and next entry details sorted and filtered the way you want.
    
    Required Parameters:
    
    - current_url_title         This is the url title of the currently shown entry.
                                current_url_title = "just_an_entry"
    - current_entry_id          This is the entry id of the currently shown entry.
                                current_entry_id="322"
    CAUTION: You have to supply only one of the above parameters not both!
                        
    Optional Parameters:
    
    - category                  This is used to filter entries by categories.
                                category="1&&2" 
                                category="1|3|5"
                                category="not 1"
    - category_group            This is used to filter entries by category groups.
                                category_group="1&&2" 
                                category_group="1|3|5"
                                category_group="not 1"
    - channel_id                This is used to filter entries by channel id.
                                channel_id="1"
    - channel_name              This is used to filter entries by channel name.
                                channel_name="blog_entries"
    - cycle                     This parameter indicates if you want to cycle through entries when the last or first entry is currently being viewed.
                                i.e. If cycle is set to yes, when somebody visits the last entry, the next entry details are set to first entry's details.
                                cycle="yes"  ( -> DEFAULT VALUE)
                                cycle="no"
    - debug_mode                If set to "on" then developer's debug messages are shown.
                                debug_mode="on"
                                debug_mode="off" ( -> DEFAULT VALUE)
    - orderby                   This defines according to which column to sort the results. You can also use custom field names here.
                                orderby="entry_date"
    - return_fields             Names of the fields that you want to return. It also accepts custom fields but it does NOT support Relationship, Matrix, Playa or any other complex 3rd party fields.
                                return_fields="url_title|entry_id"
                                
                                For previous entry you need add prev_ and for next entry you need to add next_ prefix to get the output of the return fields.
                                
                                i.e. {prev_url_title}, {next_entry_id}
    - reverse_order             This is used to grab the next entry in place of previous and vice versa. It is a quick way to interchange the results of previous and next entries.
                                reverse_order="yes"
                                reverse_order="no" ( -> DEFAULT VALUE)
    - search                    This is used to filter your entries by complex searches. It mimics the functionality of the search tag of exp:channel_entries tag but accepts only one search parameter.
                                search:price="=3200"
                                search:price="=3200|1500"
                                search:price="not 3200"
                                search:price=">3200"
                                search:price="<3200"
                                search:name="%John"  Searches all names containing John. i.e. returns "Elvis John Jopkins, "John Hopkins" or "John"
    - show_expired              Filters entries by expiration status.
                                show_expired="yes"
                                show_expired="no" ( -> DEFAULT VALUE)
    - show_future_entries       If set to yes it will also get non-published entries in consideration.
                                show_future_entries="yes"
                                show_future_entries="no" ( -> DEFAULT VALUE)
    - site_id                   This will filter entries that belongs to a certain site if MSM is installed.
                                site_id="1"
    - sort                      This will define the sort order.
                                sort="asc" ( -> DEFAULT VALUE)
                                sort="desc"
    - status                    This will filter entries by their statuses.
                                status="open"
                                
    NOTES:
    
    category and category_group parameters cannot be used together. You need to supply either category or category_group parameters but not both!                                     
    
    channel_id and channel_name parameters cannot be used together. You need to supply either channel_name or channel_id parameters but not both!
    
    EXAMPLES:
        
{exp:bbr_prevnext_entry current_url_title="my_third_entry" category="3|5" search:name="%mich" channel_id="2" orderby="entry_date" sort="desc" return_fields="url_title" cycle="yes"}
				<a class="prev" href="{site_url}blog/{prev_url_title}/">Previous</a>
				<a class="next" href="{site_url}blog/{next_url_title}/">Next</a>
{/exp:bbr_prevnext_entry}
    
    Result:
    
    <a class="prev" href="http://yoursite.com/blog/my_second_entry/">Previous</a>
	<a class="next" href="http://yoursite.com/blog/my_fourth_entry/">Next</a>

    
      <?php
      $buffer = ob_get_contents();
    	
      ob_end_clean(); 
    
      return $buffer;
      }
      // END
}
/**
 * Change Log:
 * v 2.0.4
 * - Bux Fix: Category group NOT query error is fixed (this time for real?).
 * 
 * v 2.0.2
 * - Bux Fix: Category group NOT query error is fixed.
 *
 * v 2.0.1
 * - Bux Fix: There were duplicate entries in results. The result set now correctly returns distict elements.
 * 
 * v 2.0.0
 * - A complete rewrite of the prev-next engine. Works faster with less complicated DB queries.
 * - Problems with order by statement is fixed.
 * - Matrix support is added. Now you can directly output values of simple matrix fields directly from plugin.
 * 
 * v 1.2.0
 * - Added Playa field type support for search tag: currently only accepts entry id or url_title for searches.
 * - Various bug fixes on search parameter.
 * 
 * v 1.1.6
 * - Another infinite loop problem has been fixed.
 * 
 * v 1.1.5
 * - A bug is fixed that prevents entry title from being shown.
 * 
 * v 1.1.4
 * - Support for IS_EMPTY and not IS_EMPTY added.
 * 
 * v 1.1.3
 * - Infinite Loop bug has been fixed when there was only one entry in the result set.
 * 
 * v 1.1.1
 * - {empty_next} and {empty_prev} variables added that output yes or no.
 * 
 * v 1.1.0
 * - Search parameter now supports standard fields.
 * - Bug fixed that made the plugin ignore channel_id
 * - Bug fixed that kept prev and next links to work interchangably.
 * - Default sort mechanism by entry_date added for those fields that may have non-unique values.
 * 
 * v 1.0.1
 * - A bug is fixed that prevented sorting by custom fields.
 * 
 * v 1.0.0
 * - Initial Release.
 * 
 */ 
/* End of file pi.bbr_gettext.php */ 
/* Location: ./system/expressionengine/third_party/bbr_multilanguagesupport/pi.bbr_gettext.php */