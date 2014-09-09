'use strict';

var ngTwiApp = angular.module('ngTwiApp', [
  'ngRoute',
  'ngResource',
  // 'ngTwiApp.controllers',
  // 'ngTwiApp.filters',
  // 'ngTwiApp.services',
  'ui.bootstrap',
  'LocalStorageModule'
]);

ngTwiApp.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/tweet/:twitterUserId', {
        templateUrl: 'views/tweet.html',
        controller: 'TweetController'
      }).
      when('/friend/:twitterUserId', {
        templateUrl: 'views/friend.html',
        controller: 'FriendController'
      }).
      when('/twitter/:twitterUserId', {
        templateUrl: 'views/twitter.html',
        controller: 'TwitterController'
      }).
      otherwise({
        redirectTo: '/'
      });
  }]);
