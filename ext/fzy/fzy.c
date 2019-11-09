#include "fzy.h"
#include "match.h"

static VALUE rb_mFzy;

static VALUE
rb_has_match(VALUE _, VALUE needle, VALUE haystack) {
  const char *needle_str = StringValueCStr(needle);
  const char *haystack_str = StringValueCStr(haystack);
  int match = has_match(needle_str, haystack_str);

  return match ? Qtrue : Qfalse;
}

static VALUE
rb_score(VALUE _, VALUE needle, VALUE haystack) {
  const char *needle_str = StringValueCStr(needle);
  const char *haystack_str = StringValueCStr(haystack);
  double score = match(needle_str, haystack_str);

  return DBL2NUM(score);
}

static VALUE
rb_positions(VALUE _, VALUE needle, VALUE haystack) {
  const char *needle_str = StringValueCStr(needle);
  const char *haystack_str = StringValueCStr(haystack);
  size_t size = RSTRING_LEN(needle);
  VALUE arr = rb_ary_new2(size);

  size_t *positions = xcalloc(size, sizeof(size_t));
  match_positions(needle_str, haystack_str, positions);

  for (size_t i = 0; i < size; i++) {
    rb_ary_push(arr, ULL2NUM(positions[i]));
  }

  xfree(positions);
  return arr;
}

void
Init_fzy(void)
{
  rb_mFzy = rb_define_module("Fzy");

  rb_define_module_function(rb_mFzy, "has_match?", rb_has_match, 2);
  rb_define_module_function(rb_mFzy, "score", rb_score, 2);
  rb_define_module_function(rb_mFzy, "positions", rb_positions, 2);
}
