# Blog
blogPagesApp = angular.module("blogPagesApp", [
  "ngRoute",
  "ngAnimate",
  "ngSanitize",
  "sfControllers",
  "sfDirectives",
  "sfFilters",
  "sfServices"
])

blogPagesApp.config ["$routeProvider", ($routeProvider, $routeParams) ->
  $routeProvider.when("/articles",
    templateUrl: "partials/articles/index.html"
    controller: "BlogIndexCtrl"
  ).when("/articles/:articleId",
    templateUrl: (params) ->
      "api/blog_detail/#{params.articleId}"
      # "local/api/blog_detail"
    controller: "BlogShowCtrl"
  ).otherwise redirectTo: "/articles"
]

# Hearing Missions
missionsPageApp = angular.module("missionsPageApp", [
  "ngRoute",
  "ngAnimate",
  "sfControllers",
  "sfDirectives",
  "sfFilters",
  "sfServices"
])

missionsPageApp.config ["$routeProvider", ($routeProvider) ->
  $routeProvider.when("/missions",
    templateUrl: "partials/missions/landing.html"
    controller: "MissionsPageCtrl"
  ).when("/highlights",
    templateUrl: ->
      "partials/missions/index.html"
    controller: "MissionsIndexCtrl"
  ).when("/missions/:articleId",
  templateUrl: (params) ->
      "api/missions_detail/#{params.articleId}"
      # "local/api/missions_detail"
    controller: "MissionsShowCtrl"
  ).otherwise redirectTo: "/missions"
]
# Media Mentions
mediaMentionsPagesApp = angular.module("mediaMentionsPagesApp", [
  "ngRoute",
  "ngAnimate",
  "ngSanitize",
  "sfControllers",
  "sfDirectives",
  "sfFilters",
  "sfServices"
])

mediaMentionsPagesApp.config ["$routeProvider", ($routeProvider) ->
  $routeProvider.when("/media_mentions",
    templateUrl: "partials/media_mentions/index.html"
    controller: "MediaMentionsIndexCtrl"
  ).when("/press_releases/:pressReleaseId",
    templateUrl: "partials/press_releases/show.html"
    controller: "PressReleasesShowCtrl"
  ).when("/media_mentions/:mediaMentionId",
    templateUrl: "partials/media_mentions/show.html"
    controller: "MediaMentionsShowCtrl"
  ).otherwise redirectTo: "/media_mentions"
]

programsPageApp = angular.module("programsPageApp", [
  "ngRoute",
  "ngAnimate",
  "sfControllers",
  "sfDirectives",
  "sfFilters",
  "sfServices"
])

programsPageApp.config ["$routeProvider", ($routeProvider, $routeParams) ->
  $routeProvider.when("/programs/:tabId",
    templateUrl: (params) ->
      "api/program_#{params.tabId}"
      # "local/api/program_#{params.tabId}"
    controller: "ProgramsCtrl"
  ).otherwise redirectTo: "/programs/0"
]

HomePageApp = angular.module('homePageApp', [
  "ngRoute",
  "ngAnimate",
  "ngSanitize",
  "sfControllers",
  "sfDirectives",
  "sfFilters",
  "sfServices"
])