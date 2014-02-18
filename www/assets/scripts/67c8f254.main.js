(function(){var sfControllers;sfControllers=angular.module("sfControllers",[]),sfControllers.config(["$sceProvider",function($sceProvider){return $sceProvider.enabled(!1)}]),sfControllers.controller("globalVideoModalCtrl",["$scope",function($scope){return $scope.modalShown=!1,$scope.modalVideo="",$scope.youtubeUrl="http://www.youtube.com/watch?v=WrO9PTpuSSs",$scope.codeExample1="<img ng-src='{{ youtubeUrl | youtubeImage }}'>",$scope.codeExample2="<iframe frameborder='0' ng-src='{{ youtubeUrl | youtubeIframe }}'></iframe>",$scope.$on("modal:show",function(event,url){return $scope.toggleModal(url)}),$scope.toggleModal=function(videoUrl){return $scope.modalShown=!$scope.modalShown,$scope.modalShown===!0?$scope.modalVideo=videoUrl:void 0}}]),sfControllers.controller("HomeIndexBottomTabsCtrl",["$scope","MapMarker","FeaturedArticle",function($scope,MapMarker,FeaturedArticle){return FeaturedArticle.getIndex().then(function(data){return $scope.featuredArticles=data}),MapMarker.getIndex().then(function(data){return $scope.markers=data}),$scope.currentBottomSlideTab=1,$scope.currentTabModel={},$scope.changeCurrentTab=function(tabIndex){return 0===tabIndex?$scope.currentBottomSlideTab=1:($scope.currentBottomSlideTab=2,$scope.currentTabModel=$scope.featuredArticles[tabIndex-1])},$scope.modalShown=!1,$scope.toggleModal=function(){return $scope.modalShown=!$scope.modalShown}}]),sfControllers.controller("BlogIndexCtrl",["$scope","Articles","Pagination",function($scope,Articles,Pagination){return $scope.articles=[],$scope.articleFilters={featured:"false",blog_item_category:"",year:""},$scope.articleCategories=[{name:"All",tag:""},{name:"News",tag:"News"},{name:"Events",tag:"Events"},{name:"Hear Now",tag:"Hear Now"},{name:"Gala",tag:"Gala"},{name:"Films",tag:"Films"},{name:"Celebrity",tag:"Celebrity"},{name:"Operation Change",tag:"Operation Change"},{name:"Hearing Missions",tag:"Hearing Missions"},{name:"Listen Carefully",tag:"Listen Carefully"}],$scope.articleYears=[{name:"Latest",tag:""},{name:"2014",tag:"2014"},{name:"2013",tag:"2013"},{name:"2012",tag:"2012"},{name:"2011",tag:"2011"},{name:"2010",tag:"2010"}],Articles.getIndex().then(function(data){return $scope.articles=data instanceof Array?data:[data],$scope.pagination=Pagination.getNew(9),$scope.pagination.numPages=Math.ceil($scope.articles.length/$scope.pagination.perPage)}),$scope.numberOfPages=function(){return Math.ceil($scope.articles.length/$scope.pageSize)},$scope.parseDate=function(date){var parsedDate;return parsedDate=Date.parse(date)}}]),sfControllers.controller("BlogShowCtrl",["$scope","$routeParams","$location","$sce","Articles","Article","Pagination",function($scope,$routeParams,$location,$sce,Articles,Article,Pagination){return $scope.currentPosition=$routeParams.articleId,$scope.articles=[],Articles.getIndex().then(function(data){return $scope.articles=data instanceof Array?data:[data],$scope.pagination=Pagination.getNew(9),$scope.pagination.numPages=Math.ceil($scope.articles.length/$scope.pagination.perPage)}),$scope.numberOfPages=function(){return Math.ceil($scope.articles.length/$scope.pageSize)}}]),sfControllers.controller("GalaCtrl",["$scope","$routeParams","GalaItems",function($scope,$routeParams,GalaItems){return $scope.currentTab=$routeParams,GalaItems.getIndex().then(function(data){return $scope.timelineItems=data}),$scope.showGalaItem=function(galaItemId){return console.debug("showGalaItem galaItemId",galaItemId)}}]),sfControllers.controller("MissionsPageCtrl",["$scope","MissionsMapMarker","MissionsPage",function($scope,MissionsMapMarker,MissionsPage){return $scope.currentTab=0,MissionsMapMarker.getIndex().then(function(data){return $scope.data=data}),MissionsPage.getPage().then(function(data){return $scope.missions=data[0],$scope.statistics=$scope.missions.hearing_mission_statistics,$scope.content_tabs=$scope.missions.content_tabs,$scope.highlights=$scope.missions.highlights}),$scope.changeTab=function(tabId){return $scope.currentTab=tabId}}]),sfControllers.controller("MissionsIndexCtrl",["$scope","Pagination","MissionsIndex",function($scope,Pagination,MissionsIndex){return $scope.highlightsFilters={year:"",region:"",country:""},$scope.highlightYears=[{name:"Latest",tag:""},{name:"2014",tag:"2014"},{name:"2013",tag:"2013"},{name:"2012",tag:"2012"},{name:"2011",tag:"2011"},{name:"2010",tag:"2010"}],$scope.highlightRegions=[{name:"Region",tag:""}],$scope.highlightCountries=[{name:"Country",tag:""}],$scope.missionsHighlights=[],MissionsIndex.getIndex().then(function(data){return $scope.missionsHighlights=data,$scope.pagination=Pagination.getNew(9),$scope.pagination.numPages=Math.ceil($scope.missionsHighlights.length/$scope.pagination.perPage)}),$scope.numberOfPages=function(){return Math.ceil($scope.missionsHighlights.length/$scope.pageSize)}}]),sfControllers.controller("MissionsShowCtrl",["$scope","$routeParams","$location","Articles","HearingMissionArticle","Pagination",function(){}]),sfControllers.controller("MediaMentionsIndexCtrl",["$scope","MediaMentionOrPressItem","Pagination",function($scope,MediaMentionOrPressItem,Pagination){return $scope.articleFilters={featured:"",year:"",type:""},$scope.articleCategories=[{name:"All",tag:""},{name:"Press Release",tag:"press_release"},{name:"Media Mention",tag:"media_mention"}],$scope.articleYears=[{name:"Latest",tag:""},{name:"2014",tag:"2014"},{name:"2013",tag:"2013"},{name:"2012",tag:"2012"},{name:"2011",tag:"2011"},{name:"2010",tag:"2010"}],$scope.pressItems=[],MediaMentionOrPressItem.getIndex().then(function(data){return $scope.pressItems=data,$scope.pagination=Pagination.getNew(9),$scope.pagination.numPages=Math.ceil($scope.pressItems.length/$scope.pagination.perPage)}),$scope.numberOfPages=function(){return Math.ceil($scope.pressItems.length/$scope.pageSize)},$scope.parseDate=function(date){var parsedDate;return parsedDate=Date.parse(date)}}]),sfControllers.controller("MediaMentionsShowCtrl",["$scope","$routeParams","MediaMention","MediaMentionOrPressItem","Pagination",function($scope,$routeParams,MediaMention,MediaMentionOrPressItem,Pagination){return $scope.article={prev_item:"",next_item:""},$scope.currentPosition=$routeParams.articleId,$scope.pressItems=[],MediaMention.get({mediaMentionId:$routeParams.mediaMentionId},function(pressItem){return $scope.article=pressItem instanceof Array?pressItem[0]:pressItem}),MediaMentionOrPressItem.getIndex().then(function(data){return $scope.pressItems=data,$scope.pagination=Pagination.getNew(9),$scope.pagination.numPages=Math.ceil($scope.pressItems.length/$scope.pagination.perPage)}),$scope.numberOfPages=function(){return Math.ceil($scope.pressItems.length/$scope.pageSize)},$scope.parseDate=function(date){var parsedDate;return parsedDate=Date.parse(date)}}]),sfControllers.controller("PressReleasesShowCtrl",["$scope","$routeParams","PressRelease","MediaMentionOrPressItem","Pagination",function($scope,$routeParams,PressRelease,MediaMentionOrPressItem,Pagination){return $scope.article={prev_item:"",next_item:""},$scope.currentPosition=$routeParams.pressReleaseId,$scope.pressItems=[],PressRelease.get({pressReleaseId:$routeParams.pressReleaseId},function(pressItem){return $scope.article=pressItem instanceof Array?pressItem[0]:pressItem}),MediaMentionOrPressItem.getIndex().then(function(data){return $scope.pressItems=data,$scope.pagination=Pagination.getNew(9),$scope.pagination.numPages=Math.ceil($scope.pressItems.length/$scope.pagination.perPage)}),$scope.numberOfPages=function(){return Math.ceil($scope.pressItems.length/$scope.pageSize)},$scope.parseDate=function(date){var parsedDate;return parsedDate=Date.parse(date)}}]),sfControllers.controller("ProgramsCtrl",["$scope","$routeParams","Articles","ProgramPartnership","ProgramResource",function($scope,$routeParams,Articles,ProgramPartnership,ProgramResource){return $scope.currentTab=$routeParams,$scope.programPartnerships=[],$scope.programResources=[],ProgramPartnership.getIndex().then(function(data){return $scope.programPartnerships=data instanceof Array?data:[data]}),ProgramResource.getIndex().then(function(data){return $scope.programResources=data instanceof Array?data:[data]})}])}).call(this),function(){var sfDirectives;sfDirectives=angular.module("sfDirectives",["ngSanitize","sfFilters"]),sfDirectives.factory("Pagination",function(){var pagination;return pagination={},pagination.getNew=function(perPage){var paginator;return perPage=void 0===perPage?5:perPage,paginator={numPages:1,perPage:perPage,page:0},paginator.prevPage=function(){return paginator.page>0?paginator.page-=1:void 0},paginator.nextPage=function(){return paginator.page<paginator.numPages-1?paginator.page+=1:void 0},paginator.toPageId=function(id){return id>=0&&id<=paginator.numPages-1?paginator.page=id:void 0},paginator},pagination}),sfDirectives.directive("worldMap",[function(){var controller,link;return link=function(scope){return setTimeout(function(){var mapObject;return $("#world-map-gdp").vectorMap({map:"world_mill_en",markers:scope.markers.coords,markersSelectableOne:!0,zoomOnScroll:!1,series:{markers:[{attribute:"fill",scale:["#C8EEFF","#0071A4"]}]},onMarkerClick:function(event,index){var $popup,content;return content=scope.markers.meta_data[index],$popup=$("#map-popup"),$popup.fadeOut("slow",function(){return $popup.find(".content").empty().html("<span class='close'><a href ng-click='closePopup()'>X</a></span><img src='"+content.thumbnail_url+"'/><div class='background-popup'><h1>"+content.title+"</h1><p>"+content.text+"</p></div>"),$popup.fadeIn()})}}),mapObject=$("#world-map-gdp").vectorMap("get","mapObject")},1800)},controller=function($scope){return $scope.closePopup=function(){return $("#map-popup").fadeOut()}},{restrict:"E",link:link,controller:controller,template:"<section class='map'><div id='map-popup'><div class='content'></div></div><div ng-transclude></div><div id='world-map-gdp'></div></section>",transclude:!0,replace:!0,scope:{markers:"="}}}]),sfDirectives.directive("missionsMap",["$timeout",function($timeout){var controller,link;return link=function(scope){return scope.worldMapObject={},scope.usMapObject={},scope.worldMapZIndex=1,scope.usMapZIndex=0,scope.currentContinent={},scope.currentCountry={},scope.selectedList={},scope.greetingFlag=!1,scope.selectTopLevelList=function(continent){return scope.selectedList=continent},scope.initializeMaps=function(){return $timeout(function(){return $("#missions-world-map").vectorMap({map:"world_mill_en",zoomOnScroll:!1,backgroundColor:"none",regionStyle:{selected:{fill:"#ffad20"}},focusOn:{x:.5,y:.5,scale:.5}}),scope.worldMapObject=$("#missions-world-map").vectorMap("get","mapObject"),$("#missions-us-map").vectorMap({map:"us_aea_en",zoomOnScroll:!1,backgroundColor:"none",regionStyle:{selected:{fill:"#ffad20"}},focusOn:{x:.5,y:.5,scale:.5}}),scope.usMapObject=$("#missions-us-map").vectorMap("get","mapObject")},1800)},scope.hasContinentAndCountry=function(){return scope.hasContinent()||scope.hasCountry()},scope.hasContinent=function(){var _ref;return null!=(null!=(_ref=scope.currentContinent)?_ref.name:void 0)},scope.hasCountry=function(){var _ref;return null!=(null!=(_ref=scope.currentCountry)?_ref.name:void 0)},scope.countryClass=function(name){return(null!=name?name.length:void 0)?"US"===name?"states":"countries":void 0},scope.countryOrState=function(){return scope.hasContinent()?scope.countryClass(scope.currentContinent.name):void 0},scope.highlightContinentRegions=function(continent,mapObj){var country,countryCodes,_i,_len,_ref;for(scope.currentContinent=continent,scope.currentCountry={},countryCodes=[],_ref=continent.countries_visited,_i=0,_len=_ref.length;_len>_i;_i++)country=_ref[_i],countryCodes.push(country.abbreviation);return countryCodes.length>0?(mapObj.clearSelectedRegions(),mapObj.setFocus(countryCodes,.2),mapObj.setSelectedRegions(countryCodes)):void 0},scope.highlightCountryRegion=function(country,mapObj){return scope.currentCountry=country,mapObj.clearSelectedRegions(),mapObj.setFocus(country.abbreviation),mapObj.setSelectedRegions(country.abbreviation)},scope.bringUSMapToFront=function(flag,continent){return flag===!0?(scope.worldMapZIndex=0,scope.usMapZIndex=1,scope.highlightContinentRegions(continent,scope.usMapObject)):(scope.worldMapZIndex=1,scope.usMapZIndex=0,scope.highlightContinentRegions(continent,scope.worldMapObject))},scope.greetingClicked=function(){return scope.greetingFlag=!0},scope.initializeMaps()},controller=function($scope){return $scope.showContinent=function(continent){return"US"===continent.name?$scope.bringUSMapToFront(!0,continent):$scope.bringUSMapToFront(!1,continent)},$scope.showCountry=function(country,continent){var countryCode;return countryCode=country.abbreviation,(null!=countryCode?countryCode.length:void 0)>0?"US"===continent.name?($scope.bringUSMapToFront(!0,continent),$scope.highlightCountryRegion(country,$scope.usMapObject)):($scope.bringUSMapToFront(!1,continent),$scope.highlightCountryRegion(country,$scope.worldMapObject)):void 0}},{restrict:"E",link:link,controller:controller,templateUrl:"templates/missions_map.html",replace:!0,scope:{data:"="}}}]),sfDirectives.directive("panelTab",[function(){return{restrict:"E",templateUrl:"templates/panel_tab.html",replace:!0,scope:{featured:"="}}}]),sfDirectives.directive("homeThumblistNav",[function(){var link;return link=function(scope){var config;return config={showArrows:!1},setTimeout(function(){return scope.pane=$(".thumblist-nav"),scope.pane.jScrollPane(config)},1400)},{restrict:"E",link:link,templateUrl:"templates/home_thumblist_nav.html",replace:!0,scope:{articles:"=",clickaction:"="}}}]),sfDirectives.directive("galaThumblistNav",[function(){var config,link;return config={},link=function(scope){return setTimeout(function(){return scope.pane=$(".thumblist-nav"),scope.pane.jScrollPane(config)},1400)},{restrict:"E",link:link,templateUrl:"templates/gala_thumblist_nav.html",replace:!0,scope:{items:"=",clickaction:"="}}}]),sfDirectives.directive("thumblistNav",["$timeout",function($timeout){var link,template;return link=function(scope){var config;return config={showArrows:!1},$timeout(function(){return scope.pane=$(".thumblist-nav"),scope.pane.jScrollPane(config)},2400),scope.isFullHeight=function(){var _ref;return(null!=(_ref=scope.full)?_ref.length:void 0)>0&&"true"===scope.full},scope.thumbClasses=function(){return scope.isFullHeight()?"full thumblist thumblist-nav horizontal-only":"thumblist thumblist-nav horizontal-only"}},template='<div ng-class="thumbClasses()" ng-transclude></div>',{restrict:"E",link:link,template:template,transclude:!0,replace:!0,scope:{full:"@"}}}]),sfDirectives.directive("swiper",["$timeout",function($timeout){var controller,link;return link=function(scope,element,attrs){var config,_ref,_ref1;return config=void 0,config={},config.auto=(null!=(_ref=attrs.auto)?_ref.length:void 0)>0?attrs.auto:!1,config.speed=parseInt(attrs.speed,10)||500,attrs.disableScroll&&(config.disableScroll=!!attrs.disableScroll),attrs.continuous&&(config.continuous=!!attrs.continuous),$timeout(function(){return scope.swipe=new Swipe(document.getElementById(scope.identifier),config)},1800),scope.showPaginator=function(){return null!=scope.paginator&&"true"===scope.paginator},scope.isShort=function(){return null!=scope.tall&&"false"===scope.tall},(null!=(_ref1=element.parent())?_ref1.is("p"):void 0)?element.parent().addClass("no-container"):void 0},controller=function($scope){return $scope.next=function(){return $scope.swipe.next()},$scope.prev=function(){return $scope.swipe.prev()},$scope.slide=function(index){return $scope.swipe.slide(index)}},{restrict:"E",link:link,controller:controller,templateUrl:"templates/swipe.html",transclude:!0,replace:!0,scope:{identifier:"@",paginator:"@",tall:"@"}}}]),sfDirectives.directive("slide",[function(){var controller,link,result;return link=function(scope){return null==scope.detailPage&&(scope.detailPage=""),null==scope.imageUrl&&(scope.imageUrl=""),null==scope.videoUrl&&(scope.videoUrl=""),null==scope.linkUrl&&(scope.linkUrl=""),null==scope.linkText&&(scope.linkText=""),null==scope.headline&&(scope.headline=""),null==scope.bodyCopy&&(scope.bodyCopy=""),null==scope.thumblist&&(scope.thumblist="false"),null==scope.date&&(scope.date=""),null==scope.blogCategory&&(scope.blogCategory=""),null==scope.quote&&(scope.quote=""),null==scope.backgroundColor&&(scope.backgroundColor=""),null==scope.logoImageUrl&&(scope.logoImageUrl=""),null==scope.linkStyle&&(scope.linkStyle=""),null==scope.layout&&(scope.layout=""),null==scope.subhead&&(scope.subhead=""),scope.youttubePattern=/^.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]{11,11}).*$/,scope.hasSidePanel=function(){var _ref;return(null!=(_ref=scope.layout)?_ref.length:void 0)>0&&"side-panel"===scope.layout},scope.youtubeId=function(){return scope.videoUrl.match(scope.youttubePattern)[1]},scope.hasVideo=function(){var _ref;return(null!=(_ref=scope.videoUrl)?_ref.length:void 0)>0},scope.hasBlogCategory=function(){var _ref;return(null!=(_ref=scope.blogCategory)?_ref.length:void 0)>0},scope.hasDate=function(){var _ref;return(null!=(_ref=scope.date)?_ref.length:void 0)>0},scope.hasDetailPage=function(){var _ref;return(null!=(_ref=scope.detailPage)?_ref.length:void 0)>0&&"true"===scope.detailPage},scope.hasLinkText=function(){var _ref;return(null!=(_ref=scope.linkText)?_ref.length:void 0)>0},scope.hasLinkStyle=function(){var _ref;return(null!=(_ref=scope.linkStyle)?_ref.length:void 0)>0},scope.hasQuote=function(){var _ref;return(null!=(_ref=scope.quote)?_ref.length:void 0)>0},scope.hasHeadline=function(){var _ref;return(null!=(_ref=scope.headline)?_ref.length:void 0)>0},scope.hasBodyCopy=function(){var _ref;return(null!=(_ref=scope.bodyCopy)?_ref.length:void 0)>0},scope.hasLogoImageUrl=function(){var _ref;return(null!=(_ref=scope.logoImageUrl)?_ref.length:void 0)>0},scope.isThumblist=function(){var _ref;return(null!=(_ref=scope.thumblist)?_ref.length:void 0)>0&&"true"===scope.thumblist},scope.hasSubhead=function(){var _ref;return(null!=(_ref=scope.subhead)?_ref.length:void 0)>0},scope.getYoutubeVideoThumbnail=function(){return scope.hasVideo()?"http://img.youtube.com/vi/"+scope.youtubeId()+"/1.jpg":void 0},scope.getImage=function(){return scope.imageUrl||scope.getYoutubeVideoThumbnail()},scope.backgroundImageStyle=scope.hasQuote()?{background:scope.backgroundColor}:{"background-image":"url("+scope.getImage()+")"},scope.actionLinkStyle=function(){return scope.isThumblist()?"call-to-action "+scope.linkStyle:"action-link "+scope.linkStyle},scope.displayInModalIfVideo=function(){return scope.hasVideo()?scope.$emit("modal:show",scope.videoUrl):void 0}},controller=function(){},result={restrict:"E",controller:controller,replace:!0,templateUrl:function(elem,attr){return null!=attr.thumblist&&"true"===attr.thumblist?"templates/thumb_slide.html":"templates/swipe_slide.html"},link:link,scope:{backgroundColor:"@",blogCategory:"@",bodyCopy:"@",date:"@",detailPage:"@",headline:"@",imageUrl:"@",layout:"@",linkStyle:"@",linkText:"@",linkUrl:"@",logoImageUrl:"@",quote:"@",subhead:"@",thumblist:"@",videoUrl:"@"}}}]),sfDirectives.directive("detailPage",["$timeout","$compile",function(){var link,result;return link=function(scope){return null==scope.author&&(scope.author=""),null==scope.body&&(scope.body=""),null==scope.category&&(scope.category=""),null==scope.date&&(scope.date=""),null==scope.detailPageType&&(scope.detailPageType=""),null==scope.hasRelatedPosts&&(scope.hasRelatedPosts=""),null==scope.headerImageUrl&&(scope.headerImageUrl=""),null==scope.previousPageId&&(scope.previousPageId=""),null==scope.nextPageId&&(scope.nextPageId=""),null==scope.shareThis&&(scope.shareThis=""),null==scope.subhead&&(scope.subhead=""),null==scope.thumbnailImageUrl&&(scope.thumbnailImageUrl=""),null!=scope.title?scope.title:scope.title=""},result={restrict:"E",replace:!0,templateUrl:function(){return"templates/blog_detail_page.html"},link:link,scope:{author:"@",body:"@",category:"@",date:"@",detailPageType:"@",hasRelatedPosts:"@",headerImageUrl:"@",previousPageId:"@",nextPageId:"@",shareThis:"@",subhead:"@",thumbnailImageUrl:"@",title:"@"}}}]),sfDirectives.directive("pageTile",[function(){var link,result;return link=function(scope){return null==scope.feedUrl&&(scope.feedUrl=""),null==scope.title&&(scope.title=""),null==scope.date&&(scope.date=""),null==scope.year&&(scope.year=""),null==scope.detailPage&&(scope.detailPage=""),null==scope.type&&(scope.type=""),null==scope.featured&&(scope.featured=""),null==scope.headerImageUrl&&(scope.headerImageUrl=""),null==scope.logoImageUrl&&(scope.logoImageUrl=""),null==scope.quote&&(scope.quote=""),null==scope.callToActionText&&(scope.callToActionText=""),null==scope.callToActionLink&&(scope.callToActionLink=""),null==scope.videoLink&&(scope.videoLink=""),scope.hasVideo=function(){var _ref;return(null!=(_ref=scope.videoLink)?_ref.length:void 0)>0},scope.getCategory=function(){switch(scope.type){case"press_release":return"Press Release";case"media_mention":return"Media Mention";default:return scope.category}},scope.parseDate=function(date){return Date.parse(date)},scope.linkByType=function(){var _ref,_ref1;return null!=scope.type?"media_mention"===scope.type?(null!=(_ref=scope.videoLink)?_ref.length:void 0)>0?"media_mention_with_video":(null!=(_ref1=scope.detailPage)?_ref1.length:void 0)>0&&"true"===scope.detailPage?"media_mention_with_detail_page":"media_mention":scope.type:"default"},scope.displayInModalIfVideo=function(){return scope.hasVideo()?scope.$emit("modal:show",scope.videoLink):void 0}},result={restrict:"E",replace:!0,templateUrl:"templates/page_tile.html",link:link,scope:{id:"@",callToActionLink:"@",callToActionText:"@",category:"@",date:"@",detailPage:"@",featured:"@",feedUrl:"@",headerImageUrl:"@",logoImageUrl:"@",quote:"@",title:"@",type:"@",videoLink:"@",year:"@"}}}]),sfDirectives.directive("videoPlayerModal",["$window",function($window){return{restrict:"E",scope:{show:"="},replace:!0,transclude:!0,link:function(scope,element,attrs){return scope.dialogStyle={},attrs.width&&(scope.dialogStyle.width=attrs.width),attrs.height&&(scope.dialogStyle.height=attrs.height),scope.hideModal=function(){return scope.show=!1},scope.youtubePattern=/^.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]{11,11}).*$/,scope.destroyYoutubePlayer=function(){return null!=scope.player?scope.player.destroy():void 0},scope.createYoutubePlayer=function(youtube_id){var target;return scope.destroyYoutubePlayer(),target="player",scope.player=new YT.Player(""+target,{width:"160",height:"90",origin:"starkey.ahundredyears.com",wmode:"transparent",playerVars:{controls:0,enablejsapi:1,html5:1},videoId:""+youtube_id}),scope.player},scope.getYoutubeIframeApi=function(){return $.getScript("//www.youtube.com/iframe_api")},scope.playVideo=function(url){return $window.onYouTubeIframeAPIReady=scope.createYoutubePlayer(url),scope.getYoutubeIframeApi()},scope.$watch("show",function(newVal,oldVal){return document.getElementsByTagName("body")[0].style.overflow=newVal&&!oldVal?"hidden":""})},template:"<div class='ng-modal' ng-show='show'>\n  <div class='ng-modal-overlay' ng-click='hideModal()'></div>\n  <div class='ng-modal-dialog' ng-style='dialogStyle'>\n    <div class='ng-modal-close' ng-click='hideModal()'>X</div>\n    <div class='ng-modal-dialog-content'>\n      <div id=\"player\"></div>\n    </div>\n  </div>\n</div>"}}])}.call(this),function(){var sfFilters;sfFilters=angular.module("sfFilters",["sfServices"]),sfFilters.filter("startFrom",function(){return function(input,start){return input.slice(+start)}}),sfFilters.filter("range",function(){return function(input,total){var i;for(total=parseInt(total),i=0;total>i;)input.push(i),i++;return input}}),sfFilters.filter("youtubeIframe",["$filter","Youtube",function($filter,Youtube){return function(value){var videoid;return value?(videoid=value.match(Youtube.regex()),null===videoid?"":"//www.youtube.com/embed/"+videoid[1]):value}}]),sfFilters.filter("youtubeImage",["$filter","Youtube",function($filter,Youtube){return function(value,quality){var videoid;return quality=quality||"default",value?(videoid=value.match(Youtube.regex()),null===videoid?"":"https://img.youtube.com/vi/"+videoid[1]+"/"+quality+".jpg"):value}}])}.call(this),function(){var HomePageApp,blogPagesApp,galaPageApp,mediaMentionsPagesApp,missionsPageApp,programsPageApp;blogPagesApp=angular.module("blogPagesApp",["ngRoute","ngAnimate","ngSanitize","sfControllers","sfDirectives","sfFilters","sfServices"]),blogPagesApp.config(["$routeProvider",function($routeProvider){return $routeProvider.when("/articles",{templateUrl:"partials/articles/index.html",controller:"BlogIndexCtrl"}).when("/articles/:articleId",{templateUrl:function(params){return"api/blog_detail/"+params.articleId},controller:"BlogShowCtrl"}).otherwise({redirectTo:"/articles"})}]),galaPageApp=angular.module("galaPageApp",["ngRoute","ngAnimate","sfControllers","sfDirectives","sfFilters","sfServices"]),galaPageApp.config(["$routeProvider",function($routeProvider){return $routeProvider.when("/gala/:tabId",{templateUrl:function(params){return"api/gala_"+params.tabId},controller:"GalaCtrl"}).otherwise({redirectTo:"/gala/overview"})}]),mediaMentionsPagesApp=angular.module("mediaMentionsPagesApp",["ngRoute","ngAnimate","ngSanitize","sfControllers","sfDirectives","sfFilters","sfServices"]),mediaMentionsPagesApp.config(["$routeProvider",function($routeProvider){return $routeProvider.when("/media_mentions",{templateUrl:"partials/media_mentions/index.html",controller:"MediaMentionsIndexCtrl"}).when("/press_releases/:pressReleaseId",{templateUrl:"partials/press_releases/show.html",controller:"PressReleasesShowCtrl"}).when("/media_mentions/:mediaMentionId",{templateUrl:"partials/media_mentions/show.html",controller:"MediaMentionsShowCtrl"}).otherwise({redirectTo:"/media_mentions"})}]),missionsPageApp=angular.module("missionsPageApp",["ngRoute","ngAnimate","sfControllers","sfDirectives","sfFilters","sfServices"]),missionsPageApp.config(["$routeProvider",function($routeProvider){return $routeProvider.when("/missions",{templateUrl:"partials/missions/landing.html",controller:"MissionsPageCtrl"}).when("/highlights",{templateUrl:function(){return"partials/missions/index.html"},controller:"MissionsIndexCtrl"}).when("/missions/:articleId",{templateUrl:function(params){return"api/missions_detail/"+params.articleId},controller:"MissionsShowCtrl"}).otherwise({redirectTo:"/missions"})}]),programsPageApp=angular.module("programsPageApp",["ngRoute","ngAnimate","sfControllers","sfDirectives","sfFilters","sfServices"]),programsPageApp.config(["$routeProvider",function($routeProvider){return $routeProvider.when("/programs/:tabId",{templateUrl:function(params){return"api/program_"+params.tabId},controller:"ProgramsCtrl"}).otherwise({redirectTo:"/programs/0"})}]),HomePageApp=angular.module("homePageApp",["ngRoute","ngAnimate","ngSanitize","sfControllers","sfDirectives","sfFilters","sfServices"])}.call(this),function(){"use strict";var sfServices;sfServices=angular.module("sfServices",["ngResource"]),sfServices.factory("urlChooser",[function(){var env,getIndexFormat,getUrl,urlChooserInstance;return env="production",urlChooserInstance={},getUrl=function(){switch(env){case"development":return"/local/api";case"staging":return"http://starkey.local/api";default:return"/api"}},getIndexFormat=function(){return"development"===env?"/index.json":""},{getUrl:getUrl(),getIndexFormat:getIndexFormat()}}]),sfServices.factory("Article",["$q","$http","urlChooser",function($q,$http,urlChooser){var getDetail;return getDetail=function(id){var deferred;return deferred=$q.defer(),$http.get(""+urlChooser.getUrl+"/articles/"+id).success(function(data){return deferred.resolve(data)}).error(function(reason){return deferred.reject(reason)}),deferred.promise},{getDetail:getDetail}}]),sfServices.factory("Articles",["$q","$http","$resource","urlChooser",function($q,$http,$resource,urlChooser){var getIndex;return getIndex=function(){var deferred;return deferred=$q.defer(),$http.get(""+urlChooser.getUrl+"/blog"+urlChooser.getIndexFormat).success(function(data){return deferred.resolve(data)}).error(function(reason){return deferred.reject(reason)}),deferred.promise},{getIndex:getIndex}}]),sfServices.factory("FeaturedArticle",["$q","$http","$resource","urlChooser",function($q,$http,$resource,urlChooser){var getIndex;return getIndex=function(){var deferred;return deferred=$q.defer(),$http.get(""+urlChooser.getUrl+"/featured_articles"+urlChooser.getIndexFormat).success(function(data){return deferred.resolve(data)}).error(function(reason){return deferred.reject(reason)}),deferred.promise},{getIndex:getIndex}}]),sfServices.factory("GalaItem",["$resource","urlChooser",function($resource,urlChooser){return $resource(""+urlChooser.getUrl+"/gala_item/:timelineItemId",{},{})}]),sfServices.factory("GalaItems",["$q","$http","$resource","urlChooser",function($q,$http,$resource,urlChooser){var getIndex;return getIndex=function(){var deferred;return deferred=$q.defer(),$http.get(""+urlChooser.getUrl+"/gala_items").success(function(data){return deferred.resolve(data)}).error(function(reason){return deferred.reject(reason)}),deferred.promise},{getIndex:getIndex}}]),sfServices.factory("HearingMissionArticle",["$q","$http","urlChooser",function($q,$http,urlChooser){var getDetail;return getDetail=function(id){var deferred;return deferred=$q.defer(),$http.get(""+urlChooser.getUrl+"/missions_articles/"+id).success(function(data){return deferred.resolve(data)}).error(function(reason){return deferred.reject(reason)}),deferred.promise},{getDetail:getDetail}}]),sfServices.factory("MapMarker",["$q","$http","$resource","urlChooser",function($q,$http,$resource,urlChooser){var getIndex;return getIndex=function(){var deferred;return deferred=$q.defer(),$http.get(""+urlChooser.getUrl+"/homepage_markers"+urlChooser.getIndexFormat).success(function(data){return deferred.resolve(data)}).error(function(reason){return deferred.reject(reason)}),deferred.promise},{getIndex:getIndex}}]),sfServices.factory("MissionsPage",["$q","$http","$resource","urlChooser",function($q,$http,$resource,urlChooser){var getPage;return getPage=function(){var deferred;return deferred=$q.defer(),$http.get(""+urlChooser.getUrl+"/missions_page"+urlChooser.getIndexFormat).success(function(data){return deferred.resolve(data)}).error(function(reason){return deferred.reject(reason)}),deferred.promise},{getPage:getPage}}]),sfServices.factory("MissionsIndex",["$q","$http","$resource","urlChooser",function($q,$http,$resource,urlChooser){var getIndex;return getIndex=function(){var deferred;return deferred=$q.defer(),$http.get(""+urlChooser.getUrl+"/missions_highlights"+urlChooser.getIndexFormat).success(function(data){return deferred.resolve(data)}).error(function(reason){return deferred.reject(reason)}),deferred.promise},{getIndex:getIndex}}]),sfServices.factory("MissionsMapMarker",["$q","$http","$resource","urlChooser",function($q,$http,$resource,urlChooser){var getIndex;return getIndex=function(){var deferred;return deferred=$q.defer(),$http.get(""+urlChooser.getUrl+"/missions_markers"+urlChooser.getIndexFormat).success(function(data){return deferred.resolve(data)}).error(function(reason){return deferred.reject(reason)}),deferred.promise},{getIndex:getIndex}}]),sfServices.factory("MediaMentionOrPressItem",["$q","$http","$resource","urlChooser",function($q,$http,$resource,urlChooser){var getIndex;return getIndex=function(){var deferred;return deferred=$q.defer(),$http.get(""+urlChooser.getUrl+"/press"+urlChooser.getIndexFormat).success(function(data){return deferred.resolve(data)}).error(function(reason){return deferred.reject(reason)}),deferred.promise},{getIndex:getIndex}}]),sfServices.factory("PressRelease",["$resource","urlChooser",function($resource,urlChooser){return $resource(""+urlChooser.getUrl+"/press_releases/:pressReleaseId.json",{},{})}]),sfServices.factory("MediaMention",["$resource","urlChooser",function($resource,urlChooser){return $resource(""+urlChooser.getUrl+"/media_mentions/:mediaMentionId.json",{},{})
}]),sfServices.factory("ProgramContent",["$q","$http","urlChooser",function($q,$http,urlChooser){var getResource;return getResource=function(programContentId){var deferred;return deferred=$q.defer(),$http.get(""+urlChooser.getUrl+"/program_"+programContentId).success(function(data){return deferred.resolve(data)}).error(function(reason){return deferred.reject(reason)}),deferred.promise},{getResource:getResource}}]),sfServices.factory("ProgramPartnership",["$q","$http","urlChooser",function($q,$http,urlChooser){var getIndex;return getIndex=function(){var deferred;return deferred=$q.defer(),$http.get(""+urlChooser.getUrl+"/program_partnerships"+urlChooser.getIndexFormat).success(function(data){return deferred.resolve(data)}).error(function(reason){return deferred.reject(reason)}),deferred.promise},{getIndex:getIndex}}]),sfServices.factory("ProgramResource",["$q","$http","urlChooser",function($q,$http,urlChooser){var getIndex;return getIndex=function(){var deferred;return deferred=$q.defer(),$http.get(""+urlChooser.getUrl+"/program_resources"+urlChooser.getIndexFormat).success(function(data){return deferred.resolve(data)}).error(function(reason){return deferred.reject(reason)}),deferred.promise},{getIndex:getIndex}}]),sfServices.service("Youtube",[function(){var regex;return regex=/(?:https?:\/{2})?(?:w{3}\.)?youtu(?:be)?\.(?:com|be)(?:\/watch\?v=|\/)([^\s&]+)/,{regex:function(){return regex}}}])}.call(this),function(){var HeaderTabNav,ProgramsPageView,TabBehavior,__bind=function(fn,me){return function(){return fn.apply(me,arguments)}},__hasProp={}.hasOwnProperty,__extends=function(child,parent){function ctor(){this.constructor=child}for(var key in parent)__hasProp.call(parent,key)&&(child[key]=parent[key]);return ctor.prototype=parent.prototype,child.prototype=new ctor,child.__super__=parent.prototype,child};TabBehavior=function(){function TabBehavior(){this.setActiveLink=__bind(this.setActiveLink,this),this.setupListeners()}return TabBehavior.prototype.rootElement=$(document),TabBehavior.prototype.setupListeners=function(){var _this=this;return this.rootElement.on("click","li",function(e){return e.preventDefault(),_this.removeActiveClass(),_this.hideTabbedContent(),_this.setActiveLink(e.currentTarget),_this.makeActive($(e.currentTarget))})},TabBehavior.prototype.setActiveLink=function(link){var selected_tab;return selected_tab=$(link).find("a").data().contentClass,$(selected_tab).fadeIn()},TabBehavior.prototype.makeActive=function($item){return $item.addClass("active")},TabBehavior.prototype.removeActiveClass=function(){return this.rootElement.find("li").removeClass("active")},TabBehavior.prototype.hideTabbedContent=function(){return this.rootElement.find(".tab-content").hide()},TabBehavior}(),HeaderTabNav=function(_super){function HeaderTabNav(){this.hideTabbedContent(),HeaderTabNav.__super__.constructor.apply(this,arguments)}return __extends(HeaderTabNav,_super),HeaderTabNav.prototype.rootElement=$(".header-nav"),HeaderTabNav.prototype.setupListeners=function(){var _this=this;return this.rootElement.on("click","ul.tabs li",function(e){var isActive;return e.preventDefault(),isActive=$(e.currentTarget).hasClass("active"),_this.removeActiveClass(),_this.hideTabbedContent(),isActive?void 0:(_this.setActiveLink(e.currentTarget),_this.makeActive($(e.currentTarget)))})},HeaderTabNav}(TabBehavior),ProgramsPageView=function(){function ProgramsPageView(){this.setupListeners()}return ProgramsPageView.prototype.setupListeners=function(){return $(document).on("click",".become-a-provider",function(e){return e.preventDefault(),$(".programs-page .become-a-provider-container").toggleClass("hidden")})},ProgramsPageView}(),$(function(){return new HeaderTabNav,$(".programs-page").length?new ProgramsPageView:void 0})}.call(this);