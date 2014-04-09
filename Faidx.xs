#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "fastaindex.h"

#include "const-c.inc"

MODULE = Faidx		PACKAGE = Faidx		

INCLUDE: const-xs.inc

faidx_t*
fai_load(fn)
	char *fn
	CODE:
	RETVAL = fai_load(fn);
	OUTPUT:
	RETVAL

SV*
seq_fetch(fai, str)
	faidx_t *fai
	char *str
	PREINIT:
	const char *s;
	int len;
	CODE:
	s = fai_fetch(fai, str, &len);
	if (s == 0)
	   return XSRETURN_EMPTY;
	RETVAL = newSVpv(s, len);
	OUTPUT:
	RETVAL

void
fai_destroy(fai)
	faidx_t* fai
CODE:
	fai_destroy(fai);
