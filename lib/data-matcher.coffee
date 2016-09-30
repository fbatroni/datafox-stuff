_              = require 'lodash'

module.exports = 
  companyMatch: (data, company) ->
    matches = []
    
    #make search case insensitive
    nameToMatch = company?.Name?.toLowerCase()
    urlToMatch = company?.URL?.toLowerCase()
    
    _.map data, (c) ->
      nameMatch  = nameToMatch.indexOf(c.name.toLowerCase()) > -1
      namesMatch = _.filter c?.corporate_names, (companyName) ->
        companyName = companyName?.toLowerCase()
        companyName.indexOf(nameToMatch) > -1
      urlMatch   = _.filter c.urls, (u) -> urlToMatch?.indexOf(u) > -1

      matches.push (c.id) if nameMatch
      matches.push (c.id) if urlMatch.length > 0
      matches.push (c.id) if namesMatch.length > 0

        
    _.uniq matches