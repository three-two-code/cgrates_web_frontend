# jshint expr:true
import Ember from 'ember'
import startApp from 'cgrates-web-frontend/tests/helpers/start-app'
import { authenticateSession } from 'cgrates-web-frontend/tests/helpers/ember-simple-auth'

describe "Acceptance: TpRate.Index", ->
  beforeEach ->
    @App = startApp()
    @tariffPlan = server.create 'tariff-plan', name: 'Test', alias: 'tptest'
    @tpRate = server.create 'tp-rate', tpid: @tariffPlan.alias, tag: 'tagtest'
    authenticateSession(@App, {email: "user@example.com"})
    return

  afterEach ->
    Ember.run(@App, "destroy")

  describe 'basic rendering', ->
    it 'renders specific header', ->
      visit '/tariff-plans/1/tp-rates'
      click "table tbody tr:first-child td a:contains('tagtest')"
      andThen ->
        expect(find('main h2').text()).to.eq('TpRate: tagtest')

  describe 'click edit button', ->
    it 'redirects to tp-rate edit page', ->
      visit '/tariff-plans/1/tp-rates'
      click "table tbody tr:first-child td a:contains('tagtest')"
      click '.fixed-action-btn a'
      andThen ->
        expect(currentPath()).to.equal 'tariff-plans.tariff-plan.tp-rates.tp-rate.edit'
