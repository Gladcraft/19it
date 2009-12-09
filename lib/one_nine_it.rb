$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__))
require 'one_nine_it/cli'
require 'one_nine_it/change'
require 'one_nine_it/search'
require 'one_nine_it/match'

module OneNineIt
  CHANGES = [
    {:desc=>"A module's constants", :parse_sidekick=>/\.constants[ (]/,
      :solution=>"Module#constants.map {|e| e.to_s }"
      # Example.constants  
    }
  ]

  def self.changes
    @changes ||= CHANGES.map {|c| Change.new c }
  end
end