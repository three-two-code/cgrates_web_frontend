import Ember from 'ember'

export default Ember.Route.extend
  model: (params) -> @store.find('tp-timing', params['tp-timing_id'])
