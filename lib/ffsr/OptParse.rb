module Ffsr
# command line options - This variable is used to transfer information between option processing
# and posprocessing.
# hashes
#   :opterrors - counter of errors in parsing and postprocessing

  class OptParse
    def self.parse(argv)
      options = {:opterrors => 0}
      opterrors = 0

      opt_parser = OptionParser.new do |opt|
        opt.banner = 'Usage: ffsr FFSR_batch_files [options]'

        opt.on('--dry-run', 'Does everything as usual except creating output files') do
          options[:dryrun] = true
        end

        opt.on_tail('-V', '--verbose', 'Verbose output') do
          options[:verbose] = true
        end

        opt.on_tail('-v', '--version', 'Show version') do
          puts APPNAME + ' ' + VERSION
          exit NORMAL_EXIT
        end
      end   # opt_parser = OptionParser.new do |opt|
      begin
        opt_parser.parse!
      rescue => e
        puts 'Errors on the command line'
        opterrors += 1
      end

      options[:opterrors] = opterrors
      options
    end # parse
  end # class Optparse
end
