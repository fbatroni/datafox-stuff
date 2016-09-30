# DATAFOX COMPANY IMPORTER

This project consists the source code for a command-line tool that imports companies from csv and attempts to find a match in our database.

##Getting started
Clone this repo down and change into the root directory


To install this app run:

``` npm install ``` * this will install any additional dependencies for this tool



To run this app run simply run (from the root directory):
``` coffee app.coffee [additional arguments] ```

- command looks for the following arguments to be passed in:
  - filename [*required] - (i.e. -f crm.csv) - the location of the file you are trying to import
  - output directory [optional] - (i.e. -o /some/folder) - if not specified output will be in output directory
   


## Conventions we are trying to conform to 

   - File/Directory naming 
     - to keep things consistent and sanity sake all directories and filenames should be used with dashes 


## Developing and Testing 
Development of this app requires that you have the following:
   - node
Tests use the mocha framework for some basic validations and assertions to make sure the data is what we expect to see 
   - run ``` npm test ```


