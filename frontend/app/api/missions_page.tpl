{exp:http_header content_type="application/json"}
{
{exp:channel:entries channel="hearing_landing" dynamic="no" disable="{global:param_disable_default}" limit="1"}
    "page_title"    : "{exp:json_encode}{title}{/exp:json_encode}",
    "page_lead"     : "{exp:json_encode}{hm_lead}{/exp:json_encode}",
    "hearing_mission_statistics" : [
        {hearing_mission_statistics backspace="2"} {
            "name"      : "{exp:json_encode}{hearing_mission_statistics:number}{/exp:json_encode}",
            "tagline"   : "{exp:json_encode}{hearing_mission_statistics:tagline}{/exp:json_encode}"
        }, {/hearing_mission_statistics}
    ],
    "content_tabs" : [
        {content_tabs backspace="2"} {
            "tab_title"             : "{exp:json_encode}{content_tabs:tab_title}{/exp:json_encode}",
            "content_title"         : "{exp:json_encode}{content_tabs:tab_content_title}{/exp:json_encode}",
            "content"               : "{exp:json_encode}{content_tabs:tab_content}{/exp:json_encode}",
            "thumbnail_image_url"   : "{content_tabs:tab_image:url}"
        }, {/content_tabs}
    ],
    "highlights" : [
        {mission_highlights limit="10" backspace="2"} {
            "id"        : "{mission_highlights:url_title}",
            "title"     : "{if mission_highlights:mission_display_title}{exp:json_encode}{mission_highlights:mission_display_title}{/exp:json_encode}{if:else}{exp:json_encode}{mission_highlights:title}{/exp:json_encode}{/if}",
            "rawdate"   : "{mission_highlights:mission_date format='%U'}",
            "date"      : "{mission_highlights:mission_date format='%m/%d/%Y'}",
            "subtitle"  : "{exp:json_encode}{mission_highlights:mission_subtitle}{/exp:json_encode}",
            "excerpt"   : "{exp:json_encode}{mission_highlights:mission_excerpt}{/exp:json_encode}",
            "image"     : "{if mission_highlights:mission_image}{mission_highlights:mission_image}{if:else}{mission_highlights:mission_thumb_image}{/if}",
            "video"     : "{mission_highlights:mission_video_url}",
            "region"    : "{mission_highlights:mission_region}{option_name}{/mission_highlights:mission_region}",
            "country"   : "{mission_highlights:mission_country}{option_name}{/mission_highlights:mission_country}"
        }, {/mission_highlights}
    ]
{/exp:channel:entries}
}
