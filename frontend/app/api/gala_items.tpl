{exp:http_header content_type="application/json"}[

{exp:channel:entries channel="galla_overview" dynamic="no" limit="1" disable="{global:param_disable_default}"}
	{exp:stash:set name="upcoming_id" parse_tags="yes" parse_depth="2"}{gala_upcoming:entry_id}{/exp:stash:set}
{/exp:channel:entries}

{exp:stash:parse process="end"}
	{exp:channel:entries channel="galla" dynamic="no" orderby="galla_year" sort="desc" entry_id="not {exp:stash:upcoming_id}" parse="inward" backspace="2"} {
	    "id": "{url_title}",
	    "thumbnail_image_url":"{galla_thumb_image}",
	    "year": "{galla_year}"
	}, {/exp:channel:entries}
{/exp:stash:parse}
]