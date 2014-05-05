{exp:http_header content_type="application/json"} {

{exp:stash:set name="entry_url_title" parse_tags="yes" trim="yes"}
    {exp:low_replace find=".json" relace=""}{segment_3}{/exp:low_replace}
{/exp:stash:set}

{exp:channel:next_entry channel="press_releases" url_title="{exp:stash:entry_url_title}" parse="inward"}
   {exp:stash:set_value parse_tags="yes" name="next_entry" value="{url_title}"}
{/exp:channel:next_entry}

{exp:channel:prev_entry channel="press_releases" url_title="{exp:stash:entry_url_title}" parse="inward"}
    {exp:stash:set_value parse_tags="yes" name="prev_entry" value="{url_title}"}
{/exp:channel:prev_entry}

{exp:channel:entries channel="press_releases" dynmaic="no" url_title="{exp:stash:entry_url_title}" parse="inward" limit="1"}
    "type"                          : "press_releases",
    "prev_item"                     : "{exp:stash:next_entry}",
    "next_item"                     : "{exp:stash:prev_entry}",
    "id"                            : "{url_title}",
    "title"                         : "{exp:json_encode}{title}{/exp:json_encode}",
    "date"                          : "{entry_date format='%m/%d/%Y'}",
    "year"                          : "{entry_date format='%Y'}",
    "header_image_url"              : "{if press_header_image}{press_header_image}{if:else}{press_release_image}{/if}",
    "thumb_image_url"               : "{press_release_image}",
    "press_release_source"          : "{press_release_source}",
    "press_release_pdf_download"    : "{press_release_pdf_download}",
    "press_release_contact"         : "{press_release_contact}",
    "body"                          : "{exp:json_encode}{press_release_body_text}{/exp:json_encode}"
{/exp:channel:entries}
}