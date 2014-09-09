'use strict';

angular.module('ngTwiApp').factory('FriendWord', ['$resource', function($resource) {
  return $resource('/api/1/register_words/:_id.json',
    {_id: '@id', twitter_user_id: '@twitter_user_id', friend_type: true, word: '@word'});
}]);
