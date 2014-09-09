'use strict';

angular.module('ngTwiApp').factory('Friend', ['$resource', function($resource) {
  return $resource('/api/1/friends/:_id.json',
    {_id: '@id', twitter_user_id: '@twitter_user_id', register_word_id: '@register_word_id'},
    {friendsCandidate: {method: 'GET', params: {_id: 'friends_candidate'}, isArray: true}}
    );
}]);
