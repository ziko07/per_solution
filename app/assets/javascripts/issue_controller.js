perSolution.controller('issueCtrl', ['$scope', '$http', '$location', function ($scope, $http, $location) {
    $http.get('/issues.json').success(function(response)
    {
        $scope.issues = response;
    });
}]);

perSolution.controller('issuesShowCtrl', ['$scope', '$http', '$stateParams', '$filter', '$sce', function ($scope, $http, $stateParams, $filter, $sce) {
    $scope.is_editable = false;
    $scope.solution_id = 0;
    $http.get('/issues/' + $stateParams.id + '.json').success(function(response)
    {
        $scope.issue = response;
        $scope.solution = {description: ''}
    });

    $scope.edit_solution = function(id) {
        if($scope.is_editable) {
            $("#solution-" + $scope.solution_id).removeClass('active');
        }
        var obj = $filter('filter')($scope.issue.solutions, {id: id })[0];
        $scope.solution = {description: obj.description};
        $scope.solution_id = obj.id;
        $scope.is_editable = true;
        $("#solution-" + obj.id).addClass('active');
    };

    $scope.edit_cancel = function() {
        $scope.solution = {description: ''};
        $("#solution-" + $scope.solution_id).removeClass('active');
        $scope.solution_id = 0;
        $scope.is_editable = false;
    };

    $scope.update_solution = function() {
        var obj = $filter('filter')($scope.issue.solutions, {id: $scope.solution_id })[0];
        var formData = {solution: $scope.solution};
        $http.put("/issues/" + $stateParams.id + "/solutions/" + obj.id + ".json", JSON.stringify(formData)).success(function(response) {
            obj.description = response.description;
            $scope.solution = {description: ''};
            $scope.is_editable = false;
            $("#solution-" + $scope.solution_id).removeClass('active');
            $scope.solution_id = 0;
        });
    };

    $scope.html_safe = function(html_content) {
        return $sce.trustAsHtml(html_content);
    };

    $scope.post_solution = function() {
        var formData = {solution: $scope.solution};
        $http.post("/issues/" + $stateParams.id + "/solutions.json", JSON.stringify(formData)).success(function(response) {
            $scope.issue.solutions.push(response);
            $scope.solution = {description: ''};
        });
    };
}]);