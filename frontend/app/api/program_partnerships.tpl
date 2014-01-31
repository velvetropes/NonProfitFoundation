{exp:http_header content_type="application/json"}[
    {exp:channel:entries channel="programs" backspace="6"}{operation_change_partnerships}
    {
      "id":"{operation_change_partnerships:row_id}",
      "date":"{operation_change_partnerships:date format='%F %d%S %Y'}",
      "thumbnail_image_url":"{operation_change_partnerships:image}",
      "thumbnail_title":"{operation_change_partnerships:title}",
      "link_cta":"{operation_change_partnerships:cta}",
      "link_url":"{operation_change_partnerships:link}"
    },
    {/operation_change_partnerships}{/exp:channel:entries}
]
