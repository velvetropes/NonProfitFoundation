{exp:http_header content_type="application/json"}
{if segment_3 == "index" OR segment_3 == ""}
[
    {exp:channel:entries channel="blog" dynamic="no" backspace="6"}
    {
      "id": "{url_title}",
      "date": "{blog_date format='%m %d %Y'}",
      "year": "{blog_date format='%Y'}",
      "blog_item_category": "{if blog_category}{blog_category}{/if}",
      "related_blog_items": [],
      "featured": "{if blog_featured}{blog_featured}{/if}",
      "title": "{title}",
      "text": "{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{blog_content}{/exp:low_replace}",
      "thumbnail_image_url": "{if blog_image}{blog_image}{/if}",
      "image_url": "{if blog_image}{blog_image}{/if}",
      "author":"{blog_author}"
    },
    {/exp:channel:entries}
]
{if:else}
{exp:channel:prev_entry channel="blog" url_title="{segment_3}"}
  <? $prev_id = "{url_title}"; ?>
{/exp:channel:prev_entry}
  <? $prev_item = (!empty($prev_id)) ? $prev_id : false; ?>
{exp:channel:next_entry channel="blog" url_title="{segment_3}"}
  <? $next_id = "{url_title}"; ?>
{/exp:channel:next_entry}
  <? $next_item = (!empty($next_id)) ? $next_id : "0"; ?>
{exp:channel:entries channel="blog" dynamic="no" url_title="{segment_3}" limit="1"}
{
  "id": "{url_title}",
  "date": "{entry_date format='%m %d %Y'}",
  "year": "{entry_date format='%Y'}",
  "blog_item_category": "{if blog_category}{blog_category}{/if}",
  "related_blog_items": [{blog_related_items backspace="1"}{blog_related_items:url_title},{/blog_related_items}],
  "prev_item": "<?=$prev_item?>",
  "next_item": "<?=$next_item?>",
  "featured": "{if blog_featured}{blog_featured}{/if}",
  "title": "{title}",
  "text": "{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{blog_content}{/exp:low_replace}",
  "thumbnail_image_url": "{if blog_image}{blog_image}{/if}",
  "image_url": "{if blog_image}{blog_image}{/if}",
  "author":"{blog_author}"
}
{/exp:channel:entries}
{/if}
