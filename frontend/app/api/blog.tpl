{exp:http_header content_type="application/json"}
{
  "articles" : [
      {exp:channel:entries channel="blog" dynamic="no" disable="{global:param_disable_default}" cache="yes" refresh="520" backspace="2"}
      {
        "id": "{url_title}",
        "rawdate": "{blog_date format="%U"}",
        "date": "{blog_date format='%m/%d/%Y'}",
        "year": "{blog_date format='%Y'}",
        "blog_item_category": "{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{categories limit="1"}{category_name}{/categories}{/exp:low_replace}",
        "related_blog_items": [
          {blog_related_items backspace="2"}
          {
            "id"        : "{blog_related_items:url_title}",
            "title"     : "{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{exp:mah_eencode decode="yes"}{blog_related_items:title}{/exp:mah_eencode}{/exp:low_replace}",
            "thumbnail_image_url" : "{blog_image}"
          }, {/blog_related_items}
        ],
        "featured": "{if blog_featured}{blog_featured}{/if}",
        "title": "{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{exp:mah_eencode decode="yes"}{title}{/exp:mah_eencode}{/exp:low_replace}",
        "text": "{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{blog_content}{/exp:low_replace}",
        "thumbnail_image_url": "{blog_image}",
        "image_url": "{blog_image}",
        "author":"{blog_author}"
      }, {/exp:channel:entries}
  ],

  "years" : [
    {
      "name"  : "Latest",
      "value" : ""
    }
    {exp:activerecord
      select="FROM_UNIXTIME(field_id_21, '%Y') as year"
      distinct="yes"
      from="channel_data"
      join="channel_titles"
      on="channel_data.entry_id = channel_titles.entry_id"
      join_type="left"
      where:channel_titles.channel_id="5"
      where:channel_titles.status="open"
      order_by="field_id_21 desc"
      backspace="2"}
    {if count == 1}, {/if} 
    {
      "name"  : "{year}",
      "value" : "{year}"
    }, {/exp:activerecord}
  ],

  "cats" : [
    {exp:channel:categories channel="blog" category_group="2" style="linear" show_empty="no" backspace="2"} 
    {if count == 1}
    {
      "name" : "All",
      "value" : ""
    },
    {/if} 
    {
      "name" : "{category_name}",
      "value" : "{category_name}"
    }, {/exp:channel:categories}
  ]
}