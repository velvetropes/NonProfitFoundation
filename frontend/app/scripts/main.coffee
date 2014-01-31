# Blog
blogPagesApp = angular.module("blogPagesApp", [
  "ngRoute",
  "ngSanitize",
  "ahundredyears.swiper",
  "ahundredyears.thumblist-nav",
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
  "ngSanitize",
  "ahundredyears.swiper",
  "ahundredyears.thumblist-nav",
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
  "ngAnimate",
  "sfControllers",
  "sfDirectives",
  "sfFilters",
  "sfServices"
])

HomePageApp = angular.module('homePageApp', [
  "ngRoute",
  "ngSanitize",
  "ahundredyears.swiper",
  "ahundredyears.thumblist-nav",
  "sfControllers",
  "sfDirectives",
  "sfFilters",
  "sfServices"
])