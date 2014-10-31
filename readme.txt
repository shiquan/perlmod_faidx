Faidx version 0.1.1
==================

The README is used to introduce the module and provide instructions on
how to install the module, any machine dependencies it may have (for
example C compilers and installed libraries) and any other information
that should be provided before the module is installed.

A README file is required for CPAN modules since CPAN extracts the
README file from a module distribution so that people browsing the
archive can use it get an idea of the modules uses. It is usually a
good idea to provide version information here so that people can
decide whether fixes for the module are worth downloading.

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


Copyright (C) 2014 by BGI Research.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


Demo

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
