'use strict';

angular.module('ngTwiApp').controller('TweetController', ['$scope', '$routeParams', '$filter', '$modal', 'Tweet', 'TweetWord',
  function($scope, $routeParams, $filter, $modal, Tweet, TweetWord) {
    // $scope.tweet = Tweet.get({_id: hoge, twitter_user_id: $routeParams.twitterUserId}, function(phone) {
    //   $scope.mainImageUrl = phone.images[0];
    // });
    // var where = $scope.filter;
    var where = $filter('filter');
    var twitterUserId = $routeParams.twitterUserId;

    // for html
    $scope.twitterId = $routeParams.twitterUserId;

    $scope.tweets = Tweet.query({twitter_user_id: twitterUserId});

    $scope.tweetWords = TweetWord.query({twitter_user_id: twitterUserId});

    $scope.addFriendWord = function() {
      TweetWord.save({word: $scope.newWord, twitter_user_id: twitterUserId}, function(tweetWord){
        $scope.tweetWords.push(tweetWord);
        // for delegate
        $scope.successObjectId = tweetWord.id;

        $modal.open({
            controller: 'TweetModalController',
            templateUrl: 'views/tweet_modal.html',
            backdrop: 'static',
            scope: $scope
        });
      });
      $scope.newWord = '';
    };

    $scope.OpenModal = function(tweetWord) {
        $scope.successObjectId = tweetWord.id;

        $modal.open({
            controller: 'TweetModalController',
            templateUrl: 'views/tweet_modal.html',
            backdrop: 'static',
            scope: $scope
        });
    };

    $scope.removeFriendWord = function(tweetWord) {
      TweetWord.remove({_id: tweetWord.id, twitter_user_id: twitterUserId}, function(tweetWord){
        $scope.tweetWords = where($scope.tweetWords, function (word) {
          return tweetWord.id !== word.id;
        });
      });
    };

    $scope.checkAll = function () {
      var state = !!where($scope.tweets, {done: false}).length;
      angular.forEach($scope.tweets, function (tweet) {
        tweet.done = state;
      });
    };

    $scope.removeDoneTodo = function() {
      var doneTweets = where($scope.tweets, {done: true});
      angular.forEach(doneTweets, function (doneTweet) {
        Tweet.remove({twitter_user_id: twitterUserId, _id: doneTweet.id}, function(tweet){
          $scope.tweets = where($scope.tweets, function (scopeTweet) {
            return scopeTweet.id !== tweet.id;
          });
        });
      });
    };
    // this.openModal = function(){
    // var guest = angular.copy($scope.guest);
    // delete guest.attributes;

    //   $scope.force.update(
    //       "guest__c",
    //       $scope.guest.Id,
    //       guest,
    //       function(result){
    //           $scope.remotingProgress = 100;
    //           $scope.remotingStatus = "更新が完了しました。";
    //       },
    //       function(result){
    //           console.log(result);
    //       }
      // );
    // };
}]);
