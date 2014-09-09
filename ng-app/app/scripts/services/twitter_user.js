'use strict';

angular.module('ngTwiApp').factory('TwitterUser', ['$resource', function($resource) {
  return $resource('/api/1/twitter_users/:_id.json',
    {_id: '@id'});
}]);
