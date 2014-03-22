{exp:http_header content_type="application/json"}
{if segment_3 == "index" OR segment_3 == ""} [
    {exp:channel:entries channel="press_releases|media_mentions" dynamic="no" orderby="entry_date" sort="asc" backspace="2"} {
        "id"        : "{url_title}",
        "feed_url"  : "/api/{channel_name}/{url_title}",
        "title"     : "{exp:json_encode}{title}{/exp:json_encode}",
        
    
    {if channel_name == "press_releases"}
        "type"                  : "press_release",
        "rawdate"               : "{entry_date format='%U'}",
        "date"                  : "{entry_date format='%m/%d/%Y'}",
        "year"      : "{entry_date format='%Y'}",
        "detail_page"           : "true",
        "featured"              : "false",
        "header_image_url"      : "{press_release_image}",
        "logo_image_url"        : "",
        "quote"                 : "",
        "call_to_action_text"   : "{exp:json_encode}{title}{/exp:json_encode}",
        "call_to_action_link"   : "Read More",
        "video_link":""
    
    {if:else}
        "type"                  : "media_mention",
        "rawdate"               : "{media_mention_date format='%U'}",
        "date"                  : "{media_mention_date format='%m/%d/%Y'}",
        "year"                  : "{media_mention_date format='%Y'}",
        "detail_page"           : "{media_mention_detail_page}",
        "featured"              : "{media_mention_feature_carousel}",
        "header_image_url"      : "{media_mention_image}",
        "logo_image_url"        : "{media_mention_logo}",
        "quote"                 : "{exp:json_encode}{media_mention_quote}{/exp:json_encode}",
        "call_to_action_text"   : "{exp:json_encode}{media_mention_cta_text}{/exp:json_encode}",
        "call_to_action_link"   : "{media_mention_cta_link}",
        "video_link"            : "{media_mention_video_url}"
    {/if}
    }, {/exp:channel:entries}
]
{if:else} 
{ }
{/if}
