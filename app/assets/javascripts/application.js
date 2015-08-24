//= require jquery
//= require jquery_ujs
//= require ckeditor/init

//= require angular
//= require angular-rails-templates
//= require angular-route
//= require ui-bootstrap-0.13.3.min

// require turbolinks
// require bootstrap-sprockets
// require jquery-ui
// require_tree .

(function(angular) {
    var opinionApp = angular.module('studentOpinion', ['templates','ngRoute', 'ui.bootstrap']);

    // Configure our routes
    opinionApp.config(['$routeProvider',function($routeProvider){
        $routeProvider
            .when('/', {
                template :   '',
                controller  :   'engineCtrl'
            })
            .when('/review/:reviewId/edit', {
                template    :   '<h1>Edit Review Page</h1>',
                controller  :   'reviewCtrl'
            });
    }]);

    // Engine Controller
    opinionApp.controller('engineCtrl', function($scope, $http, $templateCache){

            console.log('I: Angular/engineCtrl initiated. $scope : '+Object.keys($scope));

            $http.get('/engine.json')
                .success(function(response, status){
                    $scope.users = response;
                })
                .error(function(response, status){
                    $scope.response = response;
                });

            $scope.setRole = function($user, $roleId){
                $user.role = $roleId==1?'author':$roleId==2?'moderator':$roleId==3?'admin':'banned';
                $http.put('/update_user_role?id='+$user.id+'&role='+$user.role)
                    .success(function(response, status){
                        $scope.response = 'Success: '+response;
                    })
                    .error(function(response, status){
                        $scope.response = 'Error: '+status;
                    });
            };
    });

    // Reviews Controller
    opinionApp.controller('reviewsCtrl', function($scope, $http, $location){
        console.log('I: Angular/reviewsCtrl initiated. $scope : '+Object.keys($scope));
        $scope.isCollapsed = true;

        $http.get('/reviews.json')
            .success(function(response, status){
                $scope.reviews = response;

                $scope.averages = [];

                angular.forEach($scope.reviews, function(value, key){
                    $average = (parseFloat(value.faculty_expertise)+parseFloat(value.faculty_communication)+parseFloat(value.cost_worth)
                    +parseFloat(value.transport)+parseFloat(value.library)+parseFloat(value.infrastructure)
                    +parseFloat(value.satisfaction_rate)+parseFloat(value.research)+parseFloat(value.sports))/9;
                    $scope.averages.push(parseFloat($average).toFixed(2));
                });
            })
            .error(function(response, status){
                $scope.response = response;
            });

        $scope.approveReview = function($review){
            $http.put('/approve_review?id='+$review.id)
                .success(function(response, status){
                    $review.is_approved = true;
                    console.log('I: Review Approval Success. Status: '+status);
                })
                .error(function(response, status){
                    console.log('E: Review Approval Error. Status: '+status);
                });
        };

        $scope.editReview = function($review){
            console.log('I: Edit review: '+$review.headline);
        }
    });

    // One more Ctrl goes here

})(window.angular);


