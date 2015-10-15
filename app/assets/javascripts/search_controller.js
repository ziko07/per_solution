perSolution.controller('searchCtrl', ['$scope', '$http', function ($scope, $http) {
    var formData = {q: $('#q').val(), category: $('#category').val(), language: $('#language').val()};
    $http.get('/search.json', JSON.stringify(formData)).success(function (response) {
        console.log(response)
    });
}]);