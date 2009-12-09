module OneNineIt
  class Match
    attr_accessor :change, :file, :line_number, :text
    def initialize(hash={})
      @change = hash[:change]
      @file = hash[:file]
      @line_number = hash[:line_number]
      @text = hash[:text]
    end
  end
end