{exp:http_header content_type="application/json"}{
{exp:channel:entries channel="media_mentions" limit="1"}
    "id":"{entry_id}",
    "title": "{title}",
    "date":"{entry_date format='%m %d %Y'}",
    "year": "{entry_date format='%Y'}",
    "type":"Media Mention",
    "featured":"{media_mention_feature_carousel}",
    "header_image_url":"{media_mention_image}",
    "logo_image_url":"{media_mention_logo}",
    "quote":"{media_mention_quote}",
    "call_to_action_text":"{media_mention_cta_text}",
    "call_to_action_link":"{media_mention_cta_link}",
    "video_link":"{media_mention_video_url}",
    "body":"{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{media_mention_body_text}{/exp:low_replace}"
{/exp:channel:entries}
}
