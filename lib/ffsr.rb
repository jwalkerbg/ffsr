require "ffsr/version"
require 'optparse'
require 'ffsr/CommandLineErrorHandler'
require 'ffsr/OptParse'


module Ffsr
  class Error < StandardError; end
  # Your code goes here...

# applcation definition
  APPNAME = 'ffsr'
  IDSW_NUMBER = 109218

  NORMAL_EXIT = 0
  OPTION_ERROR = 1

# main program begins here
  class Mainclass
    def main
      # primary parse of the commandline options
      begin
        options = OptParse.parse(ARGV)
        raise CommandLineErrorHandler.new('No program and/or files are given') if ARGV.size < 2
      rescue CommandLineErrorHandler => e
        e.printMessage
        options[:opterrors] += 1
      end

      ConditionalExit(options)

      program, *files = ARGV

# check existence of the program
      begin
        raise CommandLineErrorHandler.new('The program executable does not exists') if File.file?(program) == false
      rescue
        e.printMessage
        options[:opterrors] += 1
      end

      ConditionalExit(options)

# work here
      files.each do |f|
        puts program + ' ' + f if options[:verbose] != nil && options[:verbose] == true
        system(program,f) if options[:dryrun] == nil || options[:dryrun] != true
      end
    end # main

# ConditionalExit
# This function exits program if there were command line errors
    def ConditionalExit(options)
      if options[:opterrors] > 0
        pp options
        exit OPTION_ERROR
      end
    end
  end   # Mainclass

end # end module
