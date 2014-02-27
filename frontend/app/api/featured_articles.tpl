{exp:http_header content_type="application/json"}[
    {exp:channel:entries channel="carousels" dynamic="no" limit="1" disable="{global:param_disable_default}"}

    {home_bot backspace="2"}
      {
        "id":"{home_bot:entry_id}",
        "thumbnail_title":"{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{exp:mah_eencode decode="yes"}{home_bot:title}{/exp:mah_eencode}{/exp:low_replace}",
        "thumbnail_image_url":"{home_bot:carousel_image}",
        "thumbnail_call_to_action_text":"{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{home_bot:carousel_cta}{/exp:low_replace}",
        "panel_title":"{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{home_bot:carousel_panel_title}{/exp:low_replace}",
        "panel_image_url":"{home_bot:carousel_panel_image}",
        "video_link_url":"{home_bot:carousel_video_url}",
        "panel_call_to_action_text":"{home_bot:carousel_panel_cta}",
        "panel_call_to_action_link_url":"{carousel_panel_link}",
        "body":"{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{home_bot:carousel_body}{/exp:low_replace}"
      }, {/home_bot}
    {/exp:channel:entries}
]