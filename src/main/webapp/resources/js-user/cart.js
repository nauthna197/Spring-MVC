var app = angular.module('app', []);




app.controller("cartController",function ($scope,$http,$location) {





    $scope.plus = function () {
        var url = $location.absUrl()+ "cartplus/" + $scope.id;

        var config = {
            headers : {
                'Content-Type' : 'application/json;charset=utf-8;'
            }
        }

        $http.get(url,config).then(function (response) {
            if(response.data.message == "successs"){
                $scope.cart =response.data;
            }else{
                $scope.getResultMessage = "Cannot get cart";
            }
        },function (response) {
                $scope.getResultMessage = "Fail!!!"
            }
        )
    }
});