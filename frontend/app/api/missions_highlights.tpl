{exp:http_header content_type="application/json"}
    {
        "highlights" : [
            {exp:channel:entries channel="hearing_missions" dynamic="no"}
              {
                "id"                    : "{url_title}",
                "title"                 : "{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{exp:mah_eencode decode="yes"}{title}{/exp:mah_eencode}{/exp:low_replace}",
                "subtitle"              : "{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{exp:mah_eencode decode="yes"}{title}{/exp:mah_eencode}{/exp:low_replace}",
                "excerpt"               : "{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{mission_excerpt}{/exp:low_replace}",

                "video"                 : "{mission_video_url}",
                "featured"              : "{mission_featured}",

                "image"                 : "{if mission_image}{if:else}{mission_image:url}{/if}",
                "thumbnail_image_url"   : "{mission_thumb_image}",
                "header_image_url"      : "{mission_thumb_image}",

                "date"                  : "{mission_date format='%m %d %Y'}",
                "year"                  : "{mission_date format="%Y"}",
                "region"                : "{mission_region}{option_name}{/mission_region}",
                "country"               : "{mission_country}{option_name}{/mission_country}"
              }{if count != total_results},{/if}
            {/exp:channel:entries}
        ],

      {!-- All the countries, grouped by region --}
      {exp:stash:set_list name="regions" parse_tags="yes"}
        {exp:activerecord select="field_id_97 AS region" from="exp_channel_data" group_by="region" where="field_id_97 != ''"}
            {stash:region}{region}{/stash:region}
        {/exp:activerecord}
      {/exp:stash:set_list}

      {exp:stash:get_list name="regions"}
        {exp:stash:set_list name="countries" context="{region}" parse_tags="yes"}
            {exp:activerecord select="field_id_96 AS country" from="exp_channel_data" group_by="country" where="field_id_97 = '{region}'" parse="inward"}
                {stash:name}{country}{/stash:name}
            {/exp:activerecord}
        {/exp:stash:set_list}
      {/exp:stash:get_list}

      "categories" :  [
        {exp:stash:get_list name="regions"}
        {
            "region" : "{region}",
            "countries" : [{exp:stash:get_list:nested name="countries" context="{region}" backspace="1"}"{name}",{/exp:stash:get_list:nested}]
        }{if count != total_results},{/if}
        {/exp:stash:get_list}
      ],

      {!-- All the years that have entries --}
      "years" : [{exp:channel:entries channel="hearing_missions" backspace="1" dynamic="no"}"{mission_date format='%Y'}",{/exp:channel:entries}]
    }
