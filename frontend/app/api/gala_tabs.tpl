{exp:http_header content_type="application/json"}{exp:channel:entries channel="galla_overview" dynamic="no" limit="1" disable="{global:param_disable_default}"}
[
	{gala_tabs}
	{
		"title" : "{gala_tabs:title}",
		"link"  : "{gala_tabs:link}"
	}{if gala_tabs:count != gala_tabs:total_rows},{/if}
	{/gala_tabs}
]
{/exp:channel:entries}