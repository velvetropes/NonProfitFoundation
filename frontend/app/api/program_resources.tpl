{exp:http_header content_type="application/json"}[
  {exp:channel:entries channel="programs" dynamic="no" disable="{global:param_disable_default}"}{listen_carefully_additional_reso backspace="2"} {
    "id"                  : "{listen_carefully_additional_reso:row_id}",
    "date"                : "{listen_carefully_additional_reso:date format='%F %d%S %Y'}",
    "thumbnail_image_url" : "{listen_carefully_additional_reso:image}",
    "thumbnail_title"     : "{exp:json_encode}{listen_carefully_additional_reso:title}{/exp:json_encode}",
    "link_cta"            : "{listen_carefully_additional_reso:cta}",
    "link_url"            : "{listen_carefully_additional_reso:link}"
  }, {/listen_carefully_additional_reso}{/exp:channel:entries}
]
