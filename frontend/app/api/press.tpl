{exp:http_header content_type="application/json"}
{if segment_3 == "index" OR segment_3 == ""}
{
    "articles": [
    {exp:channel:entries channel="press_releases|media_mentions" dynamic="no" orderby="entry_date" sort="asc" backspace="2"} {
        "id"        : "{url_title}",
        "feed_url"  : "/api/{channel_name}/{url_title}",
        "title"     : "{exp:json_encode}{title}{/exp:json_encode}",


    {if channel_name == "press_releases"}
        "category"              : "press_release",
        "rawdate"               : "{entry_date format='%U'}",
        "date"                  : "{entry_date format='%m/%d/%Y'}",
        "year"                  : "{entry_date format='%Y'}",
        "detail_page"           : "true",
        "featured"              : "false",
        "header_image_url"      : "{if press_header_image}{press_header_image}{if:else}{press_release_image}{/if}",
        "thumb_image_url"       : "{press_release_image}",
        "logo_image_url"        : "",
        "quote"                 : "",
        "call_to_action_text"   : "{exp:json_encode}{title}{/exp:json_encode}",
        "call_to_action_link"   : "Read More",
        "video_link"            : ""

    {if:else}
        "category"              : "media_mention",
        "rawdate"               : "{media_mention_date format='%U'}",
        "date"                  : "{media_mention_date format='%m/%d/%Y'}",
        "year"                  : "{media_mention_date format='%Y'}",
        "detail_page"           : "{media_mention_detail_page}",
        "featured"              : "{media_mention_feature_carousel}",
        "header_image_url"      : "{if mm_header_image}{mm_header_image}{if:else}{media_mention_image}{/if}",
        "thumb_image_url"       : "{media_mention_image}",
        "logo_image_url"        : "{media_mention_logo}",
        "quote"                 : "{if '{media_mention_video_url}' == ''}{exp:json_encode}{exp:eehive_hacksaw chars="320"}{media_mention_quote}{/exp:eehive_hacksaw}{/exp:json_encode}{/if}",
        "call_to_action_text"   : "{exp:json_encode}{media_mention_cta_text}{/exp:json_encode}",
        "call_to_action_link"   : "{media_mention_cta_link}",
        "video_link"            : "{media_mention_video_url}"
    {/if}
    }, {/exp:channel:entries}
],
"filters":[
      {
         "label":"year",
         "values":[
            {
               "name":"Latest",
               "value":""
            },
            {
               "name":"2014",
               "value":"2014"
            },
            {
               "name":"2013",
               "value":"2013"
            },
            {
               "name":"2012",
               "value":"2012"
            },
            {
               "name":"2011",
               "value":"2011"
            },
            {
               "name":"2010",
               "value":"2010"
            }
         ]
      },
      {
         "label":"category",
         "values":[
            {
               "name":"All",
               "value":""
            },
            {
               "name":"Press Release",
               "value":"press_release"
            },
            {
               "name":"Media Mention",
               "value":"media_mention"
            }
         ]
      }
   ]
}
{if:else}

{/if}
