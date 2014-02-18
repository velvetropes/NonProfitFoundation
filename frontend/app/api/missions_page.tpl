{exp:http_header content_type="application/json"}{exp:channel:entries channel="hearing_landing" dynamic="no" limit="1"}
[
  {
    "page_title" : "{title}",
    "page_lead" : "{hm_lead}",
    "hearing_mission_statistics" : [
    {hearing_mission_statistics}
        {
            "name": "{hearing_mission_statistics:number}",
            "tagline": "{hearing_mission_statistics:tagline}"
        }{if hearing_mission_statistics:count != hearing_mission_statistics:total_rows},{/if}
    {/hearing_mission_statistics}
    ],
    "content_tabs" : [
    {content_tabs}
        {
            "tab_title" : "{content_tabs:tab_title}",
            "content_title" : "{content_tabs:tab_content_title}",
            "content" : "{content_tabs:tab_content}",
            "thumbnail_image_url" : "{content_tabs:tab_image}{url}{/content_tabs:tab_image}"
        }{if content_tabs:count != content_tabs:total_rows},{/if}
    {/content_tabs}
    ],
    "highlights" : [
    {mission_highlights limit="10"}
        {
            "id"        : "{url_title}",
            "title"     : "{title}",
            "date"      : "{mission_date format='%m %d %Y'}",
            "subtitle"  : "{mission_highlights:mission_subtitle}",
            "excerpt"   : "{mission_highlights:mission_excerpt}",
            "image"     : "{mission_highlights:mission_image:url}",
            "video"     : "{mission_highlights:mission_video_url}",
            "region"    : "{mission_region}{option_name}{/mission_region}",
            "country"   : "{mission_country}{option_name}{/mission_country}"
        }{if mission_highlights:count != mission_highlights:total_results}{/if}
    {/mission_highlights}
    ]
  }
]
{/exp:channel:entries}