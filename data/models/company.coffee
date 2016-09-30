_         = require 'lodash'
BaseModel = require './base'

class Company extends BaseModel
  
  prop_names: ['id' #The ID of the company
    'name' #The name of the company
    'corporate_names' #[]string - Other (corporate) names for the company (e.g. “Acme, Inc.” could be a corporate name for “Acme”)
    'fka_names' #Formerly-known-as names the company used.
    'products' #Names of any products the company has.
    'urls' #URLs the company has.
    'acquirer' #ID of the company’s acquirer (if applicable)
  ]

  constructor: ->

  @normalize: (data) ->
    _.each @prop_names, (attr) ->
      @[ attr ] = data?[ attr ]
    
  @load: (options)->
    super options


module.exports = Company

