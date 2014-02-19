{exp:http_header content_type="application/json"}{
   "continents": [
      {exp:channel:entries channel="mission_markers" dynamic="no" backspace="8" orderby="mm_order" sort="asc"}
      {
         "name": "{if is_us_map}US{if:else}{exp:mah_eencode decode="yes"}{title}{/exp:mah_eencode}{/if}",
         "total_hearing_aids_provided": "{total_hearing_aids_provided}",
         "countries_visited": [
            {countries_visited}
            {
               "name": "{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{countries_visited:name}{/exp:low_replace}",
               "abbreviation": "{countries_visited:abbreviation}",
               "total_hearing_aids_provided": "{countries_visited:hearing_aids}"
            }{if countries_visited:count != countries_visited:total_rows},{/if}
            {/countries_visited}
         ]
      },
      {/exp:channel:entries}
   ]
}