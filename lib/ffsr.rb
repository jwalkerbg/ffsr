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
        #pp options
        #raise 'No kind of the input files was given (-k option). Please run \'smde -h\'' if options[:kind] == nil
      rescue => e
        puts e
        options[:opterrors] += 1
      end

      ConditionalExit(options)

    end

# ConditionalExit
# This function exits program if there were command line errors
    def ConditionalExit(options)
      if options[:opterrors] > 0
        pp options
        exit OPTION_ERROR
      end
    end
  end

end # end module
