{exp:channel:entries channel="blog" dynamic="no" limit="1" disable="{global:param_disable_default}"}
{
  "id"		: "{url_title}",
  "date"	: "{blog_date format='%F %d, %Y'}",
  "title"	: "{exp:json_encode}{title}{/exp:json_encode}"
}
{/exp:channel:entries}