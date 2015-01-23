ng = angular

ng.module 'cssdesk.services', []
ng.module 'cssdesk.controllers', []
ng.module 'cssdesk.directives', []
ng.module 'cssdesk.filters', []

ng.module 'cssdesk', [
  'cssdesk.services'
  'cssdesk.controllers'
  'cssdesk.directives'
  'cssdesk.filters'
]