_         = require 'lodash'
dbUtil    = require '../../lib/db-util'


# base model that all that inherits form
# used to keep from duplicating similar functionality
class BaseModel
  
  # loads data from file
  # Params: 
  #  - options i.e. file
  @load: (options)->
    dbUtil.load(options)

module.exports = BaseModel