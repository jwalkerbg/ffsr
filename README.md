# Ffsr

FFSR is a helper tool that facilitates the work with FreeFileSync in batch mode. It is capable to run in sequence several FFS batch files given on the command line. FFSR accepts arguments with wilcards.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ffsr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ffsr

## Usage

FFSR command line is

	ffsr executablefile files

	executablefile is a path pointing to the executable fo FreeFileSync
	files are the FFS batch files to be processed by FreeFileSync

Examples

	ffsr "c:\program files\FreeFileSync\FreeFileSync.exe" archive.ffs_batch
	ffsr "c:\program files\FreeFileSync\FreeFileSync.exe" g:\FFS\*.ffs_bacth
