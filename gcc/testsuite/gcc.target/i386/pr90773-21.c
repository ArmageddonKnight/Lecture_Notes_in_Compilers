/* { dg-do compile } */
/* { dg-options "-O2 -march=skylake" } */

extern char *dst;

void
foo (int c)
{
  __builtin_memset (dst, c, 34);
}

/* { dg-final { scan-assembler-times "vmovdqu\[\\t \]%ymm\[0-9\]+, \\(%\[\^,\]+\\)" 1 } } */
/* { dg-final { scan-assembler-times "movw\[\\t \]%.*, 32\\(%\[\^,\]+\\)" 1 } } */