#include "fzy.h"

VALUE rb_mFzy;

void
Init_fzy(void)
{
  rb_mFzy = rb_define_module("Fzy");
}
