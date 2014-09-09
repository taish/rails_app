'use strict';

angular.module('ngTwiApp').factory('Tweet', ['$resource', function($resource) {
  return $resource('/api/1/tweets/:_id.json',
    {_id: '@id', twitter_user_id: '@twitter_user_id', register_word_id: '@register_word_id'},
    {buildHatebus: {method: 'GET', params: {_id: 'build_hatebus'}, isArray: true}}
    );
}]);
