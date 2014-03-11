{exp:http_header content_type="application/json"}{exp:channel:entries channel="galla_overview" dynamic="no" limit="1" disable="{global:param_disable_default}"}
[
{if '{gala_first_tab}' == 'upcoming'}
	{
		"title" : "Upcoming",
		"link"  : "#/gala/upcoming"
	},
	{
		"title" : "Overview",
		"link"  : "#/gala/overview"
	}
{if:else}
	{
		"title" : "Overview",
		"link"  : "#/gala/overview"
	},
	{
		"title" : "Upcoming",
		"link"  : "#/gala/upcoming"
	}
{/if}
]
{/exp:channel:entries}