require "test_helper"

class MatchTest < Minitest::Test
  def assert_has_match(needle, haystack)
    msg = "Expected '#{needle}' to match '#{haystack}'"
    assert Fzy.has_match?(needle, haystack), msg
  end

  def refute_has_match(needle, haystack)
    msg = "Expected '#{needle}' not to match '#{haystack}'"
    refute Fzy.has_match?(needle, haystack), msg
  end

  def test_exact_match_should_return_true
    assert_has_match("a", "a")
  end

  def test_partial_match_should_return_true
    assert_has_match("a", "ab")
    assert_has_match("a", "ba")
  end

  def test_match_with_delimiters_in_between
    assert_has_match("abc", "a|b|c")
  end

  def test_non_match_should_return_false
    refute_has_match("a", "")
    refute_has_match("a", "b")
    refute_has_match("ass", "tags")
  end

  def test_empty_query_should_always_match
    assert_has_match("", "")
    assert_has_match("", "a")
  end
end
