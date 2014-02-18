[
{exp:channel:entries channel="hearing_missions" dynamic="no"}
  {
    "id"                    : "{url_title}",
    "title"                 : "{title}",
    "subtitle"              : "{mission_subtitle}",
    "excerpt"               : "{mission_excerpt}",
    
    "video"                 : "{mission_video_url}",
    "featured"              : "{mission_featured}",

    "image"                 : "{if mission_image}{mission_image:url}{if:else}{mission_image:url}{/if}",
    "thumbnail_image_url"   : "{mission_thumb_image}",
    "header_image_url"      : "{if mission_image}{mission_image:url}{if:else}{mission_thumb_image}{/if}",

    "date"                  : "{mission_date format='%m %d %Y'}",
    "year"                  : "{mission_date format="%Y"}",
    "region"                : "{mission_region}{option_name}{/mission_region}",
    "country"               : "{mission_country}{option_name}{/mission_country}"
  }
{/exp:channel:entries}
]