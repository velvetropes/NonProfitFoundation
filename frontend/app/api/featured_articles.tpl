{exp:http_header content_type="application/json"}
{
{exp:channel:entries channel="carousels" dynamic="no" limit="1" disable="{global:param_disable_default}"}
    "mission_thumb" : "{home_mission_thumb}",
    "articles" : [
        {home_bot backspace="2"} {
            "id"                                : "{home_bot:entry_id}",
            "thumbnail_title"                   : "{exp:json_encode}{home_bot:title}{/exp:json_encode}",
            "thumbnail_image_url"               : "{home_bot:carousel_image}",
            "thumbnail_call_to_action_text"     : "{exp:json_encode}{home_bot:carousel_cta}{/exp:json_encode}",
            "panel_title"                       : "{exp:json_encode}{home_bot:carousel_panel_title}{/exp:json_encode}",
            "panel_image_url"                   : "{home_bot:carousel_panel_image}",
            "video_link_url"                    : "{home_bot:carousel_video_url}",
            "panel_call_to_action_text"         : "{home_bot:carousel_panel_cta}",
            "panel_call_to_action_link_url"     : "{home_bot:carousel_panel_link}",
            "body"                              : "{exp:json_encode}{exp:tagstripper:tagsToStrip tags='img'}{exp:eehive_hacksaw words="90"}{home_bot:carousel_body}{/exp:eehive_hacksaw}{/exp:tagstripper:tagsToStrip}{/exp:json_encode}"
          }, {/home_bot}
    ]
{/exp:channel:entries}
}