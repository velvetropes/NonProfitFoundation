{exp:http_header content_type="application/json"}{

{exp:stash:set name="entry_url_title" parse_tags="yes" trim="yes"}
    {exp:low_replace find=".json" relace=""}{segment_3}{/exp:low_replace}
{/exp:stash:set}

{exp:channel:next_entry channel="media_mentions" url_title="{exp:stash:entry_url_title}" parse="inward"}
   {exp:stash:set_value parse_tags="yes" name="next_entry" value="{url_title}"}
{/exp:channel:next_entry}

{exp:channel:prev_entry channel="media_mentions" url_title="{exp:stash:entry_url_title}" parse="inward"}
    {exp:stash:set_value parse_tags="yes" name="prev_entry" value="{url_title}"}
{/exp:channel:prev_entry}

{exp:channel:entries channel="media_mentions" dynmaic="no" url_title="{exp:stash:entry_url_title}" parse="inward" limit="1"}
    "type"                  : "media_mention",
    "prev_item"             : "{exp:stash:next_entry}",
    "next_item"             : "{exp:stash:prev_entry}",
    "id"                    : "{url_title}",
    "title"                 : "{exp:json_encode}{title}{/exp:json_encode}",
    "date"                  : "{media_mention_date format='%m/%d/%Y'}",
    "year"                  : "{media_mention_date format='%Y'}",
    "rawdate"               : "{media_mention_date format='%U'}",
    "featured"              : "{media_mention_feature_carousel}",
    "header_image_url"      : "{if mm_header_image}{mm_header_image}{if:else}{media_mention_image}{/if}",
    "logo_image_url"        : "{media_mention_logo}",
    "quote"                 : "{exp:json_encode}{exp:eehive_hacksaw chars="320"}{media_mention_quote}{/exp:eehive_hacksaw}{/exp:json_encode}",
    "call_to_action_text"   : "{exp:json_encode}{media_mention_cta_text}{/exp:json_encode}",
    "call_to_action_link"   : "{media_mention_cta_link}",
    "video_link"            : "{media_mention_video_url}",
    "source"                : "media_mention_source",
    "press_release_contact" : "{mm_contact}",
    "body"                  : "{exp:json_encode}{media_mention_body_text}{/exp:json_encode}"
{/exp:channel:entries}
}
