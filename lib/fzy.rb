require "fzy/version"
require "fzy/fzy"

module Fzy
  class Error < StandardError; end

  class Match
    def initialize(needle, haystack)
      @needle = needle
      @haystack = haystack
    end

    def score
      @score ||= Fzy.score(@needle, @haystack)
    end

    def positions
      @positions ||= Fzy.positions(@needle, @haystack)
    end
  end

  def self.match(needle, haystack)
    if has_match?(needle, haystack)
      Match.new(needle, haystack)
    end
  end
end
