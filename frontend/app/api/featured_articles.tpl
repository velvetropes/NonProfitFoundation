{exp:http_header content_type="application/json"}[
    {exp:channel:entries channel="homepage_main_carousel" backspace="6"}
    {
      "id":"{entry_id}",
      "date":"{operation_change_partnerships:date}",
      "thumbnail_image_url":"{operation_change_partnerships:image}",
      "thumbnail_title":"{operation_change_partnerships:title}",
      "link_cta":"{operation_change_partnerships:cta_text}",
      "link_url":"{operation_change_partnerships:url}",
      "thumbnail_title":"{title}",
      "thumbnail_image_url":"{carousel_image}",
      "thumbnail_call_to_action_text":"{carousel_cta}",
      "panel_title":"{carousel_panel_title}",
      "panel_image_url":"{carousel_panel_image}",
      "video_link_url":"{carousel_video_url}",
      "panel_call_to_action_text":"{carousel_panel_cta}",
      "panel_call_to_action_link_url":"{carousel_panel_link}",
      "body":"{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{carousel_body}{/exp:low_replace}"
    },
    {/exp:channel:entries}
]

