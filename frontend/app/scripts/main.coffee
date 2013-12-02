app = angular.module('starkey', [])

# app.directive 'sfArticlegrid', ->
#   restrict: 'A',
#   template: '<div>article grid goes here</div>'

app.directive "navSlides", ->
  restrict: "E"
  transclude: true
  scope: {}
  controller: ($scope,  $http) ->
    $http.get("slides.json").success (data) ->
      slides = $scope.slides = data
      $scope.currentSlideIndex = 0
    $scope.play = (slideIndex) ->
      $scope.currentSlideIndex = slideIndex
  templateUrl: "nav.html"
