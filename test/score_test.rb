require "test_helper"

class ScoreTest < Minitest::Test
  def score(needle, haystack)
    Fzy.score(needle, haystack)
  end

  def test_should_prefer_starts_of_words
    # App/Models/Order is better than App/MOdels/zRder
    assert score("amor", "app/models/order") > score("amor", "app/models/zrder")
  end

  def test_should_prefer_consecutive_letters
    # App/MOdels/foo is better than App/M/fOo
    assert score("amo", "app/m/foo") < score("amo", "app/models/foo")
  end

  def test_should_prefer_contiguous_over_letter_following_period
    # GEMFIle.Lock < GEMFILe
    assert score("gemfil", "Gemfile.lock") < score("gemfil", "Gemfile")
  end

  def test_should_prefer_shorter_matches
    assert score("abce", "abcdef") > score("abce", "abc de")
    assert score("abc", "    a b c ") > score("abc", " a  b  c ")
    assert score("abc", " a b c    ") > score("abc", " a  b  c ")
  end

  def test_should_prefer_shorter_candidates
    assert score("test", "tests") > score("test", "testing")
  end

  def test_should_prefer_start_of_candidate
    # Scores first letter highly
    assert score("test", "testing") > score("test", "/testing")
  end

  def test_score_exact_score
    # Exact match is SCORE_MAX
    assert_equal Float::INFINITY, score("abc", "abc")
    assert_equal Float::INFINITY, score("aBc", "abC")
  end

  def test_score_empty_query
    # Empty query always results in SCORE_MIN
    assert_equal -Float::INFINITY, score("", "")
    assert_equal -Float::INFINITY, score("", "a")
    assert_equal -Float::INFINITY, score("", "bb")
  end
end
