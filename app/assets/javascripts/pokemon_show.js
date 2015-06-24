var PokemonApp = angular.module('PokemonApp', []);

PokemonApp.config(["$httpProvider", function($httpProvider) {
  var authToken = $("meta[name=\"csrf-token\"]").attr("content");
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;
}]);

PokemonApp.directive("addEvButton", ["$http", function($http) {
  return {
    scope: {
      stat: "=",
      pokemon: "@",
      amount: "@",
      evValue: "="
    },
    template: "<button class='btn ev_inc small-btn grey darken-2' ng-click='updateEvs()'>+{{amount}}</button>",
    link: function(scope, elem, attrs) {
      scope.updateEvs = function() {
        scope.evValue += +scope.amount
        var myEl = angular.element( document.querySelector( '.' + scope.stat + '_value' ) );
        myEl.toggleClass('glow');
        setTimeout(function(){
          myEl.removeClass("glow");
        }, 750);
        $http.post('/pokemon/' + scope.pokemon + '/add_ev', {
          pokemon: {
            ev: scope.stat,
            value: scope.amount
          }
        });
      };
    }
  }
}]);


PokemonApp.controller("PokemonCtrl", ["$scope", "$attrs", function($scope, $attrs) {
  $scope.evs = JSON.parse($attrs.data);
}]);