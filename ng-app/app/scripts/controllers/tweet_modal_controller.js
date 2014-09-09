'use strict';

angular.module('ngTwiApp').controller('TweetModalController', ['$scope', '$routeParams', '$modal', '$filter', 'Tweet',
  function($scope, $routeParams, $modal, $filter, Tweet) {
    var registerWordId =  $scope.successObjectId;
    var twitterUserId = $routeParams.twitterUserId;
    var where = $filter('filter');
    $scope.remotingProgress = 50;

    $scope.hatebuTweets = Tweet.buildHatebus({twitter_user_id: twitterUserId, register_word_id: registerWordId}, function(){
      $scope.remotingProgress = 100;
    });

    $scope.addTweet = function(currentTweet) {
      Tweet.save({twitter_user_id: twitterUserId, register_word_id: registerWordId, title: currentTweet.title, url: currentTweet.url},
        function(tweet) {
          $scope.tweets.push(tweet);
          $scope.hatebuTweets = where($scope.hatebuTweets, function (hatebuTweet) {
            return hatebuTweet.title !== tweet.title;
          });
        }
      );
    };

    $scope.addAllTweet = function() {
      angular.forEach($scope.hatebuTweets, function (scopeHatebuTweet) {
        Tweet.save({twitter_user_id: twitterUserId, register_word_id: registerWordId, title: scopeHatebuTweet.title, url: scopeHatebuTweet.url},
          function(tweet) {
            $scope.tweets.push(tweet);
            $scope.hatebuTweets = where($scope.hatebuTweets, function (hatebuTweet) {
              return hatebuTweet.title !== tweet.title;
            });
          }
        );
      });
    };
}]);
