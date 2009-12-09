module OneNineIt
  class Change
    attr_accessor :solution, :desc, :parse_sidekick
    def initialize(hash)
      @solution = hash[:solution]
      @desc = hash[:desc]
      @parse_sidekick = hash[:parse_sidekick]
    end
  end
end