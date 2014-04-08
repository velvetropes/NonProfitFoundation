{exp:http_header content_type="application/json"}
    {
        {exp:stash:set_list name="missions" parse_tags="yes" parse_conditionals="yes" parse_depth="3" trim="yes"}
          {exp:channel:entries channel="hearing_missions" dynamic="no" disable="{global:param_disable_default}"}
            {stash:mission_title}{if mission_display_title}{mission_display_title}{if:else}{title}{/if}{/stash:mission_title}

            {stash:id}{url_title}{/stash:id}
            {stash:excerpt}{mission_excerpt}{/stash:excerpt}
            
            {stash:video}{mission_video_url}{/stash:video}
            {stash:featured}{mission_featured}{/stash:featured}
            
            {stash:image}{mission_image:url}{/stash:image}
            {stash:thumb}{mission_thumb_image}{/stash:thumb}
            {stash:header}{if mission_image} {mission_image} {if:else} {mission_thumb_image} {/if}{/stash:header}

            {stash:rawdate}{mission_date format='%U'}{/stash:rawdate}
            {stash:date}{mission_date format='%m/%d/%Y'}{/stash:date}
            {stash:year}{mission_date format="%Y"}{/stash:year}
            
            {stash:region}{mission_region}{option_name}{/mission_region}{/stash:region}
            {stash:country}{mission_country}{option_name}{/mission_country}{/stash:country}

          {/exp:channel:entries}
        {/exp:stash:set_list}


        "highlights" : [
          {exp:stash:get_list name="missions" backspace="2"} {
              "id"                    : "{id}",
              "title"                 : "{exp:json_encode}{exp:eehive_hacksaw chars="50"}{mission_title}{/exp:eehive_hacksaw}{/exp:json_encode}",
              "subtitle"              : "{exp:json_encode}{exp:eehive_hacksaw chars="50"}{mission_title}{/exp:eehive_hacksaw}{/exp:json_encode}",
              "excerpt"               : "{exp:json_encode}{excerpt}{/exp:json_encode}",

              "video"                 : "{video}",
              "featured"              : "{featured}",

              "image"                 : "{image}",
              "thumbnail_image_url"   : "{thumb}",
              "header_image_url"      : "{header}",

              "rawdate"               : "{rawdate}",
              "date"                  : "{date}",
              "year"                  : "{year}",
              "region"                : "{region}",
              "country"               : "{country}"
            }, {/exp:stash:get_list}
        ],

      {!-- All the countries, grouped by region --}
      {exp:stash:set_list name="regions" parse_tags="yes"}
        {exp:activerecord select="field_id_97 AS region" from="exp_channel_data" group_by="region" where="field_id_97 != ''" parse="inward"}
            {stash:region}{region}{/stash:region}
            {stash:region_label}{exp:hundies_option_label field_id="97" option="{region}"}{/stash:region_label}
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
        {exp:stash:get_list name="regions" backspace="2"} {
            "region" : "{region_label}",
            "countries" : [{exp:stash:get_list:nested name="countries" context="{region}" backspace="1"}"{name}",{/exp:stash:get_list:nested}]
        }, {/exp:stash:get_list}
      ],

      {!-- All the years that have entries --}
      "years" : [
      {exp:activerecord 
        select="FROM_UNIXTIME(field_id_95, '%Y') as year" 
        distinct="yes" 
        from="channel_data"
        join="channel_titles"
        on="channel_data.entry_id = channel_titles.entry_id"
        join_type="left"
        where:channel_titles.channel_id="16"
        where:channel_titles.status="open"
        order_by="field_id_95 desc" 
        backspace="2"}
      {
        "name"  : "{year}", 
        "value" : "{year}"
      }, {/exp:activerecord}
      ]
    }