module Ffsr
# exception handler for class OptParse and class OptPostprocess
  class CommandLineErrorHandler < StandardError
    attr_reader :message, :subject

    def initialize(message, subject = '')
      @message = message
      @subject = subject
      super()
    end

    def PrintMessage
      mess = @message
      if @subject.length > 0
        mess += ': ' + @subject
      else
        mess += '.'
      end
      puts mess
    end
  end
end
