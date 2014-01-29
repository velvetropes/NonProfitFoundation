sfFilters = angular.module("sfFilters", [])

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