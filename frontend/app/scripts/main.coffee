requiredModules = [
  "ngRoute",
  "ngAnimate",
  "ngSanitize",
  "truncate",
  "sfControllers",
  "sfDirectives",
  "sfFilters",
  "sfServices",
  "ng.shims.placeholder"
]

FB_ID = "1391926457745223"

# Blog
blogPagesApp = angular.module("blogPagesApp", requiredModules)
blogPagesApp.run ($FB) ->
  $FB.init(FB_ID)

blogPagesApp.run ($rootScope, $location, $anchorScroll, $routeParams) ->
  $rootScope.$on "$routeChangeSuccess", (newRoute, oldRoute) ->
    $anchorScroll()

blogPagesApp.config ["$routeProvider", ($routeProvider, $routeParams) ->
  $routeProvider.when("/articles",
    templateUrl: "/partials/articles/index.html"
    controller: "BlogIndexCtrl"
    resolve: {
      api_data : [ "Articles", (Articles) ->
        Articles.getIndex().then(
          (data) ->
            data
        )
      ]
    }
  ).when("/articles/:articleId",
    templateUrl: (params) ->
      "/api/blog_detail/#{params.articleId}"
      # "local/api/blog_detail"
    controller: "BlogShowCtrl"
    resolve: {
      api_data : [ "Articles", (Articles) ->
        Articles.getIndex().then(
          (data) ->
            data
        )
      ]
    }
  ).otherwise redirectTo: "/articles"
]

# Gala
galaPageApp = angular.module("galaPageApp", requiredModules)
galaPageApp.run ($FB) ->
  $FB.init(FB_ID)

galaPageApp.config ["$routeProvider", ($routeProvider, $routeParams) ->
  $routeProvider.when("/gala/:tabId",
    templateUrl: (params) -> "/api/gala_#{params.tabId}"
    controller: "GalaCtrl"
  ).otherwise redirectTo: "/gala/overview"
]

legalPagesApp = angular.module("legalPagesApp", requiredModules)
legalPagesApp.run ($FB) ->
  $FB.init(FB_ID)

# Media Mentions
mediaMentionsPagesApp = angular.module("mediaMentionsPagesApp", requiredModules)
mediaMentionsPagesApp.run ($FB) ->
  $FB.init(FB_ID)

mediaMentionsPagesApp.run ($rootScope, $location, $anchorScroll, $routeParams) ->
  $rootScope.$on "$routeChangeSuccess", (newRoute, oldRoute) ->
    $anchorScroll()

mediaMentionsPagesApp.config ["$routeProvider", ($routeProvider) ->
  $routeProvider.when("/media_mentions",
    templateUrl: "/partials/media_mentions/index.html"
    controller: "MediaMentionsIndexCtrl"
    resolve: {
      api_data : [ "MediaMentionOrPressItem", (MediaMentionOrPressItem) ->
        MediaMentionOrPressItem.getIndex().then(
          (data) ->
            data
        )
      ]
    }
  ).when("/press_releases/:pressReleaseId",
    templateUrl: "/partials/press_releases/show.html"
    controller: "PressReleasesShowCtrl"
    resolve: {
      api_data : [ "MediaMentionOrPressItem", (MediaMentionOrPressItem) ->
        MediaMentionOrPressItem.getIndex().then(
          (data) ->
            data
        )
      ]
    }
  ).when("/media_mentions/:mediaMentionId",
    templateUrl: "/partials/media_mentions/show.html"
    controller: "MediaMentionsShowCtrl"
    resolve: {
      api_data : [ "MediaMentionOrPressItem", (MediaMentionOrPressItem) ->
        MediaMentionOrPressItem.getIndex().then(
          (data) ->
            data
        )
      ]
    }
  ).otherwise redirectTo: "/media_mentions"
]

# Hearing Missions
missionsPageApp = angular.module("missionsPageApp", requiredModules)
missionsPageApp.run ($FB) ->
  $FB.init(FB_ID)

missionsPageApp.run ($rootScope, $location, $anchorScroll, $routeParams) ->
  $rootScope.$on "$routeChangeSuccess", (newRoute, oldRoute) ->
    $anchorScroll()

missionsPageApp.config ["$routeProvider", ($routeProvider) ->
  $routeProvider.when("/missions",
    templateUrl: "/partials/missions/landing.html"
    controller: "MissionsPageCtrl"
  ).when("/highlights",
    templateUrl: ->
      "/partials/missions/index.html"
    controller: "MissionsIndexCtrl"
  ).when("/missions/:articleId",
    templateUrl: (params) ->
      "/api/missions_detail/#{params.articleId}"
      # "local/api/missions_detail"
    controller: "MissionsShowCtrl"
  ).otherwise redirectTo: "/missions"
]


programsPageApp = angular.module("programsPageApp", requiredModules)
programsPageApp.run ($FB) ->
  $FB.init(FB_ID)

programsPageApp.config ["$routeProvider", ($routeProvider, $routeParams) ->
  $routeProvider
  .when("/operationchange",
    templateUrl: "/api/program_0"
    controller: "ProgramsCtrl"
  ).when("/listencarefully",
    templateUrl: "/api/program_1"
    controller: "ProgramsCtrl"
  ).when("/hearnow",
    templateUrl: "/api/program_2"
    controller: "ProgramsCtrl"
  ).when("/hearingaidrecycling",
    templateUrl: "/api/program_3"
    controller: "ProgramsCtrl"
  ).otherwise redirectTo: "/listencarefully"
]

takeActionPagesApp = angular.module("takeActionPagesApp", requiredModules)
takeActionPagesApp.run ($FB) ->
  $FB.init(FB_ID)

takeActionPagesApp.config ["$routeProvider", ($routeProvider, $routeParams) ->
  $routeProvider.when("/:tabId",
    templateUrl: (params) ->
      "/api/#{params.tabId}"
      # "local/api/#{params.tabId}.html"
    controller: "TakeActionCtrl"
  ).otherwise redirectTo: "/fundraising"
]

HomePageApp = angular.module('homePageApp', requiredModules)

HomePageApp.run ($FB) ->
  $FB.init('1391926457745223')

# Preview
previewPageApp = angular.module("previewPageApp", requiredModules)
previewPageApp.run ($FB) ->
  $FB.init(FB_ID)

previewPageApp.config ["$routeProvider", ($routeProvider, $routeParams) ->
  $routeProvider.when("/:articleId",
    templateUrl: (params) ->
      "/api/blog_detail/#{params.articleId}"
      # "local/api/preview"
    controller: "PreviewShowCtrl"
  )
]