{exp:http_header content_type="application/json"}
{if segment_3 == "index" OR segment_3 == ""}
[
{exp:channel:entries channel="press_releases|media_mentions" dynamic="no" orderby="entry_date" sort="asc" backspace="2"}
{
    "id":"{url_title}",
    "feed_url":"/api/{channel_name}/{url_title}",
    "title": "{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{exp:mah_eencode decode="yes"}{title}{/exp:mah_eencode}{/exp:low_replace}",
    "year": "{entry_date format='%Y'}",
{if channel_name == "press_releases"}
    "date":"{entry_date format='%m %d %Y'}",
    "detail_page": "true",
    "type":"press_release",
    "featured":"false",
    "header_image_url":"{press_release_image}",
    "logo_image_url":"",
    "quote":"",
    "call_to_action_text":"{title}",
    "call_to_action_link":"Read More",
    "video_link":""
{if:else}
    "date":"{media_mention_date format='%m %d %Y'}",
    "detail_page": "{media_mention_detail_page}",
    "type":"media_mention",
    "featured":"{media_mention_feature_carousel}",
    "header_image_url":"{media_mention_image}",
    "logo_image_url":"{media_mention_logo}",
    "quote":"{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{media_mention_quote}{/exp:low_replace}",
    "call_to_action_text":"{media_mention_cta_text}",
    "call_to_action_link":"{media_mention_cta_link}",
    "video_link":"{media_mention_video_url}"
{/if}
},
{/exp:channel:entries}
]
{if:else}
{
}
{/if}
