chai           = require 'chai'
assert         = chai.assert
chaiAsPromised = require 'chai-as-promised'

chai.Should()
chai.use(chaiAsPromised)


Company      = require '../data/models/company'
testCompany  = require './fixtures/company'
testImport   = require './fixtures/import'


describe 'Company data validation tests', -> 
  checkCompanyObject = (company) ->
    assert.typeOf company, 'object', 'we have an object'
    assert.instanceOf company, Company, 'company is an instance of Company'

  describe 'create company from data model', ->
    it 'instantiate a company object from company model', ->
     company = new Company (testCompany)
     checkCompanyObject(company)
     
  describe 'raw import data from file', ->
    it 'instantiate a company object from company model', ->
      options =
        file: "#{__dirname}/fixtures/test.csv"
      assert.becomes( Company.load(options), testImport, "Successfully imported from csv")

