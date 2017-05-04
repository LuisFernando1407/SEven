var app = angular.module('app', ['ui.calendar', 'ui.bootstrap']);

app.controller('MyController', function($scope) {
    /* config object */
    $scope.uiConfig = {
      calendar:{
        height: 450,
        editable: false,
        defaultView: 'agendaWeek',
        eventClick: $scope.alertEventOnClick,
        eventDrop: $scope.alertOnDrop,
        eventResize: $scope.alertOnResize
      }
    };
    
    // For test events
     var date = new Date();
     var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

     // Clear events and assign the static events source.
     $scope.events = [];
     $scope.staticEvents = [
     {title: 'Static 1', start: new Date(y, m, 1), allDay: true},
     {title: 'Static 2', start: new Date(y, m, 8), allDay: true},
     {title: 'Static 3', start: new Date(y, m, d), allDay: true}
     ];
  
    // Clear events via splice(0) and then push into events source.
     $scope.getEventsEmptySplice = function () {
        console.log('Clearing $scope.events via splice(0)');
        
    // Clearing in this manner maintains the two-way data bind.
    // This can be called over and over, with old events cleared,
    // and new random events displayed. This no longer works
    // if getEventsEmptyArray is ever called, due to two-way
    // data bind being broken within that function.
    $scope.events.splice(0);
    
    // Get 3 random days, 1-28
    var day1 = Math.floor(Math.random() * (28 - 1)) + 1;
    var day2 = Math.floor(Math.random() * (28 - 1)) + 1;
    var day3 = Math.floor(Math.random() * (28 - 1)) + 1;
    
    // Simulating an AJAX request with $timeout.
    $timeout(function () {
      // Create temp events array.
      var newEvents = [
        {title: 'Random 1', start: new Date(y, m, day1), allDay: true},
        {title: 'Random 2', start: new Date(y, m, day2), allDay: true},
        {title: 'Random 3', start: new Date(y, m, day3), allDay: true}
      ];
      // Push newEvents into events, one by one.
      angular.forEach(newEvents, function (event) {
        $scope.events.push(event);
      });
      console.log('New Events pushed');
    }, 100);
  };

  // Clear events via empty array and then push into events source.
  $scope.getEventsEmptyArray = function () {
    console.log('Clearing $scope.events via assigning empty array');
    
    // Clearing in this manner, assigns a new empty array
    // to $scope.events, and breaks the two-way data bind.
    // Once this is called, no update of $scope.events will
    // change the calendar, because the events array in the controller
    // scope is different from the events array in the calendar
    // directive isolate scope.
    $scope.events = [];
    
    // Get 3 random days, 1-28
    var day1 = Math.floor(Math.random() * (28 - 1)) + 1;
    var day2 = Math.floor(Math.random() * (28 - 1)) + 1;
    var day3 = Math.floor(Math.random() * (28 - 1)) + 1;
    
    // Simulating an AJAX request with $timeout.
    $timeout(function () {
      // Create temp events array.
      var newEvents = [
        {title: 'Random 1', start: new Date(y, m, day1), allDay: true},
        {title: 'Random 2', start: new Date(y, m, day2), allDay: true},
        {title: 'Random 3', start: new Date(y, m, day3), allDay: true}
      ];
      // Push newEvents into events, one by one.
      angular.forEach(newEvents, function (event) {
        $scope.events.push(event);
      });
      console.log('New Events pushed');
    }, 100);
  };

  // Assign the 2 sources to $scope.eventSources for calendar.
  $scope.eventSources = [$scope.staticEvents, $scope.events];
});

