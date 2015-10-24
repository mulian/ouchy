# Touch
TouchEvent = require './touch-event'
TouchConditions = require './touch-conditions'
TouchCheckConditions = require './touch-check-conditions'
TouchTest = require './touch-test'

module.exports =
class Touch
  conditions: []
  constructor: ->
    @touchEvent = new TouchEvent @trigger
    @check = new TouchCheckConditions @setCall, @conditions

  setCall: (@call) =>
  call: null
  trigger: (e) =>
    e.preventDefault()
    if @call==null and e.start
      @check.allConditionsCheck e

    @call e if @call!=null

    if e.end
      @call = null
      @check.resetConditions()

  newCondition: ->
    con = new TouchConditions()
    @conditions.push con
    return con
  on: (element) ->
    con = @newCondition()
    con.element = element
    return con

window.touch = new Touch()
