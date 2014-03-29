{exp:http_header content_type="application/json"}{
  "icons" : [
    {exp:channel:entries channel="homepage_map_categories" dynamic="no" disable="{global:param_disable_default}" backspace="2"} {
        "id"      : "jvm-{url_title}",
        "path"    : "{homepage_map_category_image}"
    }, {/exp:channel:entries}
  ], 

  "coords":[
    {exp:channel:entries channel="homepage_map_items" dynamic="no" disable="{global:param_disable_default}" backspace="2"}
    {
      "latLng"  : [{homepage_map_item_lat}, {homepage_map_item_lon}],
      "style"   : {
        "fill"  : "url('#jvm-{homepage_map_item_category:url_title}')",
        "stroke-width" : 0
      }
    }, {/exp:channel:entries}
   ],
  "meta_data":[
    {exp:channel:entries channel="homepage_map_items" backspace="2" dynamic="no" disable="{global:param_disable_default}"} {
      "title"             : "{exp:json_encode}{title}{/exp:json_encode}",
      "location"          : "{exp:json_encode}{homepage_map_item_location}{/exp:json_encode}",
      "text"              : "{exp:json_encode}{homepage_map_item_content}{/exp:json_encode}",
      "action_text"       : "{if homepage_map_item_cta_text}{exp:json_encode}{homepage_map_item_cta_text}{/exp:json_encode}{if:else}READ MORE{/if}",
      "thumbnail_url"     : "{homepage_map_item_image}",
      "action_target"     : "{homepage_map_item_cta_link}",
      "marker_type"       : "{homepage_map_item_category:url_title}"
    }, {/exp:channel:entries}
   ]
}
