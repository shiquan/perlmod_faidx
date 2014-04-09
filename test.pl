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

