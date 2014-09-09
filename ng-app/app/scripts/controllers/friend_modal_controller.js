'use strict';

angular.module('ngTwiApp').controller('FriendModalController', ['$scope', '$routeParams', '$filter', 'Friend',
  function($scope, $routeParams, $filter, Friend) {

    var where = $filter('filter');
    var twitterUserId = $routeParams.twitterUserId;
    var registerWordId =  $scope.successObjectId;

    $scope.remotingProgress = 50;

    $scope.friendsCandidate = Friend.friendsCandidate({twitter_user_id: twitterUserId, register_word_id: registerWordId}, function(){
      $scope.remotingProgress = 100;
    });

    $scope.addFriend = function(currentTweet) {
      Friend.save({twitter_user_id: twitterUserId, register_word_id: registerWordId, friend: currentTweet},
        function(friend) {
          $scope.friends.push(friend);
          $scope.friendsCandidate = where($scope.friendsCandidate, function (friendCandidate) {
            return friendCandidate.screen_name !== friend.screen_name;
          });
        }
      );
    };

    $scope.addAllFriend = function() {
      angular.forEach($scope.friendsCandidate, function (f) {
        // friendCandidate.save({twitter_user_id: twitterUserId, register_word_id: registerWordId},
        Friend.save({twitter_user_id: twitterUserId, register_word_id: registerWordId, friend: f},
          // name: f.name , screen_name:  f.screen_name, description:  f.description, profile_image_url:  f.profile_image_url,
          // friends_count:  f.friends_count, followers_count:  f.followers_count, following:  f.following},

          function(friend) {
            $scope.friends.push(friend);
            $scope.friendsCandidate = where($scope.friendsCandidate, function (scopeFriendCandidate) {
              return scopeFriendCandidate.screen_name !== f.screen_name;
            });
          }
        );
      });
    };
}]);
