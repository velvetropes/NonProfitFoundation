requiredModules = [
  "ngRoute",
  "ngAnimate",
  "ngSanitize",
  "truncate",
  "sfControllers",
  "sfDirectives",
  "sfFilters",
  "sfServices"
]

# Blog
blogPagesApp = angular.module("blogPagesApp", requiredModules)

blogPagesApp.run ($rootScope, $location, $anchorScroll, $routeParams) ->
  $rootScope.$on "$routeChangeSuccess", (newRoute, oldRoute) ->
    $anchorScroll()

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

# Gala
galaPageApp = angular.module("galaPageApp", requiredModules )

galaPageApp.config ["$routeProvider", ($routeProvider, $routeParams) ->
  $routeProvider.when("/gala/:tabId",
    templateUrl: (params) ->
      "api/gala_#{params.tabId}"
      # "local/api/gala_#{params.tabId}"
    controller: "GalaCtrl"
  ).otherwise redirectTo: "/gala/overview"
]

legalPagesApp = angular.module("legalPagesApp", requiredModules )

# Media Mentions
mediaMentionsPagesApp = angular.module("mediaMentionsPagesApp", requiredModules )

mediaMentionsPagesApp.run ($rootScope, $location, $anchorScroll, $routeParams) ->
  $rootScope.$on "$routeChangeSuccess", (newRoute, oldRoute) ->
    $anchorScroll()

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

# Hearing Missions
missionsPageApp = angular.module("missionsPageApp", requiredModules )

missionsPageApp.run ($rootScope, $location, $anchorScroll, $routeParams) ->
  $rootScope.$on "$routeChangeSuccess", (newRoute, oldRoute) ->
    $anchorScroll()

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

programsPageApp = angular.module("programsPageApp", requiredModules )

programsPageApp.config ["$routeProvider", ($routeProvider, $routeParams) ->
  $routeProvider.when("/programs/:tabId",
    templateUrl: (params) ->
      "api/program_#{params.tabId}"
      # "local/api/program_#{params.tabId}"
    controller: "ProgramsCtrl"
  ).otherwise redirectTo: "/programs/0"
]

takeActionPagesApp = angular.module("takeActionPagesApp", requiredModules )

takeActionPagesApp.config ["$routeProvider", ($routeProvider, $routeParams) ->
  $routeProvider.when("/:tabId",
    templateUrl: (params) ->
      "api/#{params.tabId}"
      # "local/api/#{params.tabId}.html"
    controller: "TakeActionCtrl"
  ).otherwise redirectTo: "/fundraising"
]

HomePageApp = angular.module('homePageApp', requiredModules )
HomePageApp.run ($FB) ->
  $FB.init('1391926457745223')

# Preview
previewPageApp = angular.module("previewPageApp", requiredModules )

previewPageApp.config ["$routeProvider", ($routeProvider, $routeParams) ->
  $routeProvider.when("/articles/:articleId",
    templateUrl: (params) ->
      "api/preview/#{params.articleId}"
      # "local/api/preview"
    controller: "PreviewShowCtrl"
  )
]