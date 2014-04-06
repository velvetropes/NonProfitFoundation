(function() {
    var sfControllers, __indexOf = [].indexOf || function(item) {
        for (var i = 0, l = this.length; l > i; i++) if (i in this && this[i] === item) return i;
        return -1;
    };
    sfControllers = angular.module("sfControllers", []), sfControllers.config([ "$sceProvider", function($sceProvider) {
        return $sceProvider.enabled(!1);
    } ]), sfControllers.controller("globalCtrl", [ "$window", "$scope", "$rootScope", "$location", "$timeout", function($window, $scope, $rootScope, $location, $timeout) {
        var displayModal;
        return $scope.showModal = !1, $scope.videoIframe = "", $scope.showSubscribeForm = !1, 
        $scope.location = $location, $rootScope.locationUrl = function() {
            return encodeURIComponent($location.absUrl());
        }, "/articles" === $location.url() && ($scope.blogOverview = !0), "/thank_you" === $location.url() ? void ($scope.showThanks = !0) : ($timeout(function() {
            var videoUrl;
            videoUrl = $location.search().video, null != videoUrl && ($scope.showModal = !0, 
            displayModal("http://www.youtube.com/watch?v=" + videoUrl));
        }, 500), $scope.loadingRoute = !1, $scope.$on("$routeChangeStart", function() {
            return $scope.loadingRoute = !0;
        }), $scope.$on("$routeChangeSuccess", function() {
            return $scope.loadingRoute = !1, $scope.blogOverview = "/articles" === $location.url() ? !0 : !1;
        }), $scope.$on("modal:hide", function() {
            return $location.$$search.video && (delete $location.$$search.video, $location.$$compose()), 
            $scope.showModal = !1;
        }), $scope.$on("modal:show", function(event, url) {
            return $scope.showModal = !$scope.showModal, $scope.showModal === !0 ? displayModal(url) : void 0;
        }), displayModal = function(url) {
            var youtubePattern;
            return youtubePattern = /^.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]{11,11}).*$/, 
            null != url.match(youtubePattern) && $location.search("video", url.match(youtubePattern)[1]), 
            $scope.videoIframe = url;
        }, $scope.toggleSubscribeForm = function() {
            return $scope.showSubscribeForm = !$scope.showSubscribeForm;
        }, $scope.openSubscribeForm = function() {
            return $scope.showSubscribeForm = !0;
        }, angular.element($window).bind("resize", function() {
            return $timeout(function() {
                return $scope.$broadcast("window.resized", {});
            }, 1100);
        }));
    } ]), sfControllers.controller("HomeIndexBottomTabsCtrl", [ "$scope", "MapMarker", "FeaturedArticle", function($scope, MapMarker, FeaturedArticle) {
        return FeaturedArticle.getIndex().then(function(data) {
            return $scope.featuredArticlesHash = data;
        }), MapMarker.getIndex().then(function(data) {
            return $scope.markers = data;
        }), $scope.currentBottomSlideTab = 1, $scope.currentTabModel = {}, $scope.changeCurrentTab = function(tabIndex) {
            return 0 === tabIndex ? $scope.currentBottomSlideTab = 1 : ($scope.currentBottomSlideTab = 2, 
            $scope.currentTabModel = $scope.featuredArticlesHash.articles[tabIndex - 1]);
        }, $scope.modalShown = !1, $scope.toggleModal = function() {
            return $scope.modalShown = !$scope.modalShown;
        };
    } ]), sfControllers.controller("BlogIndexCtrl", [ "$scope", "$window", "Articles", "Pagination", "api_data", function($scope, $window, Articles, Pagination, api_data) {
        return $scope.blogArticles = api_data.articles, $scope.blogFilters = api_data.filters;
    } ]), sfControllers.controller("BlogShowCtrl", [ "$scope", "$routeParams", "$location", "$sce", "Articles", "Article", "Pagination", "api_data", function($scope, $routeParams, $location, $sce, Articles, Article, Pagination, api_data) {
        return $scope.currentPosition = $routeParams.articleId, $scope.blogArticles = api_data.articles || [], 
        $scope.blogFilters = api_data.filters;
    } ]), sfControllers.controller("BlogPreviewCtrl", [ "$scope", "$routeParams", "$location", "$sce", "Articles", "Article", "Pagination", function($scope, $routeParams, $location, $sce, Articles) {
        return $scope.currentPosition = $routeParams.articleId, $scope.blogArticles = [], 
        $scope.blogFilters = [], Articles.getIndex().then(function(data) {
            return $scope.blogArticles = data.articles || [], $scope.blogFilters = data.filters;
        });
    } ]), sfControllers.controller("GalaCtrl", [ "$scope", "$routeParams", "GalaItems", "GalaTabs", function($scope, $routeParams, GalaItems, GalaTabs) {
        return GalaItems.getIndex().then(function(data) {
            return $scope.timelineItems = data;
        }), GalaTabs.getIndex().then(function(data) {
            return $scope.galaTabs = data;
        });
    } ]), sfControllers.controller("LegalPagesCtrl", [ "$scope", "$routeParams", function($scope) {
        return $scope.currentTab = 0;
    } ]), sfControllers.controller("MediaMentionsIndexCtrl", [ "$scope", "$filter", "MediaMentionOrPressItem", "api_data", function($scope, $filter, MediaMentionOrPressItem, api_data) {
        return $scope.pressItems = api_data.articles, $scope.pressFilters = api_data.filters;
    } ]), sfControllers.controller("MediaMentionsShowCtrl", [ "$scope", "$routeParams", "MediaMention", "MediaMentionOrPressItem", "api_data", function($scope, $routeParams, MediaMention, MediaMentionOrPressItem, api_data) {
        return $scope.article = {
            prev_item: "",
            next_item: ""
        }, $scope.currentPosition = $routeParams.articleId, $scope.pressItems = [], MediaMention.get({
            mediaMentionId: $routeParams.mediaMentionId
        }, function(pressItem) {
            return $scope.article = pressItem instanceof Array ? pressItem[0] : pressItem;
        }), $scope.pressItems = api_data.articles, $scope.pressFilters = api_data.filters;
    } ]), sfControllers.controller("MissionsPageCtrl", [ "$scope", "MissionsMapMarker", "MissionsPage", function($scope, MissionsMapMarker, MissionsPage) {
        return $scope.currentTab = 0, MissionsMapMarker.getIndex().then(function(data) {
            return $scope.data = data;
        }), MissionsPage.getPage().then(function(data) {
            return $scope.missions = data, $scope.statistics = $scope.missions.hearing_mission_statistics, 
            $scope.content_tabs = $scope.missions.content_tabs, $scope.highlights = $scope.missions.highlights;
        }), $scope.changeTab = function(tabId) {
            return $scope.currentTab = tabId;
        };
    } ]), sfControllers.controller("MissionsIndexCtrl", [ "$scope", "$filter", "Pagination", "MissionsIndex", function($scope, $filter, Pagination, MissionsIndex) {
        return $scope.highlightRegions = [], $scope.currentRegion = {}, $scope.missionsHighlights = [], 
        $scope.currentCountry = "", $scope.highlightsFilters = {
            year: "",
            region: "",
            country: ""
        }, $scope.highlightYears = [ {
            name: "Latest",
            value: ""
        } ], MissionsIndex.getIndex().then(function(data) {
            var addedYear, year, _i, _len, _ref;
            for ($scope.missionsHighlights = data.highlights, $scope.showPaginator = !0, $scope.pagination = Pagination.getNew(9), 
            $scope.pagination.numPages = Math.ceil($scope.missionsHighlights.length / $scope.pagination.perPage), 
            $scope.highlightRegions = data.categories, _ref = data.years, _i = 0, _len = _ref.length; _len > _i; _i++) year = _ref[_i], 
            addedYear = {
                name: year.name,
                value: year.value
            }, $scope.highlightYears.push(addedYear);
            return $scope.$watch("pagination", function() {
                $scope.pageStart = $scope.pagination.page * $scope.perPage, $scope.currentPage = $scope.pagination.page * $scope.pagination.perPage, 
                $scope.paginationUpperWindowLimit = $scope.pagination.upperWindowLimit(), $scope.paginationLowerWindowLimit = $scope.pagination.lowerWindowLimit();
            }, !0), $scope.$watch("highlightsFilters", function() {
                var filteredList;
                filteredList = $filter("filter")($scope.missionsHighlights, $scope.highlightsFilters), 
                $scope.pagination.numPages = Math.ceil(filteredList.length / $scope.pagination.perPage), 
                $scope.showPaginator = filteredList.length > 0;
            }, !0);
        }), $scope.hideCountryDropdown = function() {
            return "" === $scope.highlightsFilters.region || "USA" === $scope.highlightsFilters.region;
        }, $scope.$watch("currentRegion", function(newVal) {
            var _ref;
            return (null != newVal ? null != (_ref = newVal.region) ? _ref.length : void 0 : void 0) > 0 ? ($scope.highlightsFilters.region = newVal.region, 
            $scope.highlightsFilters.country = "") : $scope.highlightsFilters.region = "";
        }), $scope.numberOfPages = function() {
            return Math.ceil($scope.missionsHighlights.length / $scope.pageSize);
        }, $scope.paginationUpperWindowLimit = 0, $scope.paginationLowerWindowLimit = 2, 
        $scope.isInPageRange = function(n) {
            var currentPage, thisPage, upToPage, _ref, _results;
            return thisPage = parseInt(n, 10), currentPage = $scope.pagination.page, upToPage = currentPage + 2, 
            __indexOf.call(function() {
                _results = [];
                for (var _i = _ref = $scope.paginationLowerWindowLimit, _ref1 = $scope.paginationUpperWindowLimit; _ref1 >= _ref ? _ref1 >= _i : _i >= _ref1; _ref1 >= _ref ? _i++ : _i--) _results.push(_i);
                return _results;
            }.apply(this), thisPage) >= 0 ? !0 : !1;
        }, $scope.continentName = function(continent) {
            return "1" === continent.is_us_map ? "USA" : continent.name;
        };
    } ]), sfControllers.controller("MissionsShowCtrl", [ "$scope", "$routeParams", "$location", "Articles", "HearingMissionArticle", "Pagination", function() {} ]), 
    sfControllers.controller("PressReleasesShowCtrl", [ "$scope", "$routeParams", "PressRelease", "MediaMentionOrPressItem", "api_data", function($scope, $routeParams, PressRelease, MediaMentionOrPressItem, api_data) {
        return $scope.article = {
            prev_item: "",
            next_item: ""
        }, $scope.currentPosition = $routeParams.pressReleaseId, $scope.pressItems = [], 
        PressRelease.get({
            pressReleaseId: $routeParams.pressReleaseId
        }, function(pressItem) {
            return $scope.article = pressItem instanceof Array ? pressItem[0] : pressItem;
        }), $scope.pressItems = api_data.articles, $scope.pressFilters = api_data.filters;
    } ]), sfControllers.controller("ProgramsCtrl", [ "$scope", "$location", function($scope, $location) {
        return $scope.currentTab = $location.path(), $scope.showForm = !1, $scope.$on("$routeChangeStart", function() {
            $scope.currentTab = $location.path();
        });
    } ]), sfControllers.controller("TakeActionCtrl", [ "$scope", "$routeParams", function($scope, $routeParams) {
        return $scope.currentTab = $routeParams, $scope.showForm = !1, $scope.toggleForm = function() {
            return $scope.showForm = !$scope.showForm;
        };
    } ]), sfControllers.controller("PreviewShowCtrl", [ "$scope", "$routeParams", "$sce", "Preview", function($scope, $routeParams, $sce, Preview) {
        return Preview.getDetail($routeParams.articleId).then(function(data) {
            return $scope.article = data;
        });
    } ]);
}).call(this), function() {
    var sfDirectives, __indexOf = [].indexOf || function(item) {
        for (var i = 0, l = this.length; l > i; i++) if (i in this && this[i] === item) return i;
        return -1;
    };
    sfDirectives = angular.module("sfDirectives", [ "ngSanitize", "sfFilters" ]), sfDirectives.directive("href", [ "$location", "$parse", function($location) {
        var link;
        return link = function(scope, element, attrs) {
            var match, url;
            url = attrs.href, 0 !== url.lastIndexOf("mailto:", 0) && url.length > 0 && (match = url.match(/^([^:\/?#]+:)?(?:\/\/([^\/?#]*))?([^?#]+)?(\?[^#]*)?(#.*)?/), 
            null != match && "string" == typeof match[2] && match[2].length > 0 && match[2].toLowerCase() !== $location.host() ? element.attr("target", "_blank") : (match = url.match(/\.([0-9a-z]+)(?:[\?#]|$)/), 
            null != match && "string" == typeof match[1] && match[1].length > 0 && "html" !== match[1].toLowerCase() && element.attr("target", "_blank")));
        };
    } ]), sfDirectives.directive("accordion", [ function() {
        var template;
        return template = '<div class="accordion" ng-transclude></div>', {
            restrict: "EA",
            replace: !0,
            transclude: !0,
            template: template,
            controller: function() {
                var expanders;
                expanders = [], this.gotOpened = function(selectedExpander) {
                    angular.forEach(expanders, function(expander) {
                        selectedExpander !== expander && (expander.showMe = !1);
                    });
                }, this.addExpander = function(expander) {
                    expanders.push(expander);
                };
            }
        };
    } ]), sfDirectives.directive("accordionList", [ function() {
        var link, template;
        return link = function() {}, template = '<div class="accordion-list">\n  <h3>{{title}}</h3>\n  <ul ng-transclude></ul>\n</div>', 
        {
            restrict: "EA",
            replace: !0,
            transclude: !0,
            template: template,
            link: link,
            scope: {
                title: "@"
            }
        };
    } ]), sfDirectives.directive("accordionListItem", [ function() {
        var link, template;
        return link = function() {}, template = '<li class="accordion-list-item">\n  <h3>{{title}}</h3>\n  <h3>{{subhead}}</h3>\n  <div ng-transclude></div>\n</li>', 
        {
            restrict: "EA",
            replace: !0,
            transclude: !0,
            template: template,
            link: link,
            scope: {
                title: "@",
                subhead: "@"
            }
        };
    } ]), sfDirectives.directive("dropdown", [ function() {
        var controller, link, result;
        return link = function(scope) {
            return scope.isActive = !1, scope.currentOption = scope.options[0] || {};
        }, controller = function($scope) {
            var dropdownOptions;
            dropdownOptions = [], this.gotSelected = function(selectedDropdownOption) {
                angular.forEach(dropdownOptions, function(dropdownOption) {
                    selectedDropdownOption === dropdownOption ? ($scope.currentOption = selectedDropdownOption, 
                    $scope.callFilter = $scope.currentOption.value) : dropdownOption.isCurrent = !1;
                });
            }, this.addDropdownOption = function(dropdownOption) {
                dropdownOptions.push(dropdownOption);
            };
        }, result = {
            restrict: "EA",
            transclude: !0,
            replace: !0,
            controller: controller,
            templateUrl: "/templates/dropdown.html",
            link: link,
            scope: {
                options: "=",
                callFilter: "="
            }
        };
    } ]), sfDirectives.directive("dropdownOption", [ function() {
        var link, result;
        return link = function(scope, element, attrs, dropdownController) {
            scope.isSelected = !1, dropdownController.addDropdownOption(scope), scope.selectOption = function() {
                scope.isSelected = !scope.isSelected, dropdownController.gotSelected(scope);
            };
        }, result = {
            restrict: "E",
            replace: !0,
            require: "^?dropdown",
            template: '<li>\n  <a href ng-click="selectOption()">{{name}}</a>\n</li>',
            link: link,
            scope: {
                name: "@",
                value: "@"
            }
        };
    } ]), sfDirectives.directive("expander", [ function() {
        return {
            templateUrl: "/templates/expander.html",
            restrict: "EA",
            replace: !0,
            transclude: !0,
            require: "^?accordion",
            link: function(scope, element, attrs, accordionController) {
                var toggle;
                scope.showMe = !1, accordionController.addExpander(scope), scope.toggle = toggle = function() {
                    scope.showMe = !scope.showMe, accordionController.gotOpened(scope);
                };
            },
            scope: {
                title: "@"
            }
        };
    } ]), sfDirectives.directive("dynamic", [ "$compile", function($compile) {
        return {
            restrict: "A",
            replace: !0,
            link: function(scope, element, attrs) {
                return scope.$watch(attrs.dynamic, function(html) {
                    return element.html(html), $compile(element.contents())(scope);
                });
            }
        };
    } ]), sfDirectives.directive("facebook", [ "$timeout", "$http", function($timeout, $http) {
        return {
            restrict: "E",
            scope: {
                url: "@",
                caption: "@"
            },
            replace: !0,
            templateUrl: "/templates/facebook.html",
            link: function(scope) {
                var endpoint;
                return scope.shares = 0, endpoint = "http://graph.facebook.com/fql?q=SELECT total_count FROM link_stat WHERE url='http://www.facebook.com/starkeycares'", 
                $http.get(endpoint).success(function(res) {
                    return scope.shares = res.data[0].total_count;
                }).error(function() {
                    return scope.shares = 0;
                });
            }
        };
    } ]), sfDirectives.directive("galaThumblistNav", [ "$http", "$sce", "$timeout", function($http, $sce, $timeout) {
        var config, controller, link, _initScrollPane;
        return config = {}, _initScrollPane = function(scope) {
            return $timeout(function() {
                scope.pane = angular.element(".thumblist-nav").jScrollPane(), null !== scope.pane.data() && (scope.api = scope.pane.data().jsp);
            }, 400);
        }, link = function(scope, element) {
            _initScrollPane(scope, element), scope.$watch(function() {
                return element.find(".gala-item").length;
            }, function() {
                return $timeout(function() {
                    null != scope.api && scope.api.reinitialise();
                }, 400);
            }), scope.$on("window.resized", function() {
                return angular.element(".thumblist-nav").jScrollPane().data().jsp.destroy(), _initScrollPane(scope, element);
            });
        }, controller = function($scope) {
            return $scope.getItem = function(url) {
                return $http.get("/api/gala_item/" + url).then(function(response) {
                    return $scope.rawHtml = response.data;
                });
            };
        }, {
            controller: controller,
            restrict: "E",
            link: link,
            templateUrl: "/templates/gala_thumblist_nav.html",
            replace: !0,
            scope: {
                items: "="
            }
        };
    } ]), sfDirectives.directive("gallery", [ "$timeout", function($timeout) {
        var link, template, _initScrollPane;
        return _initScrollPane = function(scope) {
            return $timeout(function() {
                scope.pane = angular.element(".gallery").jScrollPane(), null !== scope.pane.data() && (scope.api = scope.pane.data().jsp);
            }, 400);
        }, link = function(scope, element) {
            var config, _ref;
            null == scope.slides && (scope.slides = 1), scope.isThumblist = function() {
                return scope.slides > 1;
            }, config = {
                showArrows: !0
            }, scope.isFullHeight = function() {
                var _ref;
                return (null != (_ref = scope.full) ? _ref.length : void 0) > 0 && "true" === scope.full;
            }, scope.galleryClasses = function() {
                return scope.isThumblist() ? "gallery" : "single-image-gallery";
            }, (null != (_ref = element.parent()) ? _ref.is("p") : void 0) && element.parent().addClass("no-container"), 
            scope.isThumblist() && (_initScrollPane(scope, element), scope.$watch(function() {
                return element.find(".gallery-slide").length;
            }, function() {
                return $timeout(function() {
                    null != scope.api && scope.api.reinitialise();
                }, 400);
            }), scope.$on("window.resized", function() {
                return angular.element(".gallery").jScrollPane().data().jsp.destroy(), _initScrollPane(scope, element);
            }));
        }, template = '<div ng-class="galleryClasses()" ng-transclude></div>', {
            restrict: "EA",
            link: link,
            template: template,
            transclude: !0,
            replace: !0,
            scope: {
                slides: "@"
            }
        };
    } ]), sfDirectives.directive("gallerySlide", [ "$location", function($location) {
        var link, result;
        return link = function(scope) {
            return null == scope.imageUrl && (scope.imageUrl = ""), null == scope.videoUrl && (scope.videoUrl = ""), 
            null == scope.single && (scope.single = !1), scope.youtubePattern = /^.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]{11,11}).*$/, 
            scope.youtubeId = function() {
                return scope.videoUrl.match(scope.youtubePattern)[1];
            }, scope.hasImageUrl = function() {
                var _ref;
                return (null != (_ref = scope.imageUrl) ? _ref.length : void 0) > 0;
            }, scope.hasVideo = function() {
                var _ref;
                return (null != (_ref = scope.videoUrl) ? _ref.length : void 0) > 0;
            }, scope.getYoutubeVideoThumbnail = function() {
                return scope.hasVideo() ? "http://img.youtube.com/vi/" + scope.youtubeId() + "/1.jpg" : void 0;
            }, scope.getImage = function() {
                return scope.imageUrl || scope.getYoutubeVideoThumbnail();
            }, scope.displayInModalIfVideo = function() {
                return scope.hasVideo() ? (scope.$emit("modal:show", scope.videoUrl), $location.url($location.url() + "?video=" + scope.youtubeId())) : void 0;
            }, scope.slideType = function() {
                return scope.hasVideo() ? "links_to_video" : "plain_image";
            }, scope.slideClasses = function() {
                var classes;
                return classes = scope.hasVideo(), scope.single && (classes += " single"), classes;
            }, scope.backgroundImageStyle = function() {
                return scope.single ? {
                    "background-image": "url(" + scope.getImage() + ")",
                    "background-size": "cover",
                    "background-position": "50% 50%"
                } : void 0;
            }, scope.imageStyle = {
                width: "530px"
            };
        }, result = {
            restrict: "EA",
            replace: !0,
            templateUrl: "/templates/gallery_slide.html",
            link: link,
            scope: {
                imageUrl: "@",
                videoUrl: "@",
                single: "@"
            }
        };
    } ]), sfDirectives.directive("resizer", [ function() {
        return {
            restrict: "A",
            link: function(scope, elem) {
                return elem.on("load", function() {
                    var fixedHeightValue, h, ratio, w;
                    return fixedHeightValue = 525, ratio = $(this).height() / 520, w = $(this).width(), 
                    h = $(this).height(), elem.css({
                        width: "" + Math.round(w / ratio) + "px",
                        height: "525px"
                    });
                });
            }
        };
    } ]), sfDirectives.directive("homeThumblistNav", [ "$timeout", function($timeout) {
        var link, _initScrollPane;
        return _initScrollPane = function(scope) {
            return $timeout(function() {
                scope.pane = angular.element(".thumblist-nav").jScrollPane(), null !== scope.pane.data() && (scope.api = scope.pane.data().jsp);
            }, 400);
        }, link = function(scope, element) {
            _initScrollPane(scope, element), scope.$on("window.resized", function() {
                return angular.element(".thumblist-nav").jScrollPane().data().jsp.destroy(), _initScrollPane(scope, element);
            });
        }, {
            restrict: "EA",
            link: link,
            templateUrl: "/templates/home_thumblist_nav.html",
            replace: !0,
            scope: {
                featured: "=",
                clickaction: "="
            }
        };
    } ]), sfDirectives.directive("jscrollpaneList", [ "$timeout", function($timeout) {
        return function(scope) {
            scope.$last && $timeout(function() {
                return angular.element(".thumblist-nav").jScrollPane();
            }, 400);
        };
    } ]), sfDirectives.directive("instagramGallery", [ "$http", "Instagram", function($http, Instagram) {
        return {
            restrict: "EA",
            scope: {},
            replace: !0,
            templateUrl: "/templates/instagram_gallery.html",
            link: function(scope) {
                return scope.pics = [], Instagram.fetchLatest(function(data) {
                    return scope.pics = data;
                });
            }
        };
    } ]), sfDirectives.directive("latestBlogPost", [ "$http", "LatestBlog", function($http, LatestBlog) {
        return {
            restrict: "EA",
            scope: {},
            replace: !0,
            templateUrl: "/templates/latest_blog_post.html",
            link: function(scope) {
                return scope.article = {}, LatestBlog.fetchLatest().then(function(data) {
                    return scope.article = data;
                });
            }
        };
    } ]), sfDirectives.directive("missionsMap", [ "$timeout", function($timeout) {
        var controller, link;
        return link = function(scope) {
            return scope.worldMapObject = {}, scope.usMapObject = {}, scope.worldMapZIndex = 1, 
            scope.usMapZIndex = 0, scope.currentContinent = {}, scope.currentCountry = {}, scope.selectedList = {}, 
            scope.greetingFlag = !1, scope.mapConfig = {
                zoomOnScroll: !1,
                backgroundColor: "none",
                regionStyle: {
                    selected: {
                        fill: "#ffad20"
                    }
                },
                focusOn: {
                    x: .5,
                    y: .5,
                    scale: .5
                },
                backgroundColor: "#329FD6"
            }, scope.worldMapConfig = _.extend({
                map: "world_mill_en2"
            }, scope.mapConfig), scope.usMapConfig = _.extend({
                map: "us_aea_en"
            }, scope.mapConfig), scope.selectTopLevelList = function(continent) {
                return scope.selectedList = continent, scope.greetingFlag = !0;
            }, scope.initializeMaps = function() {
                $timeout(function() {
                    angular.element("#missions-world-map").vectorMap(scope.worldMapConfig), scope.worldMapObject = angular.element("#missions-world-map").vectorMap("get", "mapObject"), 
                    angular.element("#missions-us-map").vectorMap(scope.usMapConfig), scope.usMapObject = angular.element("#missions-us-map").vectorMap("get", "mapObject");
                }, 500), $timeout(function() {
                    scope.worldMapObject.setFocus(1.15, .82, .47);
                }, 600);
            }, scope.hasContinentAndCountry = function() {
                return scope.hasContinent() || scope.hasCountry();
            }, scope.hasContinent = function() {
                var _ref;
                return null != (null != (_ref = scope.currentContinent) ? _ref.name : void 0);
            }, scope.hasCountry = function() {
                var _ref;
                return null != (null != (_ref = scope.currentCountry) ? _ref.name : void 0);
            }, scope.continentIsVisible = function(continent) {
                return continent.countries_visited.length > 0 && !!continent.total_hearing_aids_provided;
            }, scope.countryClass = function(continent) {
                return null != continent.is_us_map && "1" === continent.is_us_map ? "states" : "countries";
            }, scope.countryOrState = function() {
                return scope.hasContinent() ? scope.countryClass(scope.currentContinent.name) : void 0;
            }, scope.highlightContinentRegions = function(continent, mapObj) {
                var country, countryCodes, _i, _len, _ref;
                for (scope.currentContinent = continent, scope.currentCountry = {}, countryCodes = [], 
                _ref = continent.countries_visited, _i = 0, _len = _ref.length; _len > _i; _i++) country = _ref[_i], 
                countryCodes.push(country.abbreviation);
                countryCodes.length > 0 && (mapObj.clearSelectedRegions(), mapObj.setFocus(countryCodes, .2), 
                mapObj.setSelectedRegions(countryCodes));
            }, scope.highlightCountryRegion = function(country, mapObj) {
                return scope.currentCountry = country, mapObj.clearSelectedRegions(), mapObj.setFocus(country.abbreviation), 
                mapObj.setSelectedRegions(country.abbreviation);
            }, scope.bringUSMapToFront = function(flag, continent) {
                return flag === !0 ? (scope.worldMapZIndex = 0, scope.usMapZIndex = 1, scope.highlightContinentRegions(continent, scope.usMapObject)) : (scope.worldMapZIndex = 1, 
                scope.usMapZIndex = 0, scope.highlightContinentRegions(continent, scope.worldMapObject));
            }, scope.greetingClicked = function() {
                return scope.greetingFlag = !0;
            }, scope.continentName = function(continent) {
                return null != continent.is_us_map && "1" === continent.is_us_map ? "USA" : continent.name;
            }, scope.initializeMaps();
        }, controller = function($scope) {
            return $scope.showContinent = function(continent) {
                "1" === continent.is_us_map ? $scope.bringUSMapToFront(!0, continent) : $scope.bringUSMapToFront(!1, continent);
            }, $scope.showCountry = function(country, continent) {
                var countryCode, _ref;
                countryCode = country.abbreviation, (null != countryCode ? countryCode.length : void 0) > 0 && (null != (_ref = country.total_hearing_aids_provided) ? _ref.length : void 0) > 0 && ("1" === continent.is_us_map ? ($scope.bringUSMapToFront(!0, continent), 
                $scope.highlightCountryRegion(country, $scope.usMapObject)) : ($scope.bringUSMapToFront(!1, continent), 
                $scope.highlightCountryRegion(country, $scope.worldMapObject)));
            };
        }, {
            restrict: "E",
            link: link,
            controller: controller,
            templateUrl: "/templates/missions_map.html",
            replace: !0,
            scope: {
                data: "="
            }
        };
    } ]), sfDirectives.directive("navscrollspy", function($window) {
        return function(scope) {
            angular.element($window).bind("scroll", function() {
                scope.passed = this.pageYOffset >= 120 ? !0 : !1, scope.$apply();
            });
        };
    }), sfDirectives.directive("pageTile", [ function() {
        var link, result;
        return link = function(scope) {
            return null == scope.feedUrl && (scope.feedUrl = ""), null == scope.title && (scope.title = ""), 
            null == scope.date && (scope.date = ""), null == scope.year && (scope.year = ""), 
            null == scope.detailPage && (scope.detailPage = ""), null == scope.type && (scope.type = ""), 
            null == scope.featured && (scope.featured = ""), null == scope.headerImageUrl && (scope.headerImageUrl = ""), 
            null == scope.logoImageUrl && (scope.logoImageUrl = ""), null == scope.quote && (scope.quote = ""), 
            null == scope.callToActionText && (scope.callToActionText = ""), null == scope.callToActionLink && (scope.callToActionLink = ""), 
            null == scope.videoLink && (scope.videoLink = ""), scope.getFormat = function() {
                return "undefined" != typeof scope.dateFormat ? scope.dateFormat : "MMMM d, yyyy";
            }, scope.hasVideo = function() {
                var _ref;
                return (null != (_ref = scope.videoLink) ? _ref.length : void 0) > 0;
            }, scope.getCategory = function() {
                switch (scope.type) {
                  case "press_release":
                    return "Press Release";

                  case "media_mention":
                    return "Media Mention";

                  default:
                    return scope.category;
                }
            }, scope.parseDate = function(date) {
                return Date.parse(date);
            }, scope.linkByType = function() {
                var _ref, _ref1;
                return null != scope.type ? "media_mention" === scope.type ? (null != (_ref = scope.videoLink) ? _ref.length : void 0) > 0 ? "media_mention_with_video" : (null != (_ref1 = scope.detailPage) ? _ref1.length : void 0) > 0 && "true" === scope.detailPage ? "media_mention_with_detail_page" : "media_mention" : scope.type : "default";
            }, scope.displayInModalIfVideo = function() {
                return scope.hasVideo() ? scope.$emit("modal:show", scope.videoLink) : void 0;
            };
        }, result = {
            restrict: "E",
            replace: !0,
            templateUrl: "/templates/page_tile.html",
            link: link,
            scope: {
                id: "@",
                callToActionLink: "@",
                callToActionText: "@",
                category: "@",
                date: "@",
                dateFormat: "=",
                detailPage: "@",
                featured: "@",
                feedUrl: "@",
                headerImageUrl: "@",
                logoImageUrl: "@",
                quote: "@",
                title: "@",
                type: "@",
                videoLink: "@",
                year: "@"
            }
        };
    } ]), sfDirectives.directive("paginatedArticleList", [ "$filter", "Pagination", function($filter, Pagination) {
        var link, result, _composeFilterObject, _composePaginationSettings, _setupWatchers, _updatePaginationWindowLimits;
        return _composeFilterObject = function(filters) {
            var filterObject, l, labels, _i, _len;
            for (labels = _.pluck(filters, "label"), filterObject = {}, _i = 0, _len = labels.length; _len > _i; _i++) l = labels[_i], 
            filterObject[l] = "";
            return filterObject;
        }, _composePaginationSettings = function(scope) {
            var pageConfig, pagination;
            return pagination = Pagination.getNew(scope.perPage), pagination.numPages = 0, pageConfig = _.extend({
                pagination: pagination
            }, {
                isAtPaginationEnd: !1,
                currentPage: 0,
                pageStart: 0
            });
        }, _updatePaginationWindowLimits = function(scope) {
            return scope.paginationUpperWindowLimit = scope.pagination.upperWindowLimit(), scope.paginationLowerWindowLimit = scope.pagination.lowerWindowLimit();
        }, _setupWatchers = function(scope) {
            return scope.$watch("articlesFilterObject", function() {
                scope.filteredList = $filter("filter")(scope.articles, scope.articlesFilterObject), 
                scope.pagination.numPages = Math.ceil(scope.filteredList.length / scope.pagination.perPage), 
                scope.isAtPaginationEnd = scope.mobileStop >= scope.filteredList.length, scope.showPaginator = 0 === scope.filteredList.length ? !1 : scope.articles.length > scope.pagination.perPage;
            }, !0), scope.$watch("articles", function() {
                scope.pagination.numPages = null != scope.articles ? Math.ceil(scope.articles.length / scope.pagination.perPage) : scope.pagination.numPages;
            }, !0), scope.$watch("pagination", function() {
                scope.pageStart = scope.pagination.page * scope.perPage, scope.currentPage = scope.pagination.page * scope.pagination.perPage, 
                _updatePaginationWindowLimits(scope);
            }, !0);
        }, link = function(scope) {
            scope = _.extend(scope, _composePaginationSettings(scope)), scope.articlesFilterObject = _composeFilterObject(scope.filters), 
            scope.mobileStop = scope.pagination.perPage, scope.paginationUpperWindowLimit = 0, 
            scope.paginationLowerWindowLimit = 3, scope.filteredList = [], scope.parseDate = function(date) {
                return Date.parse(date);
            }, scope.loadMore = function() {
                scope.pagination.nextPage(), scope.mobileStop = parseInt(scope.mobileStop, 10) + parseInt(scope.pagination.perPage, 10), 
                scope.filteredList = $filter("filter")(scope.articles, scope.articlesFilterObject), 
                scope.isAtPaginationEnd = scope.mobileStop >= scope.filteredList.length;
            }, _setupWatchers(scope), scope.isInPageRange = function(n) {
                var currentPage, thisPage, upToPage, _ref, _results;
                return thisPage = parseInt(n, 10), currentPage = scope.pagination.page, upToPage = currentPage + 2, 
                __indexOf.call(function() {
                    _results = [];
                    for (var _i = _ref = scope.paginationLowerWindowLimit, _ref1 = scope.paginationUpperWindowLimit; _ref1 >= _ref ? _ref1 >= _i : _i >= _ref1; _ref1 >= _ref ? _i++ : _i--) _results.push(_i);
                    return _results;
                }.apply(this), thisPage) >= 0 ? !0 : !1;
            };
        }, result = {
            restrict: "EA",
            transclude: !0,
            replace: !0,
            templateUrl: "/templates/paginated_article_list.html",
            link: link,
            scope: {
                perPage: "@",
                articles: "=",
                filters: "="
            }
        };
    } ]), sfDirectives.directive("paginatedPressList", [ "$filter", "Pagination", function($filter, Pagination) {
        var link, result, _composeFilterObject, _composePaginationSettings, _setupWatchers, _updatePaginationWindowLimits;
        return _composeFilterObject = function(filters) {
            var filterObject, l, labels, _i, _len;
            for (labels = _.pluck(filters, "label"), filterObject = {}, _i = 0, _len = labels.length; _len > _i; _i++) l = labels[_i], 
            filterObject[l] = "";
            return filterObject;
        }, _composePaginationSettings = function(scope) {
            var pageConfig, pagination;
            return pagination = Pagination.getNew(scope.perPage), pagination.numPages = 0, pageConfig = _.extend({
                pagination: pagination
            }, {
                isAtPaginationEnd: !1,
                currentPage: 0,
                pageStart: 0
            });
        }, _updatePaginationWindowLimits = function(scope) {
            return scope.paginationUpperWindowLimit = scope.pagination.upperWindowLimit(), scope.paginationLowerWindowLimit = scope.pagination.lowerWindowLimit();
        }, _setupWatchers = function(scope) {
            return scope.$watch("articlesFilterObject", function() {
                scope.filteredList = $filter("filter")(scope.articles, scope.articlesFilterObject), 
                scope.pagination.numPages = Math.ceil(scope.filteredList.length / scope.pagination.perPage), 
                scope.isAtPaginationEnd = scope.mobileStop >= scope.filteredList.length, scope.showPaginator = 0 === scope.filteredList.length ? !1 : scope.articles.length > scope.pagination.perPage;
            }, !0), scope.$watch("articles", function() {
                scope.pagination.numPages = null != scope.articles ? Math.ceil(scope.articles.length / scope.pagination.perPage) : scope.pagination.numPages;
            }, !0), scope.$watch("pagination", function() {
                scope.pageStart = scope.pagination.page * scope.perPage, scope.currentPage = scope.pagination.page * scope.pagination.perPage, 
                _updatePaginationWindowLimits(scope);
            }, !0);
        }, link = function(scope) {
            scope = _.extend(scope, _composePaginationSettings(scope)), scope.articlesFilterObject = _composeFilterObject(scope.filters), 
            scope.mobileStop = scope.pagination.perPage, scope.paginationUpperWindowLimit = 0, 
            scope.paginationLowerWindowLimit = 3, scope.filteredList = [], scope.parseDate = function(date) {
                return Date.parse(date);
            }, scope.loadMore = function() {
                scope.pagination.nextPage(), scope.mobileStop = parseInt(scope.mobileStop, 10) + parseInt(scope.pagination.perPage, 10), 
                scope.filteredList = $filter("filter")(scope.articles, scope.articlesFilterObject), 
                scope.isAtPaginationEnd = scope.mobileStop >= scope.filteredList.length;
            }, _setupWatchers(scope), scope.isInPageRange = function(n) {
                var currentPage, thisPage, upToPage, _ref, _results;
                return thisPage = parseInt(n, 10), currentPage = scope.pagination.page, upToPage = currentPage + 2, 
                __indexOf.call(function() {
                    _results = [];
                    for (var _i = _ref = scope.paginationLowerWindowLimit, _ref1 = scope.paginationUpperWindowLimit; _ref1 >= _ref ? _ref1 >= _i : _i >= _ref1; _ref1 >= _ref ? _i++ : _i--) _results.push(_i);
                    return _results;
                }.apply(this), thisPage) >= 0 ? !0 : !1;
            };
        }, result = {
            restrict: "EA",
            transclude: !0,
            replace: !0,
            templateUrl: "/templates/paginated_press_list.html",
            link: link,
            scope: {
                perPage: "@",
                articles: "=",
                filters: "="
            }
        };
    } ]), sfDirectives.factory("Pagination", function() {
        var pagination;
        return pagination = {}, pagination.getNew = function(perPage) {
            var paginator;
            return null == perPage && (perPage = 5), paginator = {
                numPages: 1,
                perPage: perPage,
                page: 0,
                windowSize: 3
            }, paginator.prevPage = function() {
                return paginator.page > 0 ? paginator.page -= 1 : void 0;
            }, paginator.nextPage = function() {
                return paginator.page < paginator.numPages - 1 ? paginator.page += 1 : void 0;
            }, paginator.toPageId = function(id) {
                return id >= 0 && id <= paginator.numPages - 1 ? paginator.page = id : void 0;
            }, paginator.upperWindowLimit = function() {
                return 0 === paginator.page ? 2 : paginator.page + 1;
            }, paginator.lowerWindowLimit = function() {
                return paginator.page <= 1 ? 0 : paginator.page === paginator.numPages - 1 ? paginator.page - (paginator.windowSize - 1) : paginator.page - 1;
            }, paginator;
        }, pagination;
    }), sfDirectives.directive("panelTab", [ function() {
        var link;
        return link = function(scope) {
            return scope.hasVideo = function() {
                var _ref, _ref1;
                return (null != (_ref = scope.featured) ? null != (_ref1 = _ref.video_link_url) ? _ref1.length : void 0 : void 0) > 0;
            }, scope.displayInModalIfVideo = function() {
                return scope.$emit("modal:show", scope.featured.video_link_url);
            }, scope.showActionLink = function() {
                var _ref, _ref1;
                return (null != (_ref = scope.featured) ? null != (_ref1 = _ref.panel_call_to_action_link_url) ? _ref1.length : void 0 : void 0) > 0;
            };
        }, {
            restrict: "EA",
            templateUrl: "/templates/panel_tab.html",
            replace: !0,
            link: link,
            scope: {
                featured: "="
            }
        };
    } ]), sfDirectives.directive("regionDropdown", [ function() {
        var link, result;
        return link = function(scope) {
            return scope.isActive = !1, scope.countryDropdownIsActive = !1, scope.yearDropdownIsActive = !1, 
            scope.currentRegion = {
                region: ""
            }, scope.currentRegionLabel = "REGIONS", scope.currentCountryLabel = "COUNTRIES", 
            scope.currentYearLabel = scope.yearsCollection[0].name, scope.chooseRegion = function(region) {
                return scope.currentRegion = region, scope.filterObject.region = region.region, 
                scope.filterObject.country = "", scope.currentRegionLabel = scope.currentRegion.region.length > 0 ? scope.currentRegion.region : "REGIONS", 
                scope.countryDropdownIsActive = !1, scope.currentCountryLabel = "COUNTRIES";
            }, scope.chooseCountry = function(country) {
                return scope.filterObject.country = country, scope.currentCountryLabel = country;
            }, scope.chooseYear = function(year) {
                return scope.filterObject.year = year.value, scope.currentYearLabel = year.name;
            }, scope.hasSelectedRegion = function() {
                return scope.currentRegion.region.length && "USA" !== scope.currentRegion.region;
            };
        }, result = {
            restrict: "EA",
            transclude: !0,
            replace: !0,
            templateUrl: "/templates/region_dropdown.html",
            link: link,
            scope: {
                regionsCollection: "=",
                yearsCollection: "=",
                filterObject: "="
            }
        };
    } ]), sfDirectives.directive("scrollToPosition", [ function() {
        return {
            restrict: "A",
            link: function(scope, element, attrs) {
                var idToScrollTo;
                return idToScrollTo = attrs.scrollToPosition, element.on("click", function() {
                    return $("body").animate({
                        scrollTop: $("#" + idToScrollTo).offset().top
                    }, "slow");
                });
            },
            scope: {}
        };
    } ]), sfDirectives.directive("slide", [ function() {
        var controller, link, result;
        return link = function(scope) {
            return null == scope.detailPage && (scope.detailPage = ""), null == scope.imageUrl && (scope.imageUrl = ""), 
            null == scope.videoUrl && (scope.videoUrl = ""), null == scope.linkUrl && (scope.linkUrl = ""), 
            null == scope.linkText && (scope.linkText = ""), null == scope.headline && (scope.headline = ""), 
            null == scope.bodyCopy && (scope.bodyCopy = ""), null == scope.thumblist && (scope.thumblist = "false"), 
            null == scope.date && (scope.date = ""), null == scope.blogCategory && (scope.blogCategory = ""), 
            null == scope.quote && (scope.quote = ""), null == scope.backgroundColor && (scope.backgroundColor = ""), 
            null == scope.logoImageUrl && (scope.logoImageUrl = ""), null == scope.linkStyle && (scope.linkStyle = ""), 
            null == scope.layout && (scope.layout = ""), null == scope.subhead && (scope.subhead = ""), 
            scope.youtubePattern = /^.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]{11,11}).*$/, 
            scope.hasSidePanel = function() {
                var _ref;
                return (null != (_ref = scope.layout) ? _ref.length : void 0) > 0 && "side-panel" === scope.layout;
            }, scope.youtubeId = function() {
                return null != scope.videoUrl.match(scope.youtubePattern) ? scope.videoUrl.match(scope.youtubePattern)[1] : "";
            }, scope.hasVideo = function() {
                var _ref;
                return (null != (_ref = scope.videoUrl) ? _ref.length : void 0) > 0;
            }, scope.hasBlogCategory = function() {
                var _ref;
                return (null != (_ref = scope.blogCategory) ? _ref.length : void 0) > 0;
            }, scope.hasDate = function() {
                var _ref;
                return (null != (_ref = scope.date) ? _ref.length : void 0) > 0;
            }, scope.hasDetailPage = function() {
                var _ref;
                return (null != (_ref = scope.detailPage) ? _ref.length : void 0) > 0 && "true" === scope.detailPage;
            }, scope.hasLinkText = function() {
                var _ref;
                return (null != (_ref = scope.linkText) ? _ref.length : void 0) > 0;
            }, scope.hasLinkStyle = function() {
                var _ref;
                return (null != (_ref = scope.linkStyle) ? _ref.length : void 0) > 0;
            }, scope.hasQuote = function() {
                var _ref;
                return (null != (_ref = scope.quote) ? _ref.length : void 0) > 0;
            }, scope.hasHeadline = function() {
                var _ref;
                return (null != (_ref = scope.headline) ? _ref.length : void 0) > 0;
            }, scope.hasBodyCopy = function() {
                var _ref;
                return (null != (_ref = scope.bodyCopy) ? _ref.length : void 0) > 0;
            }, scope.hasLogoImageUrl = function() {
                var _ref;
                return (null != (_ref = scope.logoImageUrl) ? _ref.length : void 0) > 0;
            }, scope.isThumblist = function() {
                var _ref;
                return (null != (_ref = scope.thumblist) ? _ref.length : void 0) > 0 && "true" === scope.thumblist;
            }, scope.hasSubhead = function() {
                var _ref;
                return (null != (_ref = scope.subhead) ? _ref.length : void 0) > 0;
            }, scope.getYoutubeVideoThumbnail = function() {
                var _ref;
                return scope.hasVideo() && (null != (_ref = scope.youtubeId()) ? _ref.length : void 0) > 0 ? "http://img.youtube.com/vi/" + scope.youtubeId() + "/1.jpg" : void 0;
            }, scope.getImage = function() {
                return scope.imageUrl || scope.getYoutubeVideoThumbnail();
            }, scope.backgroundImageStyle = scope.hasQuote() ? {
                background: scope.backgroundColor
            } : {
                "background-image": "url(" + scope.getImage() + ")"
            }, scope.actionLinkStyle = function() {
                return scope.isThumblist() ? "call-to-action " + scope.linkStyle : scope.hasVideo() ? "action-link video-link " + scope.linkStyle : scope.hasLinkText() && !scope.hasDetailPage() ? "action-link text-link " + scope.linkStyle : "action-link " + scope.linkStyle;
            }, scope.displayInModalIfVideo = function() {
                return scope.hasVideo() ? scope.$emit("modal:show", scope.videoUrl) : void 0;
            };
        }, controller = function() {}, result = {
            restrict: "EA",
            controller: controller,
            replace: !0,
            templateUrl: function(elem, attr) {
                return null != attr.thumblist && "true" === attr.thumblist ? "/templates/thumb_slide.html" : "/templates/swipe_slide.html";
            },
            link: link,
            scope: {
                backgroundColor: "@",
                blogCategory: "@",
                bodyCopy: "@",
                date: "@",
                detailPage: "@",
                headline: "@",
                imageUrl: "@",
                layout: "@",
                linkStyle: "@",
                linkText: "@",
                linkUrl: "@",
                logoImageUrl: "@",
                quote: "@",
                subhead: "@",
                thumblist: "@",
                videoUrl: "@"
            }
        };
    } ]), sfDirectives.directive("swiper", [ "$timeout", function($timeout) {
        var controller, link;
        return link = function(scope, element, attrs) {
            var config, _ref, _ref1;
            null == scope.size && (scope.size = "tall"), scope.childSlides = element.children().eq(2).children().eq(0).children(), 
            config = void 0, config = {}, config.auto = (null != (_ref = attrs.auto) ? _ref.length : void 0) > 0 ? attrs.auto : !1, 
            config.speed = parseInt(attrs.speed, 10) || 500, attrs.disableScroll && (config.disableScroll = !!attrs.disableScroll), 
            attrs.continuous && (config.continuous = !!attrs.continuous), $timeout(function() {
                return scope.swipe = new Swipe(document.getElementById(scope.identifier), {
                    auto: config.auto,
                    speed: config.speed,
                    disableScroll: config.disableScroll,
                    continuous: config.continuous,
                    callback: function(pos) {
                        return scope.setAsCurrent(scope.swipeControls[pos]);
                    }
                });
            }, 1e3), scope.showPaginator = function() {
                return null != scope.paginator && "true" === scope.paginator;
            }, scope.hasSize = function() {
                return null != scope.size && scope.size.length > 0;
            }, scope.addSize = function() {
                var sizeClass;
                return scope.hasSize && (sizeClass = scope.size), sizeClass;
            }, scope.setAsCurrent = function(selectedSwipeControl) {
                angular.forEach(scope.swipeControls, function(swipeControl) {
                    swipeControl.safeApply(function() {
                        return swipeControl.toggleActiveState(selectedSwipeControl === swipeControl);
                    });
                });
            }, (null != (_ref1 = element.parent()) ? _ref1.is("p") : void 0) && element.parent().addClass("no-container");
        }, controller = function($scope) {
            $scope.next = function() {
                return $scope.swipe.next();
            }, $scope.prev = function() {
                return $scope.swipe.prev();
            }, $scope.slide = function(index) {
                return $scope.swipe.slide(index);
            }, $scope.stop = function() {
                return $scope.swipe.stop();
            }, $scope.swipeControls = [], this.setAsCurrent = function(selectedSwipeControl, pos) {
                angular.forEach($scope.swipeControls, function(swipeControl) {
                    selectedSwipeControl === swipeControl ? (swipeControl.isCurrent = !0, $scope.slide(pos), 
                    $scope.swipe.stop()) : swipeControl.isCurrent = !1;
                });
            }, this.addSwipeControl = function(swipeControl) {
                $scope.swipeControls.push(swipeControl);
            };
        }, {
            restrict: "EA",
            controller: controller,
            link: link,
            templateUrl: "/templates/swipe.html",
            transclude: !0,
            replace: !0,
            scope: {
                identifier: "@",
                paginator: "@",
                size: "@"
            }
        };
    } ]), sfDirectives.directive("swipePaginator", [ "$compile", function() {
        var link;
        return link = function(scope, element, attrs, swiperController) {
            return scope.isCurrent = "0" === scope.position ? !0 : !1, swiperController.addSwipeControl(scope), 
            scope.toggle = function(pos) {
                swiperController.setAsCurrent(scope, pos);
            }, scope.toggleActiveState = function(flag) {
                return scope.isCurrent = flag;
            }, scope.safeApply = function(fn) {
                var phase;
                phase = this.$root.$$phase, "$apply" === phase || "$digest" === phase ? fn && "function" == typeof fn && fn() : this.$apply(fn);
            };
        }, {
            restrict: "EA",
            template: '<li ng-click="toggle(position)" ng-class="{on:isCurrent==true}"></li>',
            transclude: !0,
            replace: !0,
            require: "^?swiper",
            link: link,
            scope: {
                position: "@"
            }
        };
    } ]), sfDirectives.directive("tabbedNav", [ "$location", function($location) {
        var link;
        return link = function(scope) {
            return console.log(scope), scope.location = $location;
        }, {
            restrict: "EA",
            link: link,
            templateUrl: "/templates/tabbed_nav.html",
            transclude: !0,
            replace: !0,
            scope: {
                tabClass: "@",
                tabs: "="
            }
        };
    } ]), sfDirectives.directive("thumblistNav", [ "$timeout", "$window", function($timeout) {
        var link, template, _initScrollPane;
        return _initScrollPane = function(scope) {
            return $timeout(function() {
                scope.pane = angular.element(".thumblist-nav").jScrollPane(), scope.api = scope.pane.data().jsp;
            }, 400);
        }, link = function(scope, element) {
            var _ref;
            return scope.config = {
                showArrows: !1
            }, _initScrollPane(scope, element), scope.$watch(function() {
                return element.find(".slide").length;
            }, function() {
                return $timeout(function() {
                    null != scope.api && scope.api.reinitialise();
                }, 400);
            }), scope.$on("window.resized", function() {
                return angular.element(".thumblist-nav").jScrollPane().data().jsp.destroy(), _initScrollPane(scope, element);
            }), scope.isFullHeight = function() {
                var _ref;
                return (null != (_ref = scope.full) ? _ref.length : void 0) > 0 && "true" === scope.full;
            }, scope.thumbClasses = function() {
                return scope.isFullHeight() ? "full thumblist thumblist-nav horizontal-only" : "thumblist thumblist-nav horizontal-only";
            }, (null != (_ref = element.parent()) ? _ref.is("p") : void 0) ? element.parent().addClass("no-container") : void 0;
        }, template = '<div ng-class="thumbClasses()" ng-transclude></div>', {
            restrict: "EA",
            link: link,
            template: template,
            transclude: !0,
            replace: !0,
            scope: {
                full: "@"
            }
        };
    } ]), sfDirectives.directive("videoPlayerModal", [ "$window", function() {
        return {
            restrict: "EA",
            scope: {
                show: "="
            },
            replace: !0,
            transclude: !0,
            link: function(scope, element, attrs) {
                return scope.dialogStyle = {}, attrs.width && (scope.dialogStyle.width = attrs.width), 
                attrs.height && (scope.dialogStyle.height = attrs.height), scope.playerDiv = angular.element(element.find("div")[3]), 
                scope.bodyDiv = document.getElementsByTagName("body")[0], scope.iframeContent = "", 
                scope.hideModal = function() {
                    return scope.show = !1, scope.$emit("modal:hide");
                }, scope.$watch("show", function(newVal, oldVal) {
                    return newVal && !oldVal ? (scope.iframeContent = newVal.replace(/(?:http(?:s?):\/\/)?(?:www\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=)?(.+)/g, '<iframe width="100%" height="100%" src="http://www.youtube.com/embed/$1?autoplay=1" frameborder="0" allowfullscreen></iframe>'), 
                    scope.bodyDiv.style.overflow = "hidden") : (scope.bodyDiv.style.overflow = "", scope.iframeContent = "");
                });
            },
            templateUrl: "/templates/video_player_modal.html"
        };
    } ]), sfDirectives.directive("worldMap", [ "$timeout", function($timeout) {
        return {
            restrict: "EA",
            templateUrl: "/templates/world_map.html",
            transclude: !0,
            replace: !0,
            scope: {
                markers: "="
            },
            link: function(scope) {
                var createImagePattern, generateMap;
                $(".map-legend").css({
                    left: "" + (window.innerWidth - 210) + "px"
                }), createImagePattern = function(id, url) {
                    var image, pattern, svgMap, svgNS, svgNSXLink;
                    return svgMap = angular.element(".jvectormap-container > svg").get(0), svgNS = "http://www.w3.org/2000/svg", 
                    svgNSXLink = "http://www.w3.org/1999/xlink", svgMap.setAttribute("xmlns", svgNS), 
                    svgMap.setAttribute("xmlns:link", svgNSXLink), svgMap.setAttribute("xmlns:ev", "http://www.w3.org/2001/xml-events"), 
                    pattern = document.createElementNS(svgNS, "pattern"), pattern.setAttribute("id", id), 
                    pattern.setAttribute("width", "30"), pattern.setAttribute("height", "30"), image = document.createElementNS(svgNS, "image"), 
                    image.setAttribute("x", "0"), image.setAttribute("y", "0"), image.setAttribute("width", "24"), 
                    image.setAttribute("height", "24"), image.setAttributeNS(svgNSXLink, "xlink:href", url), 
                    svgMap.appendChild(pattern), void pattern.appendChild(image);
                }, generateMap = function() {
                    var icon, markerList, wolrd_map, _i, _len, _ref;
                    for (markerList = null != scope.markers ? scope.markers : {
                        coords: [],
                        icons: []
                    }, wolrd_map = angular.element("#world-map-gdp"), wolrd_map.vectorMap({
                        map: "world_mill_en",
                        markers: markerList.coords,
                        markersSelectableOne: !0,
                        zoomOnScroll: !1,
                        markerStyle: {
                            initial: {
                                "stroke-width": 0,
                                "stroke-opacity": 0,
                                r: 12
                            },
                            hover: {
                                stroke: "#1b74a4",
                                "stroke-opacity": 1,
                                "stroke-width": 2
                            }
                        },
                        backgroundColor: "#329FD6",
                        onMarkerClick: function(event, index) {
                            var $popup, bodyDiv, content, ctaTpl, popupTpl;
                            return content = markerList.meta_data[index], $popup = $("#map-popup"), $popup.css({
                                left: "" + window.innerWidth / 2 + "px"
                            }), bodyDiv = document.getElementsByTagName("body")[0], ctaTpl = content.action_text ? "<p class='centered'><a class='read-more' href='" + content.action_target + "'>" + content.action_text + "</a></p>" : "", 
                            popupTpl = "            <span class='close' ng-click='closePopup()'>X</span>            <img src='" + content.thumbnail_url + "' />            <a href='" + content.action_target + "' class='play-video-link " + content.marker_type + "'>&nbsp;</a>            <div class='background-popup'>              <div class='text-popup-container'>                <div class='text-popup'>                  <h2>" + content.title + "</h2>                  <span class='location'>" + content.location + "</span>                  <p>" + content.text + "</p>                  " + ctaTpl + "                </div>              </div>            </div>          ", 
                            $popup.fadeOut("slow", function() {
                                return $popup.removeClass("visible").find(".content").empty().html(popupTpl), $popup.fadeIn("slow", function() {
                                    return $timeout(function() {
                                        return $popup.addClass("visible").find(".text-popup").jScrollPane();
                                    }, 200);
                                }), $("html, body").animate({
                                    scrollTop: $("#world-map-gdp").offset().top - 88
                                }, "slow"), $popup.find(".close").click(function() {
                                    return $popup.fadeOut().find(".text-popup").jScrollPane().data().jsp.destroy(), 
                                    bodyDiv.style.overflow = "";
                                });
                            });
                        }
                    }), _ref = markerList.icons, _i = 0, _len = _ref.length; _len > _i; _i++) icon = _ref[_i], 
                    createImagePattern(icon.id, icon.path);
                }, $timeout(generateMap, 1200);
            }
        };
    } ]), $(function() {
        return $(document).on("mouseenter", "#map-popup .text-popup-container", function() {
            return $("body").css("overflow", "hidden");
        }), $(document).on("mouseleave", "#map-popup .text-popup-container", function() {
            return $("body").css("overflow", "auto");
        });
    }), sfDirectives.directive("validSubmit", [ "$parse", "$http", "$rootScope", function($parse, $http, $rootScope) {
        return {
            require: "form",
            link: function(scope, element, attr, form) {
                form.$submitted = !1, element.on("submit", function(event) {
                    scope.$apply(function() {
                        form.$submitted = !0, form.$valid && ($http({
                            method: "POST",
                            url: attr.action,
                            data: element.serialize(),
                            headers: {
                                "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
                                X_REQUESTED_WITH: "XMLHttpRequest"
                            }
                        }).success(function(data, status, headers) {
                            angular.element("input[name=xid]").val(headers("X-EEXID")), $rootScope.showThanks = !0, 
                            scope.showSubscribeForm = !1, scope.showForm = !1;
                        }), form.$submitted = !1), event.preventDefault();
                    });
                });
            }
        };
    } ]);
}.call(this), function() {
    var sfFilters;
    sfFilters = angular.module("sfFilters", [ "sfServices" ]), sfFilters.filter("startFrom", function() {
        return function(input, start) {
            return input.slice(+start);
        };
    }), sfFilters.filter("range", function() {
        return function(input, total) {
            var i;
            for (total = parseInt(total), i = 0; total > i; ) input.push(i), i++;
            return input;
        };
    }), sfFilters.filter("youtubeIframe", [ "$filter", "Youtube", function($filter, Youtube) {
        return function(value) {
            var videoid;
            return value ? (videoid = value.match(Youtube.regex()), null === videoid ? "" : "//www.youtube.com/embed/" + videoid[1]) : value;
        };
    } ]), sfFilters.filter("youtubeImage", [ "$filter", "Youtube", function($filter, Youtube) {
        return function(value, quality) {
            var videoid;
            return quality = quality || "default", value ? (videoid = value.match(Youtube.regex()), 
            null === videoid ? "" : "https://img.youtube.com/vi/" + videoid[1] + "/" + quality + ".jpg") : value;
        };
    } ]), sfFilters.filter("strip", [ function() {
        return function(text) {
            return null != text ? text.replace(/^\s+|\s+$/g, "") : void 0;
        };
    } ]);
}.call(this), function() {
    var FB_ID, HomePageApp, blogPagesApp, galaPageApp, legalPagesApp, mediaMentionsPagesApp, missionsPageApp, previewPageApp, programsPageApp, requiredModules, takeActionPagesApp;
    requiredModules = [ "ngRoute", "ngAnimate", "ngSanitize", "truncate", "sfControllers", "sfDirectives", "sfFilters", "sfServices", "ng.shims.placeholder" ], 
    FB_ID = "1391926457745223", blogPagesApp = angular.module("blogPagesApp", requiredModules), 
    blogPagesApp.run(function($FB) {
        return $FB.init(FB_ID);
    }), blogPagesApp.run(function($rootScope, $location, $anchorScroll) {
        return $rootScope.$on("$routeChangeSuccess", function() {
            return $anchorScroll();
        });
    }), blogPagesApp.config([ "$routeProvider", function($routeProvider) {
        return $routeProvider.when("/articles", {
            templateUrl: "/partials/articles/index.html",
            controller: "BlogIndexCtrl",
            resolve: {
                api_data: [ "Articles", function(Articles) {
                    return Articles.getIndex().then(function(data) {
                        return data;
                    });
                } ]
            }
        }).when("/articles/:articleId", {
            templateUrl: function(params) {
                return "/api/blog_detail/" + params.articleId;
            },
            controller: "BlogShowCtrl",
            resolve: {
                api_data: [ "Articles", function(Articles) {
                    return Articles.getIndex().then(function(data) {
                        return data;
                    });
                } ]
            }
        }).otherwise({
            redirectTo: "/articles"
        });
    } ]), galaPageApp = angular.module("galaPageApp", requiredModules), galaPageApp.run(function($FB) {
        return $FB.init(FB_ID);
    }), galaPageApp.config([ "$routeProvider", function($routeProvider) {
        return $routeProvider.when("/gala/:tabId", {
            templateUrl: function(params) {
                return "/api/gala_" + params.tabId;
            },
            controller: "GalaCtrl"
        }).otherwise({
            redirectTo: "/gala/overview"
        });
    } ]), legalPagesApp = angular.module("legalPagesApp", requiredModules), legalPagesApp.run(function($FB) {
        return $FB.init(FB_ID);
    }), mediaMentionsPagesApp = angular.module("mediaMentionsPagesApp", requiredModules), 
    mediaMentionsPagesApp.run(function($FB) {
        return $FB.init(FB_ID);
    }), mediaMentionsPagesApp.run(function($rootScope, $location, $anchorScroll) {
        return $rootScope.$on("$routeChangeSuccess", function() {
            return $anchorScroll();
        });
    }), mediaMentionsPagesApp.config([ "$routeProvider", function($routeProvider) {
        return $routeProvider.when("/media_mentions", {
            templateUrl: "/partials/media_mentions/index.html",
            controller: "MediaMentionsIndexCtrl",
            resolve: {
                api_data: [ "MediaMentionOrPressItem", function(MediaMentionOrPressItem) {
                    return MediaMentionOrPressItem.getIndex().then(function(data) {
                        return data;
                    });
                } ]
            }
        }).when("/press_releases/:pressReleaseId", {
            templateUrl: "/partials/press_releases/show.html",
            controller: "PressReleasesShowCtrl",
            resolve: {
                api_data: [ "MediaMentionOrPressItem", function(MediaMentionOrPressItem) {
                    return MediaMentionOrPressItem.getIndex().then(function(data) {
                        return data;
                    });
                } ]
            }
        }).when("/media_mentions/:mediaMentionId", {
            templateUrl: "/partials/media_mentions/show.html",
            controller: "MediaMentionsShowCtrl",
            resolve: {
                api_data: [ "MediaMentionOrPressItem", function(MediaMentionOrPressItem) {
                    return MediaMentionOrPressItem.getIndex().then(function(data) {
                        return data;
                    });
                } ]
            }
        }).otherwise({
            redirectTo: "/media_mentions"
        });
    } ]), missionsPageApp = angular.module("missionsPageApp", requiredModules), missionsPageApp.run(function($FB) {
        return $FB.init(FB_ID);
    }), missionsPageApp.run(function($rootScope, $location, $anchorScroll) {
        return $rootScope.$on("$routeChangeSuccess", function() {
            return $anchorScroll();
        });
    }), missionsPageApp.config([ "$routeProvider", function($routeProvider) {
        return $routeProvider.when("/missions", {
            templateUrl: "/partials/missions/landing.html",
            controller: "MissionsPageCtrl"
        }).when("/highlights", {
            templateUrl: function() {
                return "/partials/missions/index.html";
            },
            controller: "MissionsIndexCtrl"
        }).when("/missions/:articleId", {
            templateUrl: function(params) {
                return "/api/missions_detail/" + params.articleId;
            },
            controller: "MissionsShowCtrl"
        }).otherwise({
            redirectTo: "/missions"
        });
    } ]), programsPageApp = angular.module("programsPageApp", requiredModules), programsPageApp.run(function($FB) {
        return $FB.init(FB_ID);
    }), programsPageApp.config([ "$routeProvider", function($routeProvider) {
        return $routeProvider.when("/operationchange", {
            templateUrl: "/api/program_0",
            controller: "ProgramsCtrl"
        }).when("/listencarefully", {
            templateUrl: "/api/program_1",
            controller: "ProgramsCtrl"
        }).when("/hearnow", {
            templateUrl: "/api/program_2",
            controller: "ProgramsCtrl"
        }).when("/hearingaidrecycling", {
            templateUrl: "/api/program_3",
            controller: "ProgramsCtrl"
        }).otherwise({
            redirectTo: "/listencarefully"
        });
    } ]), takeActionPagesApp = angular.module("takeActionPagesApp", requiredModules), 
    takeActionPagesApp.run(function($FB) {
        return $FB.init(FB_ID);
    }), takeActionPagesApp.config([ "$routeProvider", function($routeProvider) {
        return $routeProvider.when("/:tabId", {
            templateUrl: function(params) {
                return "/api/" + params.tabId;
            },
            controller: "TakeActionCtrl"
        }).otherwise({
            redirectTo: "/fundraising"
        });
    } ]), HomePageApp = angular.module("homePageApp", requiredModules), HomePageApp.run(function($FB) {
        return $FB.init("1391926457745223");
    }), previewPageApp = angular.module("previewPageApp", requiredModules), previewPageApp.run(function($FB) {
        return $FB.init(FB_ID);
    }), previewPageApp.config([ "$routeProvider", function($routeProvider) {
        return $routeProvider.when("/:articleId", {
            templateUrl: function(params) {
                return "/api/blog_detail/" + params.articleId;
            },
            controller: "PreviewShowCtrl"
        });
    } ]);
}.call(this), function() {
    $(function() {
        var header, mask, menu, submenus, trigger;
        return twitterFetcher.fetch("441358329231572992", "twitter", 1, !0), mask = $(".mobile-menu-mask"), 
        trigger = $(".mobile-menu-icon .icon"), menu = $(".mobile-menu"), submenus = $(".mobile-menu .main-menu > li"), 
        header = $("header"), trigger.click(function() {
            return mask.toggleClass("active"), menu.toggleClass("active"), header.toggleClass("active");
        }), mask.click(function() {
            return mask.removeClass("active"), menu.removeClass("active");
        }), submenus.click(function(e) {
            var submenu;
            return $(e.target).parents(".sub-menu").length > 0 ? void 0 : ($(".mobile-menu .main-menu > li.active").not($(this)).each(function() {
                var submenu;
                return submenu = $(this), $(this).children("ul").slideToggle(200, function() {
                    return submenu.toggleClass("active");
                });
            }), submenu = $(this), submenu.hasClass("active") ? submenu.children("ul").slideToggle(200, function() {
                return submenu.toggleClass("active");
            }) : (submenu.toggleClass("active"), submenu.children("ul").slideToggle(200)));
        }), $(window).resize(function() {
            return mask.removeClass("active"), menu.removeClass("active"), header.removeClass("active");
        });
    }), $(function() {
        var enteries, loadMore, mapAsFeed;
        return mapAsFeed = $(".map-as-feed-wrap"), enteries = $(".map-as-feed-wrap .entry"), 
        loadMore = $(".map-as-feed-wrap .load-more"), enteries.eq(0).show(), enteries.eq(1).show(), 
        enteries.length > 2 ? (loadMore.show(), loadMore.click(function() {
            return enteries = $(".map-as-feed-wrap .entry:hidden"), enteries.eq(0).fadeIn(200), 
            enteries.eq(1).fadeIn(200), $(".map-as-feed-wrap .entry:hidden").length ? void 0 : loadMore.hide();
        })) : void 0;
    }), $(window).load(function() {
        var loadMore;
        return loadMore = $(".articles-list .load-more"), $(".next-page-trigger").length > 0 ? loadMore.addClass("visible") : void 0;
    }), $(function() {
        return $(document).mouseup(function(e) {
            var container;
            return container = $("#map-popup"), !container.is(e.target) && 0 === container.has(e.target).length && container.hasClass("visible") ? container.hide() : void 0;
        });
    });
}.call(this), function() {
    "use strict";
    var sfServices;
    sfServices = angular.module("sfServices", [ "ngResource" ]), sfServices.factory("urlChooser", [ "$location", function($location) {
        var env, getDetailFormat, getIndexFormat, getUrl;
        switch ($location.host()) {
          case "127.0.0.1":
            env = "development";
            break;

          case "starkey.local":
            env = "staging";
            break;

          default:
            env = "production";
        }
        return getUrl = function() {
            switch (env) {
              case "development":
                return "/local/api";

              case "staging":
                return "http://starkey.local/api";

              default:
                return "/api";
            }
        }, getIndexFormat = function() {
            return "development" === env ? "/index.json" : "";
        }, getDetailFormat = function(id) {
            return "development" === env ? "" : "/" + id;
        }, {
            getUrl: getUrl(),
            getIndexFormat: getIndexFormat()
        };
    } ]), sfServices.factory("Article", [ "$q", "$http", "urlChooser", function($q, $http, urlChooser) {
        var getDetail;
        return getDetail = function(id) {
            var deferred;
            return deferred = $q.defer(), $http.get("" + urlChooser.getUrl + "/articles/" + id).success(function(data) {
                return deferred.resolve(data);
            }).error(function(reason) {
                return deferred.reject(reason);
            }), deferred.promise;
        }, {
            getDetail: getDetail
        };
    } ]), sfServices.factory("Articles", [ "$q", "$http", "$resource", "urlChooser", function($q, $http, $resource, urlChooser) {
        var getIndex;
        return getIndex = function() {
            var deferred;
            return deferred = $q.defer(), $http.get("" + urlChooser.getUrl + "/blog" + urlChooser.getIndexFormat).success(function(data) {
                return deferred.resolve(data);
            }).error(function(reason) {
                return deferred.reject(reason);
            }), deferred.promise;
        }, {
            getIndex: getIndex
        };
    } ]), sfServices.factory("LatestBlog", [ "$q", "$http", "urlChooser", function($q, $http, urlChooser) {
        var fetchLatest;
        return fetchLatest = function() {
            var deferred, endPoint;
            return endPoint = "" + urlChooser.getUrl + "/latest_blog", deferred = $q.defer(), 
            $http.get(endPoint).success(function(data) {
                return deferred.resolve(data);
            }).error(function(reason) {
                return deferred.reject(reason);
            }), deferred.promise;
        }, {
            fetchLatest: fetchLatest
        };
    } ]), sfServices.factory("$FB", [ "$window", function($window) {
        return {
            init: function(fbId) {
                if (!fbId) throw "FB App Id Cannot be blank";
                this.fbId = fbId, $window.fbAsyncInit = function() {
                    FB.init({
                        appId: fbId,
                        channelUrl: "app/channel.html",
                        status: !0,
                        xfbml: !0
                    });
                }, function(d) {
                    var id, js, ref;
                    js = void 0, id = "facebook-jssdk", ref = d.getElementsByTagName("script")[0], d.getElementById(id) || (js = d.createElement("script"), 
                    js.id = id, js.async = !0, js.src = "//connect.facebook.net/en_US/all.js", ref.parentNode.insertBefore(js, ref));
                }(document);
            }
        };
    } ]), sfServices.factory("FeaturedArticle", [ "$q", "$http", "$resource", "urlChooser", function($q, $http, $resource, urlChooser) {
        var getIndex;
        return getIndex = function() {
            var deferred;
            return deferred = $q.defer(), $http.get("" + urlChooser.getUrl + "/featured_articles" + urlChooser.getIndexFormat).success(function(data) {
                return deferred.resolve(data);
            }).error(function(reason) {
                return deferred.reject(reason);
            }), deferred.promise;
        }, {
            getIndex: getIndex
        };
    } ]), sfServices.factory("GalaItems", [ "$q", "$http", "$resource", "urlChooser", function($q, $http, $resource, urlChooser) {
        var getIndex;
        return getIndex = function() {
            var deferred;
            return deferred = $q.defer(), $http.get("" + urlChooser.getUrl + "/gala_items").success(function(data) {
                return deferred.resolve(data);
            }).error(function(reason) {
                return deferred.reject(reason);
            }), deferred.promise;
        }, {
            getIndex: getIndex
        };
    } ]), sfServices.factory("GalaTabs", [ "$q", "$http", "$resource", "urlChooser", function($q, $http, $resource, urlChooser) {
        var getIndex;
        return getIndex = function() {
            var deferred;
            return deferred = $q.defer(), $http.get("" + urlChooser.getUrl + "/gala_tabs").success(function(data) {
                return deferred.resolve(data);
            }).error(function(reason) {
                return deferred.reject(reason);
            }), deferred.promise;
        }, {
            getIndex: getIndex
        };
    } ]), sfServices.factory("HearingMissionArticle", [ "$q", "$http", "urlChooser", function($q, $http, urlChooser) {
        var getDetail;
        return getDetail = function(id) {
            var deferred;
            return deferred = $q.defer(), $http.get("" + urlChooser.getUrl + "/missions_articles/" + id).success(function(data) {
                return deferred.resolve(data);
            }).error(function(reason) {
                return deferred.reject(reason);
            }), deferred.promise;
        }, {
            getDetail: getDetail
        };
    } ]), sfServices.factory("Instagram", [ "$http", function($http) {
        return {
            fetchLatest: function(callback) {
                var endPoint;
                return endPoint = "https://api.instagram.com/v1/users/331318543/media/recent/?client_id=1f359684e8ab4da6ae6ff618be26c638&callback=JSON_CALLBACK&count=4", 
                $http.jsonp(endPoint).success(function(response) {
                    return callback(response.data);
                });
            }
        };
    } ]), sfServices.factory("MapMarker", [ "$q", "$http", "$resource", "urlChooser", function($q, $http, $resource, urlChooser) {
        var getIndex;
        return getIndex = function() {
            var deferred;
            return deferred = $q.defer(), $http.get("" + urlChooser.getUrl + "/homepage_markers" + urlChooser.getIndexFormat).success(function(data) {
                return deferred.resolve(data);
            }).error(function(reason) {
                return deferred.reject(reason);
            }), deferred.promise;
        }, {
            getIndex: getIndex
        };
    } ]), sfServices.factory("MissionsPage", [ "$q", "$http", "$resource", "urlChooser", function($q, $http, $resource, urlChooser) {
        var getPage;
        return getPage = function() {
            var deferred;
            return deferred = $q.defer(), $http.get("" + urlChooser.getUrl + "/missions_page" + urlChooser.getIndexFormat).success(function(data) {
                return deferred.resolve(data);
            }).error(function(reason) {
                return deferred.reject(reason);
            }), deferred.promise;
        }, {
            getPage: getPage
        };
    } ]), sfServices.factory("MissionsIndex", [ "$q", "$http", "$resource", "urlChooser", function($q, $http, $resource, urlChooser) {
        var getIndex;
        return getIndex = function() {
            var deferred, url;
            return deferred = $q.defer(), url = "" + urlChooser.getUrl + "/missions_highlights" + urlChooser.getIndexFormat, 
            $http.get(url).success(function(data) {
                return deferred.resolve(data);
            }).error(function(reason) {
                return deferred.reject(reason);
            }), deferred.promise;
        }, {
            getIndex: getIndex
        };
    } ]), sfServices.factory("MissionsMapMarker", [ "$q", "$http", "$resource", "urlChooser", function($q, $http, $resource, urlChooser) {
        var getIndex;
        return getIndex = function() {
            var deferred;
            return deferred = $q.defer(), $http.get("" + urlChooser.getUrl + "/missions_markers" + urlChooser.getIndexFormat).success(function(data) {
                return deferred.resolve(data);
            }).error(function(reason) {
                return deferred.reject(reason);
            }), deferred.promise;
        }, {
            getIndex: getIndex
        };
    } ]), sfServices.factory("MediaMentionOrPressItem", [ "$q", "$http", "$resource", "urlChooser", function($q, $http, $resource, urlChooser) {
        var getIndex;
        return getIndex = function() {
            var deferred;
            return deferred = $q.defer(), $http.get("" + urlChooser.getUrl + "/press" + urlChooser.getIndexFormat).success(function(data) {
                return deferred.resolve(data);
            }).error(function(reason) {
                return deferred.reject(reason);
            }), deferred.promise;
        }, {
            getIndex: getIndex
        };
    } ]), sfServices.factory("PressRelease", [ "$resource", "urlChooser", function($resource, urlChooser) {
        return $resource("" + urlChooser.getUrl + "/press_releases/:pressReleaseId.json", {}, {});
    } ]), sfServices.factory("Preview", [ "$q", "$http", "urlChooser", function($q, $http, urlChooser) {
        var getDetail;
        return getDetail = function(id) {
            var deferred;
            return deferred = $q.defer(), $http.get("" + urlChooser.getUrl + "/preview/" + id).success(function(data) {
                return deferred.resolve(data);
            }).error(function(reason) {
                return deferred.reject(reason);
            }), deferred.promise;
        }, {
            getDetail: getDetail
        };
    } ]), sfServices.factory("MediaMention", [ "$resource", "urlChooser", function($resource, urlChooser) {
        return $resource("" + urlChooser.getUrl + "/media_mentions/:mediaMentionId.json", {}, {});
    } ]), sfServices.factory("ProgramContent", [ "$q", "$http", "urlChooser", function($q, $http, urlChooser) {
        var getResource;
        return getResource = function(programContentId) {
            var deferred;
            return deferred = $q.defer(), $http.get("" + urlChooser.getUrl + "/program_" + programContentId).success(function(data) {
                return deferred.resolve(data);
            }).error(function(reason) {
                return deferred.reject(reason);
            }), deferred.promise;
        }, {
            getResource: getResource
        };
    } ]), sfServices.factory("ProgramPartnership", [ "$q", "$http", "urlChooser", function($q, $http, urlChooser) {
        var getIndex;
        return getIndex = function() {
            var deferred;
            return deferred = $q.defer(), $http.get("" + urlChooser.getUrl + "/program_partnerships" + urlChooser.getIndexFormat).success(function(data) {
                return deferred.resolve(data);
            }).error(function(reason) {
                return deferred.reject(reason);
            }), deferred.promise;
        }, {
            getIndex: getIndex
        };
    } ]), sfServices.factory("ProgramResource", [ "$q", "$http", "urlChooser", function($q, $http, urlChooser) {
        var getIndex;
        return getIndex = function() {
            var deferred;
            return deferred = $q.defer(), $http.get("" + urlChooser.getUrl + "/program_resources" + urlChooser.getIndexFormat).success(function(data) {
                return deferred.resolve(data);
            }).error(function(reason) {
                return deferred.reject(reason);
            }), deferred.promise;
        }, {
            getIndex: getIndex
        };
    } ]), sfServices.service("Youtube", [ function() {
        var regex;
        return regex = /(?:https?:\/{2})?(?:w{3}\.)?youtu(?:be)?\.(?:com|be)(?:\/watch\?v=|\/)([^\s&]+)/, 
        {
            regex: function() {
                return regex;
            }
        };
    } ]);
}.call(this), function() {
    var HeaderTabNav, TabBehavior, __bind = function(fn, me) {
        return function() {
            return fn.apply(me, arguments);
        };
    }, __hasProp = {}.hasOwnProperty, __extends = function(child, parent) {
        function ctor() {
            this.constructor = child;
        }
        for (var key in parent) __hasProp.call(parent, key) && (child[key] = parent[key]);
        return ctor.prototype = parent.prototype, child.prototype = new ctor(), child.__super__ = parent.prototype, 
        child;
    };
    TabBehavior = function() {
        function TabBehavior() {
            this.setActiveLink = __bind(this.setActiveLink, this), this.setupListeners();
        }
        return TabBehavior.prototype.rootElement = $(document), TabBehavior.prototype.setupListeners = function() {
            var _this = this;
            return this.rootElement.on("click", "li", function(e) {
                return e.preventDefault(), _this.removeActiveClass(), _this.hideTabbedContent(), 
                _this.setActiveLink(e.currentTarget), _this.makeActive($(e.currentTarget));
            });
        }, TabBehavior.prototype.setActiveLink = function(link) {
            var selected_tab;
            return selected_tab = $(link).find("a").data().contentClass, $(selected_tab).fadeIn();
        }, TabBehavior.prototype.makeActive = function($item) {
            return $item.addClass("active");
        }, TabBehavior.prototype.removeActiveClass = function() {
            return this.rootElement.find("li").removeClass("active");
        }, TabBehavior.prototype.hideTabbedContent = function() {
            return this.rootElement.find(".tab-content").hide();
        }, TabBehavior;
    }(), HeaderTabNav = function(_super) {
        function HeaderTabNav() {
            this.hideTabbedContent(), HeaderTabNav.__super__.constructor.apply(this, arguments);
        }
        return __extends(HeaderTabNav, _super), HeaderTabNav.prototype.rootElement = $(".header-nav"), 
        HeaderTabNav.prototype.setupListeners = function() {
            var _this = this;
            return this.rootElement.on("click", "ul.tabs li", function(e) {
                var isActive;
                return e.preventDefault(), isActive = $(e.currentTarget).hasClass("active"), _this.removeActiveClass(), 
                _this.hideTabbedContent(), isActive ? void 0 : (_this.setActiveLink(e.currentTarget), 
                _this.makeActive($(e.currentTarget)));
            });
        }, HeaderTabNav;
    }(TabBehavior), $(function() {
        var a, i, runOnLoad, _results;
        if (new HeaderTabNav(), runOnLoad = new Array(), window.onload = function() {
            var i;
            for (i = 0; i < runOnLoad.length; ) runOnLoad[i](), i++;
        }, document.getElementsByTagName) {
            _results = [];
            for (i in a = document.getElementsByTagName("a")) a[i].onmousedown = function() {
                this.blur(), this.hideFocus = !0, this.style.outline = "none";
            }, _results.push(a[i].onmouseout = a[i].onmouseup = function() {
                this.blur(), this.hideFocus = !1, this.style.outline = null;
            });
            return _results;
        }
    });
}.call(this);