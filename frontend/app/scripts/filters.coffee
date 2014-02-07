sfFilters = angular.module("sfFilters", ["sfServices"])

sfFilters.filter("startFrom", ->
  (input, start) ->
    input.slice +start
)

sfFilters.filter("range", ->
  (input, total) ->
    total = parseInt(total)
    i = 0

    while i < total
      input.push i
      i++
    input
)

sfFilters.filter "youtubeIframe", [ "$filter", "Youtube", ($filter, Youtube) ->
  (value) ->
    return value unless value
    videoid = value.match(Youtube.regex())
    return ""  if videoid is null
    "//www.youtube.com/embed/" + videoid[1]
]

sfFilters.filter "youtubeImage", [ "$filter", "Youtube", ($filter, Youtube) ->
  (value, quality) ->
    quality = quality or "default"
    return value  unless value
    videoid = value.match(Youtube.regex())
    return ""  if videoid is null
    "https://img.youtube.com/vi/" + videoid[1] + "/" + quality + ".jpg"
]