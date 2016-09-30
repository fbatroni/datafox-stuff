fs      = require 'fs'
path    = require 'path'
_       = require 'lodash'
Promise = require 'bluebird'



module.exports = 
  load: (options) ->
    fileToLoad = path.resolve(options.file)
    new Promise (resolve, reject) ->
      Converter = require("csvtojson").Converter
      converter = new Converter()
      converter.fromFile fileToLoad, (err, result) ->
        if err? then reject(err)
        resolve(result)