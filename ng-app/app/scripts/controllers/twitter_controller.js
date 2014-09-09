'use strict';

angular.module('ngTwiApp')
.service('todos', ['$rootScope', '$filter', function ($scope, $filter) {
  var list = []; // ToDo リスト

  // 調べるwatch broadcast
  // ToDo リストの変更を監視し 全 $scope に対して change:list イベントを発行する
  $scope.$watch(function () {
    return list;
  }, function (value) {
    $scope.$broadcast('change:list', value);
  }, true);

  var where = $filter('filter');

  var done = { done: true };
  var remaining = { done: false };

  // リストが扱えるフィルタリング条件
  this.filter = {
    done: done,
    remaining: remaining
  };

  // 完了状態の ToDo のみを抽出して返す
  this.getDone = function () {
    return where(list, done);
  };

  // 要件を受け取り新しい ToDo をリストに加える
  this.add = function (title) {
    list.push({
      title: title,
      done: false
    });
  };

  // 引数の ToDo をリストから取り除く
  this.remove = function (currentTodo) {
    list = where(list, function (todo) {
      return currentTodo !== todo;
    });
  };

  // 完了状態の ToDo をリストから取り除く
  this.removeDone = function () {
    list = where(list, remaining);
  };

  // リスト内の ToDo すべての状態を引数に合わせる
  this.changeState = function (state) {
    angular.forEach(list, function (todo) {
      todo.done = state;
    });
  };
}])






.controller('TwitterController', ['$scope', 'todos',
  function($scope, todos) {

  // RegisterController
  $scope.newTitle = '';

  $scope.addTodo = function () {
    todos.add($scope.newTitle);
    $scope.newTitle = '';
  };

  // ToolbarController
  $scope.filter = todos.filter;

  $scope.$on('change:list', function (evt, list) {
    var length = list.length;
    var doneCount = todos.getDone().length;

    $scope.allCount = length;
    $scope.doneCount = doneCount;
    $scope.remainingCount = length - doneCount;
  });

  $scope.checkAll = function () {
    var state = !!$scope.remainingCount;
    todos.changeState(state);
  };

  // $scope.currentFilter = null;
  //
  // $scope.changeFilter = function (filter) {
  //   $scope.currentFilter = filter;
  //   debugger;
  // };
  $scope.changeFilter = function (filter) {
    $scope.$emit('change:filter', filter);
  };

  $scope.removeDoneTodo = function () {
     todos.removeDone();
  };

  // var where = $filter('filter');
  // $scope.$watch('todos', function (todos) {
  //   var length = todos.length;
  //
  //   $scope.allCount = length;
  //   $scope.doneCount = where(todos, $scope.filter.done).length;
  //   $scope.remainingCount = length - $scope.doneCount;
  // }, true);

  // TodoListcontoroller
  $scope.$on('change:list', function (evt, list) {
    $scope.todoList = list;
  });

  var originalTitle;

  $scope.editing = null;

  $scope.editTodo = function (todo) {
    originalTitle = todo.title;
    $scope.editing = todo;
  };

  $scope.doneEdit = function (todoForm) {
    if (todoForm.$invalid) {
      $scope.editing.title = originalTitle;
    }
    $scope.editing = originalTitle = null;
  };

  $scope.removeTodo = function (todo) {
     todos.remove(todo);
  };

  $scope.currentFilter = null;

  $scope.$on('change:filter', function (evt, filter) {
    $scope.currentFilter = filter;
  });
}])

.directive('mySelect', [function () {
  return function (scope, $el, attrs) {
    scope.$watch(attrs.mySelect, function (val) {
      if (val) {
        $el[0].select();
      }
    });
  };
}]);
