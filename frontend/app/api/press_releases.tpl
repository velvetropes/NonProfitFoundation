{exp:http_header content_type="application/json"}{
{exp:channel:entries channel="press_releases" limit="1"}
    "id":"{entry_id}",
    "title": "{title}",
    "date":"{entry_date format='%m %d %Y'}",
    "year": "{entry_date format='%Y'}",
    "type":"Press Release",
    "header_image_url":"{press_release_image}",
    "press_release_source": "{press_release_source}",
    "press_release_pdf_download": "{press_release_pdf_download}",
    "press_release_contact": "{press_release_contact}",
    "body": "{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{press_release_body_text}{/exp:low_replace}"
{/exp:channel:entries}
}
