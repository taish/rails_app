'use strict';

angular.module('ngTwiApp').controller('FriendController', ['$scope', '$routeParams', '$filter', '$modal', 'Friend', 'FriendWord',
  function($scope, $routeParams, $filter, $modal, Friend, FriendWord) {

    var where = $filter('filter');
    var twitterUserId = $routeParams.twitterUserId;
    // for html
    $scope.twitterId = $routeParams.twitterUserId;

    $scope.friends = Friend.query({twitter_user_id: twitterUserId});

    $scope.friendWords = FriendWord.query({twitter_user_id: twitterUserId});

    $scope.addFriendWord = function(){
      FriendWord.save({word: $scope.newWord, twitter_user_id: twitterUserId}, function(friendWord){
        $scope.friendWords.push(friendWord);
        // for delegate
        $scope.successObjectId = friendWord.id;

        $modal.open({
            controller: 'FriendModalController',
            templateUrl: 'views/friend_modal.html',
            backdrop: 'static',
            scope: $scope
        });
      });
      $scope.newWord = '';
    };


    $scope.OpenModal = function(friendWord) {
      $scope.successObjectId = friendWord.id;

      $modal.open({
          controller: 'FriendModalController',
          templateUrl: 'views/friend_modal.html',
          backdrop: 'static',
          scope: $scope
      });
    };

    $scope.removeFriendWord = function(friendWord) {
      FriendWord.remove({_id: friendWord.id, twitter_user_id: twitterUserId}, function(friendWord){
        $scope.friendWords = where($scope.friendWords, function(word) {
          return friendWord.id !== word.id;
        });
      });
    };

    $scope.checkAll = function () {
      var state = !!where($scope.friends, {done: false}).length;
      angular.forEach($scope.friends, function (friend) {
        friend.done = state;
      });
    };

    $scope.removeDoneTodo = function() {
      var doneFriends = where($scope.friends, {done: true});
      angular.forEach(doneFriends, function (doneFriend) {
        Friend.remove({twitter_user_id: twitterUserId, _id: doneFriend.id}, function(friend){
          $scope.friends = where($scope.friends, function (scopeFriend) {
            return scopeFriend.id !== friend.id;
          });
        });
      });
    };
}]);
