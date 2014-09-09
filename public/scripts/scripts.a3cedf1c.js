"use strict";var ngTwiApp=angular.module("ngTwiApp",["ngRoute","ngResource","ui.bootstrap","LocalStorageModule"]);ngTwiApp.config(["$routeProvider",function(a){a.when("/tweet/:twitterUserId",{templateUrl:"views/tweet.html",controller:"TweetController"}).when("/friend/:twitterUserId",{templateUrl:"views/friend.html",controller:"FriendController"}).when("/twitter/:twitterUserId",{templateUrl:"views/twitter.html",controller:"TwitterController"}).otherwise({redirectTo:"/"})}]),angular.module("ngTwiApp").factory("TwitterUser",["$resource",function(a){return a("/api/1/twitter_users/:_id.json",{_id:"@id"})}]),angular.module("ngTwiApp").factory("Tweet",["$resource",function(a){return a("/api/1/tweets/:_id.json",{_id:"@id",twitter_user_id:"@twitter_user_id",register_word_id:"@register_word_id"},{buildHatebus:{method:"GET",params:{_id:"build_hatebus"},isArray:!0}})}]),angular.module("ngTwiApp").factory("TweetWord",["$resource",function(a){var b=a("/api/1/register_words/:_id.json",{_id:"@id",twitter_user_id:"@twitter_user_id",tweet_type:!0,word:"@word"});return b}]),angular.module("ngTwiApp").factory("Friend",["$resource",function(a){return a("/api/1/friends/:_id.json",{_id:"@id",twitter_user_id:"@twitter_user_id",register_word_id:"@register_word_id"},{friendsCandidate:{method:"GET",params:{_id:"friends_candidate"},isArray:!0}})}]),angular.module("ngTwiApp").factory("FriendWord",["$resource",function(a){return a("/api/1/register_words/:_id.json",{_id:"@id",twitter_user_id:"@twitter_user_id",friend_type:!0,word:"@word"})}]),angular.module("ngTwiApp").controller("SidebarController",["$scope","$http","TwitterUser",function(a,b,c){a.twitterUsers=c.query()}]),angular.module("ngTwiApp").service("todos",["$rootScope","$filter",function(a,b){var c=[];a.$watch(function(){return c},function(b){a.$broadcast("change:list",b)},!0);var d=b("filter"),e={done:!0},f={done:!1};this.filter={done:e,remaining:f},this.getDone=function(){return d(c,e)},this.add=function(a){c.push({title:a,done:!1})},this.remove=function(a){c=d(c,function(b){return a!==b})},this.removeDone=function(){c=d(c,f)},this.changeState=function(a){angular.forEach(c,function(b){b.done=a})}}]).controller("TwitterController",["$scope","todos",function(a,b){a.newTitle="",a.addTodo=function(){b.add(a.newTitle),a.newTitle=""},a.filter=b.filter,a.$on("change:list",function(c,d){var e=d.length,f=b.getDone().length;a.allCount=e,a.doneCount=f,a.remainingCount=e-f}),a.checkAll=function(){var c=!!a.remainingCount;b.changeState(c)},a.changeFilter=function(b){a.$emit("change:filter",b)},a.removeDoneTodo=function(){b.removeDone()},a.$on("change:list",function(b,c){a.todoList=c});var c;a.editing=null,a.editTodo=function(b){c=b.title,a.editing=b},a.doneEdit=function(b){b.$invalid&&(a.editing.title=c),a.editing=c=null},a.removeTodo=function(a){b.remove(a)},a.currentFilter=null,a.$on("change:filter",function(b,c){a.currentFilter=c})}]).directive("mySelect",[function(){return function(a,b,c){a.$watch(c.mySelect,function(a){a&&b[0].select()})}}]),angular.module("ngTwiApp").controller("TweetController",["$scope","$routeParams","$filter","$modal","Tweet","TweetWord",function(a,b,c,d,e,f){var g=c("filter"),h=b.twitterUserId;a.twitterId=b.twitterUserId,a.tweets=e.query({twitter_user_id:h}),a.tweetWords=f.query({twitter_user_id:h}),a.addFriendWord=function(){f.save({word:a.newWord,twitter_user_id:h},function(b){a.tweetWords.push(b),a.successObjectId=b.id,d.open({controller:"TweetModalController",templateUrl:"views/tweet_modal.html",backdrop:"static",scope:a})}),a.newWord=""},a.OpenModal=function(b){a.successObjectId=b.id,d.open({controller:"TweetModalController",templateUrl:"views/tweet_modal.html",backdrop:"static",scope:a})},a.removeFriendWord=function(b){f.remove({_id:b.id,twitter_user_id:h},function(b){a.tweetWords=g(a.tweetWords,function(a){return b.id!==a.id})})},a.checkAll=function(){var b=!!g(a.tweets,{done:!1}).length;angular.forEach(a.tweets,function(a){a.done=b})},a.removeDoneTodo=function(){var b=g(a.tweets,{done:!0});angular.forEach(b,function(b){e.remove({twitter_user_id:h,_id:b.id},function(b){a.tweets=g(a.tweets,function(a){return a.id!==b.id})})})}}]),angular.module("ngTwiApp").controller("FriendController",["$scope","$routeParams","$filter","$modal","Friend","FriendWord",function(a,b,c,d,e,f){var g=c("filter"),h=b.twitterUserId;a.twitterId=b.twitterUserId,a.friends=e.query({twitter_user_id:h}),a.friendWords=f.query({twitter_user_id:h}),a.addFriendWord=function(){f.save({word:a.newWord,twitter_user_id:h},function(b){a.friendWords.push(b),a.successObjectId=b.id,d.open({controller:"FriendModalController",templateUrl:"views/friend_modal.html",backdrop:"static",scope:a})}),a.newWord=""},a.OpenModal=function(b){a.successObjectId=b.id,d.open({controller:"FriendModalController",templateUrl:"views/friend_modal.html",backdrop:"static",scope:a})},a.removeFriendWord=function(b){f.remove({_id:b.id,twitter_user_id:h},function(b){a.friendWords=g(a.friendWords,function(a){return b.id!==a.id})})},a.checkAll=function(){var b=!!g(a.friends,{done:!1}).length;angular.forEach(a.friends,function(a){a.done=b})},a.removeDoneTodo=function(){var b=g(a.friends,{done:!0});angular.forEach(b,function(b){e.remove({twitter_user_id:h,_id:b.id},function(b){a.friends=g(a.friends,function(a){return a.id!==b.id})})})}}]),angular.module("ngTwiApp").controller("TweetModalController",["$scope","$routeParams","$modal","$filter","Tweet",function(a,b,c,d,e){var f=a.successObjectId,g=b.twitterUserId,h=d("filter");a.remotingProgress=50,a.hatebuTweets=e.buildHatebus({twitter_user_id:g,register_word_id:f},function(){a.remotingProgress=100}),a.addTweet=function(b){e.save({twitter_user_id:g,register_word_id:f,title:b.title,url:b.url},function(b){a.tweets.push(b),a.hatebuTweets=h(a.hatebuTweets,function(a){return a.title!==b.title})})},a.addAllTweet=function(){angular.forEach(a.hatebuTweets,function(b){e.save({twitter_user_id:g,register_word_id:f,title:b.title,url:b.url},function(b){a.tweets.push(b),a.hatebuTweets=h(a.hatebuTweets,function(a){return a.title!==b.title})})})}}]),angular.module("ngTwiApp").controller("FriendModalController",["$scope","$routeParams","$filter","Friend",function(a,b,c,d){var e=c("filter"),f=b.twitterUserId,g=a.successObjectId;a.remotingProgress=50,a.friendsCandidate=d.friendsCandidate({twitter_user_id:f,register_word_id:g},function(){a.remotingProgress=100}),a.addFriend=function(b){d.save({twitter_user_id:f,register_word_id:g,friend:b},function(b){a.friends.push(b),a.friendsCandidate=e(a.friendsCandidate,function(a){return a.screen_name!==b.screen_name})})},a.addAllFriend=function(){angular.forEach(a.friendsCandidate,function(b){d.save({twitter_user_id:f,register_word_id:g,friend:b},function(c){a.friends.push(c),a.friendsCandidate=e(a.friendsCandidate,function(a){return a.screen_name!==b.screen_name})})})}}]);