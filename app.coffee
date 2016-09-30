#!/usr/bin/env node
fs   = require 'fs'
_    = require 'lodash'
path = require 'path'

argv = require 'yargs'
  .usage('Usage: $0 -f [filename] -o [output]')
  .example('coffee app.coffee -f ./import/crm.csv -o /path/to/output/file.txt', 'import data from crm.csv and output to file.txt')
  .demand(['f'])
  .argv

options =
  file: argv.f
  output: argv.o

data = require ("./data/db.json")
dataMatcher = require './lib/data-matcher'

Company = require './data/models/company'
Company.load(options)
.then (importedCompanies) ->
  dataOutput = _(importedCompanies)
  .map (company) ->
    company.matches = dataMatcher.companyMatch(data, company)
    company
  .value()
  output = options.output
  #output data to text file
  outputDir =  if output? then output else path.resolve("./output")
  outputFile = path.basename(options.file)

  # open up the file for editing and output the data
  writeStream = fs.createWriteStream("#{outputDir}/#{outputFile}.txt", 'flags': 'w+')
  writeStream.write 'Matches\n'
  _.map dataOutput, (out) ->
    writeStream.write "#{out.matches.join(',')}\n"
  writeStream.end '\n'

.catch (err) ->
  console.log 'error loading companies:: ', err


