require "ffsr/version"
require 'optparse'


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
      puts APPNAME + ' ' + VERSION
    end
  end


end
