{exp:http_header content_type="application/json"}
{if segment_3 == "index" OR segment_3 == ""}
[
{exp:query sql="SELECT t.entry_id AS item_id, t.title, w.channel_name
                FROM (exp_channel_titles AS t)
                LEFT JOIN exp_channels AS w ON w.channel_id = t.channel_id
                WHERE w.site_id IN ('1')
                AND w.channel_name IN ('press_releases','media_mentions');" backspace="2"}
  {
  {exp:channel:entries channel="{channel_name}" limit="1" entry_id="{item_id}"}
    "id":"{item_id}",
    "feed_url":"/api/{channel_name}/{item_id}",
    "title": "{title}",
    "date":"{entry_date format='%m %d %Y'}",
    "year": "{entry_date format='%Y'}",
  {if channel_name == "press_releases"}
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
    "detail_page": "{media_mention_detail_page}",
    "type":"media_mention",
    "featured":"{media_mention_feature_carousel}",
    "header_image_url":"{media_mention_image}",
    "logo_image_url":"{media_mention_logo}",
    "quote":"{media_mention_quote}",
    "call_to_action_text":"{media_mention_cta_text}",
    "call_to_action_link":"{media_mention_cta_link}",
    "video_link":"{media_mention_video_url}"
  {/if}
  {/exp:channel:entries}
  },
{/exp:query}
]
{if:else}
{
}
{/if}
