# jshint expr:true
import Ember from 'ember'
import startApp from 'cgrates-web-frontend/tests/helpers/start-app'
import { authenticateSession } from 'cgrates-web-frontend/tests/helpers/ember-simple-auth'

describe "Acceptance: TpAction.Index", ->
  beforeEach ->
    @App = startApp()
    @tariffPlan = server.create 'tariff-plan', name: 'Test', alias: 'tptest'
    @tpAction = server.create 'tp-action', tpid: @tariffPlan.alias, tag: 'test'
    authenticateSession(@App, {email: "user@example.com"})
    return

  afterEach ->
    Ember.run(@App, "destroy")

  describe 'basic rendering', ->
    it 'renders specific header', ->
      visit '/tariff-plans/1/tp-actions'
      click "table tbody tr:first-child td a:contains('test')"
      andThen ->
        expect(find('main h2').text()).to.eq('TpAction: test')

  describe 'click edit button', ->
    it 'redirects to tp-action edit page', ->
      visit '/tariff-plans/1/tp-actions'
      click "table tbody tr:first-child td a:contains('test')"
      click '.fixed-action-btn a'
      andThen ->
        expect(currentPath()).to.equal 'tariff-plans.tariff-plan.tp-actions.tp-action.edit'
