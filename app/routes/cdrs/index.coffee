import Ember from 'ember'
import QueryRouteMixin from 'cgrates-web-frontend/mixins/query-route-mixin'

export default Ember.Route.extend QueryRouteMixin,
  queryParams:
    cgrid:
      refreshModel: true
    runId:
      refreshModel: true
    originHost:
      refreshModel: true
    source:
      refreshModel: true
    originId:
      refreshModel: true
    tor:
      refreshModel: true
    direction:
      refreshModel: true
    tenant:
      refreshModel: true
    category:
      refreshModel: true
    account:
      refreshModel: true
    destination:
      refreshModel: true
    sortColumn:
      refreshModel: true
    sortOrder:
      refreshModel: true
    page:
      refreshModel: true
    pageSize:
      refreshModel: true

  filterParams: ['cgrid', 'runId', 'originHost', 'source', 'originId', 'tor',
                 'direction', 'tenant', 'category', 'account', 'destination']

  modelName: 'cdr'

  notInTariffPlan: true
