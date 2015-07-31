app.controller('engineCtrl', function($scope, $http, $templateCache){

        $scope.test='dwarko123';

        $http.get('/engine.json')
            .success(function(response, status){
                $scope.users = response;
            })
            .error(function(response, status){

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
    }
);