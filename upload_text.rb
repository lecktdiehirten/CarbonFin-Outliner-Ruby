#!/usr/bin/env ruby
require './carbonfin.rb'

USAGE = "Usage: upload_text.rb <name> (<are_tasks>)"

def die(msg)
  warn msg
  exit 1
end

die "Usage: upload_text.rb <name> (<are_tasks>)" if ARGV.count < 1
name = ARGV[0]
tasks = ARGV[1] != 'false' unless ARGV.count < 2

cfa = CFAgent.new
die "Please login using login.rb first." unless cfa.login

cfa.upload_text(name, $stdin.read, tasks)