ng.module 'cssdesk.controllers'
  .controller 'slidesCtrl', ['$scope', ($scope)->

      $scope.flexDirections = ['row', 'row-reverse', 'column', 'column-reverse']
      $scope.alignItems = ['flex-start', 'flex-end', 'center', 'baseline', 'stretch']
      $scope.jcs = ['flex-start', 'flex-end', 'center', 'space-around', 'space-between']

      # DEFAULT VALUES

      $scope.flexDirection = $scope.flexDirections[0]
      $scope.alignItem = $scope.alignItems[0]
      $scope.directionContainer = 
        'flexDirection' : $scope.flexDirections[0]
        'alignItem' : $scope.alignItems[0]
        'justify' : $scope.jcs[0]
      $scope.justify = $scope.jcs[0]


      # STYLES

      $scope.directionStyle = 
        'flex-direction' : $scope.flexDirections[0]
      $scope.alignStyle = 
        'align-items' : $scope.alignItems[0]

      $scope.directionContainerStyle = 
        'flex-direction' : $scope.flexDirections[0]
        'align-items' : $scope.alignItems[0]
        'justify-content' : $scope.jcs[0]

      $scope.justifyStyle = 
        'justify-content' : $scope.jcs[0]


      links = [

        {
          "style" : 'flex-direction'
          "value" : "flexDirection"
        },
        {
          "style" : 'align-items'
          "value" : "alignItem"
        },
        {
          "style" : ["flex-direction", "align-items"]
          "value" : "directionStyle"
        },
        {
          "style" : 'justify-content'
          "value" : "justify"
        }
      ]


      selector = (elem, scope)->

        if not scope? 
          elemScope = document 
        else 
          elemScope = document.querySelector scope

        elemScope.querySelectorAll elem
          

      setStyle = (link, val, ctrl)->

        {style} = _.find links, {"value" : link}

        ctrl["#{style}"] = val

        ''

      setComboStyle = (link, val, ctrl)->

        _.forEach val, (value, key)->

          setStyle key, value, ctrl
          
          # ctrl["#{style}"] = value

        

        ''


      $scope.$watch 'flexDirection', (newVal, oldVal)->

        return if newVal is oldVal

        setStyle 'flexDirection', newVal, $scope.directionStyle

      $scope.$watch 'alignItem', (newVal, oldVal)->

        return if newVal is oldVal

        setStyle 'alignItem', newVal, $scope.alignStyle

      $scope.$watch 'justify', (newVal, oldVal)->

        return if newVal is oldVal

        setStyle 'justify', newVal, $scope.justifyStyle

      # COMBOS

      $scope.$watch 'directionContainer', (newVal, oldVal)->

        return if newVal is oldVal
        
        setComboStyle 'directionStyle', newVal, $scope.directionContainerStyle

      , true


  ]