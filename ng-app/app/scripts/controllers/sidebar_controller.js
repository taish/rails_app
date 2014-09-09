'use strict';
// angular.module('ngTwiApp');

// var ngTwiControllers = angular.module('ngTwiControllers',[]);

angular.module('ngTwiApp').controller('SidebarController', ['$scope', '$http', 'TwitterUser',
  function($scope, $http, TwitterUser) {
    // var twitterUser = TwitterUser.query();
    // console.log(twitterUser);
    // $http.get('/api/1/twitter_users.json').success(function(data) {
    $scope.twitterUsers = TwitterUser.query();
    // });
  }]);
