Faidx version 1.0.0
==================

This module provide random acces a fasta file by cached index file.
I modified some functions of faidx.c from samtools library to adapt
this module.

INSTALLATION

To install this module type the following:

   perl Makefile.PL
   make
   make test
   make install

DEPENDENCIES

This module is not require any other modules or libraries.


AUTHOR

     Shi Quan (shiquan@genomics.cn)


COPYRIGHT AND LICENCE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


DEMO

#!/usr/bin/perl
use Faidx;
my $fasta = "test.fa";
my $bed = "chr1:1-2";
my $fetch = Faidx->new($fasta);
my $seq = $fetch->getseq($bed);
print "$seq\n";
$seq = $fetch->getseq("chr1:2-3");
print "$seq\n";
$fetch->destroy();
