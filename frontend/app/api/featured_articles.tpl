{exp:http_header content_type="application/json"}[
    {exp:channel:entries channel="homepage_main_carousel" backspace="6"}
    {
      "id":"{entry_id}",
      "thumbnail_title":"{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{title}{/exp:low_replace}",
      "thumbnail_image_url":"{carousel_image}",
      "thumbnail_call_to_action_text":"{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{carousel_cta}{/exp:low_replace}",
      "panel_title":"{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{carousel_panel_title}{/exp:low_replace}",
      "panel_image_url":"{carousel_panel_image}",
      "video_link_url":"{carousel_video_url}",
      "panel_call_to_action_text":"{carousel_panel_cta}",
      "panel_call_to_action_link_url":"{carousel_panel_link}",
      "body":"{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{carousel_body}{/exp:low_replace}"
    },
    {/exp:channel:entries}
]

