module Ffsr
# command line options - This variable is used to transfer information between option processing
# and posprocessing.
# hashes
#   :flags - various
#   :opterrors - counter of errors in parsing and postprocessing
#   :kind - kind of input file: 's' for SMD, 'w' for warehouse obligatory one and only one
#   :file - true in input_file -> output_file use case
#   :dir  - true in input_file -> output_path or input_path -> output_path use case
#   :input_file - input file
#   :input_path - input path
#   :output_file - output file, decoded from -o option or from the input file
#   :output_path - output path, decoded from -t option or from the input path

  class OptParse
    def self.parse(argv)
      options = {:opterrors => 0, :flags => 0}
      flags = 0
      opterrors = 0

      opt_parser = OptionParser.new do |opt|
        opt.banner = 'Usage: ffsr FFSR_batch_files'

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

      options[:flags] = flags           # additional information about what was accepted
      options[:opterrors] = opterrors
      options
    end # parse
  end # class Optparse
end
