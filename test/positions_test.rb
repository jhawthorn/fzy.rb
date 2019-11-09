require "test_helper"

class PositionsTest < Minitest::Test
  def positions(needle, haystack)
    Fzy.positions(needle, haystack)
  end

  def test_positions_consecutive
    assert_equal [0,4,5], positions("amo", "app/models/foo");
  end

  def test_positions_start_of_word
    # We should prefer matching the 'o' in order, since it's the beginning
    # of a word.
    assert_equal [0,4,11,12], positions("amor", "app/models/order");
  end

  def test_positions_no_bonuses
    assert_equal [1,3], positions("as", "tags")
    assert_equal [2,7], positions("as", "examples.txt")
  end

  def test_positions_multiple_candidates_start_of_words
    assert_equal [2,4,6], positions("abc", "a/a/b/c/c")
  end

  def test_positions_exact_match
    assert_equal [0,1,2], positions("foo", "foo")
  end
end
