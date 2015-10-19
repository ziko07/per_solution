perSolution.controller('issuesNewCtrl', ['$scope', '$http', '$location', function($scope, $http, $location) {
    $scope.issue = {category_id: '', language_id: '', title: ''};
    $http.get('/issues/new.json').success(function($response) {
      $scope.categories = $response.categories;
      $scope.languages = $response.languages;
    });
    $scope.reset_form = function() {
        $scope.issue = {category_id: '', language_id: '', title: ''};
    };
    $scope.post_issue = function() {
        if($scope.issue.category_id != '' && $scope.issue.language_id != '' && $scope.issue.title != '') {
            formData = {issue: $scope.issue};
            $http.post('/issues.json', JSON.stringify(formData)).success(function(response) {
                alert('New issue has been posted successfully');
                $location.path('/');
            });
        }
        else {
            alert('Please fill the require fields');
        }
    };
}]);