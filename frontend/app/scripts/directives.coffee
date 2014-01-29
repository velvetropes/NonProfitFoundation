sfDirectives = angular.module("sfDirectives", ["sfFilters"])

sfDirectives.factory("Pagination", ->
  pagination = {}
  pagination.getNew = (perPage) ->
    perPage = (if perPage is `undefined` then 5 else perPage)
    paginator =
      numPages: 1
      perPage: perPage
      page: 0

    paginator.prevPage = ->
      paginator.page -= 1  if paginator.page > 0

    paginator.nextPage = ->
      paginator.page += 1  if paginator.page < paginator.numPages - 1

    paginator.toPageId = (id) ->
      paginator.page = id  if id >= 0 and id <= paginator.numPages - 1

    paginator

  pagination
)