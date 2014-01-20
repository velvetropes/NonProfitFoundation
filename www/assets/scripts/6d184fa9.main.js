(function(){var app;app=angular.module("starkey",["ahundredyears.swiper","ahundredyears.thumblist-nav","ahundredyears.pagination"]),app.controller("bottomCarouselCtrl",function(){}),app.controller("heroCarouselCtrl",function(){}),$(".home-page").length&&$(function(){return $.getJSON("/data/markers.json",function(data){var mapObject;return $("#world-map-gdp").vectorMap({map:"world_mill_en",markers:data.coords,markersSelectableOne:!0,zoomOnScroll:!1,series:{markers:[{attribute:"fill",scale:["#C8EEFF","#0071A4"]}]},onMarkerClick:function(event,index){var $popup,content;return content=data.meta_data[index],$popup=$("#map-popup"),$popup.fadeOut("slow",function(){return $popup.find(".content").empty().html("<span class='close'><a href='#'>X</a></span><img src='"+content.thumbnail_url+"'/><div class='background-popup'><h1>"+content.title+"</h1><p>"+content.text+"</p></div>"),$popup.fadeIn()})}}),mapObject=$("#world-map-gdp").vectorMap("get","mapObject")}),$(document).on("click","#map-popup .close a",function(e){return e.preventDefault(),$("#map-popup").fadeOut()})})}).call(this),function(){var HeaderTabNav,ProgramsPageView,TabBehavior,__bind=function(fn,me){return function(){return fn.apply(me,arguments)}},__hasProp={}.hasOwnProperty,__extends=function(child,parent){function ctor(){this.constructor=child}for(var key in parent)__hasProp.call(parent,key)&&(child[key]=parent[key]);return ctor.prototype=parent.prototype,child.prototype=new ctor,child.__super__=parent.prototype,child};TabBehavior=function(){function TabBehavior(){this.setActiveLink=__bind(this.setActiveLink,this),this.setupListeners()}return TabBehavior.prototype.rootElement=$(document),TabBehavior.prototype.setupListeners=function(){var _this=this;return this.rootElement.on("click","li",function(e){return e.preventDefault(),_this.removeActiveClass(),_this.hideTabbedContent(),_this.setActiveLink(e.currentTarget),_this.makeActive($(e.currentTarget))})},TabBehavior.prototype.setActiveLink=function(link){var selected_tab;return selected_tab=$(link).find("a").data().contentClass,$(selected_tab).fadeIn()},TabBehavior.prototype.makeActive=function($item){return $item.addClass("active")},TabBehavior.prototype.removeActiveClass=function(){return this.rootElement.find("li").removeClass("active")},TabBehavior.prototype.hideTabbedContent=function(){return this.rootElement.find(".tab-content").hide()},TabBehavior}(),HeaderTabNav=function(_super){function HeaderTabNav(){this.hideTabbedContent(),HeaderTabNav.__super__.constructor.apply(this,arguments)}return __extends(HeaderTabNav,_super),HeaderTabNav.prototype.rootElement=$(".header-nav"),HeaderTabNav.prototype.setupListeners=function(){var _this=this;return this.rootElement.on("click","ul.tabs li",function(e){var isActive;return e.preventDefault(),isActive=$(e.currentTarget).hasClass("active"),_this.removeActiveClass(),_this.hideTabbedContent(),isActive?void 0:(_this.setActiveLink(e.currentTarget),_this.makeActive($(e.currentTarget)))})},HeaderTabNav}(TabBehavior),ProgramsPageView=function(_super){function ProgramsPageView(){this.setfirstCurrentElement(),ProgramsPageView.__super__.constructor.apply(this,arguments)}return __extends(ProgramsPageView,_super),ProgramsPageView.prototype.rootElement=$(".tabbed-content"),ProgramsPageView.prototype.setfirstCurrentElement=function(){var currentTab;return this.hideTabbedContent(),currentTab=$(".tabbed-content li").first(),this.makeActive(currentTab),this.setActiveLink(currentTab)},ProgramsPageView}(TabBehavior),$(function(){return new HeaderTabNav,$(".programs-page").length?new ProgramsPageView:void 0})}.call(this);