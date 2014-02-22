{exp:http_header content_type="application/json"}[
  {exp:channel:entries channel="galla" dynamic="no" limit="5" orderby="galla_year" sort="desc"}
  {
    "id": "{url_title}",
    "thumbnail_image_url":"{galla_thumb_image}",
    "year": "{galla_year}"
  }{if count != total_results},{/if}
  {/exp:channel:entries}
]