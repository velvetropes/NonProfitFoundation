# Blog
blogPagesApp = angular.module("blogPagesApp", [
  "ngRoute",
  "ngAnimate",
  "ngSanitize",
  "ahundredyears.swiper",
  "sfControllers",
  "sfDirectives",
  "sfFilters",
  "sfServices"
])

blogPagesApp.config ["$routeProvider", ($routeProvider) ->
  $routeProvider.when("/articles",
    templateUrl: "partials/articles/index.html"
    controller: "BlogIndexCtrl"
  ).when("/articles/:articleId",
    templateUrl: "partials/articles/show.html"
    controller: "BlogShowCtrl"
  ).otherwise redirectTo: "/articles"
]

# Media Mentions
mediaMentionsPagesApp = angular.module("mediaMentionsPagesApp", [
  "ngRoute",
  "ngAnimate",
  "ngSanitize",
  "ahundredyears.swiper",
  "sfControllers",
  "sfDirectives",
  "sfFilters",
  "sfServices"
])

mediaMentionsPagesApp.config ["$routeProvider", ($routeProvider) ->
  $routeProvider.when("/media_mentions",
    templateUrl: "partials/media_mentions/index.html"
    controller: "MediaMentionsIndexCtrl"
  ).when("/media_mentions/:articleId",
    templateUrl: "partials/media_mentions/show.html"
    controller: "MediaMentionsShowCtrl"
  ).otherwise redirectTo: "/media_mentions"
]

programsPageApp = angular.module("programsPageApp", [
  "ngRoute",
  "ngAnimate",
  "ahundredyears.swiper",
  "sfControllers",
  "sfDirectives",
  "sfFilters",
  "sfServices"
])

# Hacky hack
programsPageApp.config ["$routeProvider", ($routeProvider, $routeParams) ->
  $routeProvider.when("/programs/:tabId",
    templateUrl: (params) ->
      "partials/programs/index.html"
    controller: "ProgramsCtrl"
  ).otherwise redirectTo: "/programs/0"
]

HomePageApp = angular.module('homePageApp', [
  "ngRoute",
  "ngAnimate",
  "ngSanitize",
  "ahundredyears.swiper",
  "sfControllers",
  "sfDirectives",
  "sfFilters",
  "sfServices"
])