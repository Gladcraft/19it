require 'pp'
module OneNineIt
  module Cli
    extend self

    def run(argv = ARGV)
      pp Search.search(argv, OneNineIt.changes)
    end
  end
end