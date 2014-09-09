'use strict';

angular.module('ngTwiApp').factory('TweetWord', ['$resource', function($resource) {
  var TweetWord = $resource('/api/1/register_words/:_id.json',
    {_id: '@id', twitter_user_id: '@twitter_user_id', tweet_type: true, word: '@word'});

    return TweetWord;
}]);
