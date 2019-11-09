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

void
Init_fzy(void)
{
  rb_mFzy = rb_define_module("Fzy");

  rb_define_module_function(rb_mFzy, "has_match", rb_has_match, 2);
}
