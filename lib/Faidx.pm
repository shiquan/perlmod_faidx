package Faidx;

use 5.010001;
use strict;
use warnings;
use Carp;


our $VERSION = '0.1.1';


sub new {
  my $class = shift;
  my ($fa) = @_;
  my $fai = fai_load($fa);
  my $ref = {"fai" => $fai,
	     "fa" => $fa,
	    };
  bless($ref, $class);
  return $ref;
}

sub getseq {
  my $self = shift;
  my ($bed) = @_;
  my $seq = seq_fetch($self->{"fai"}, $bed);
  return $seq;
}

sub destroy {
  my $self = shift;
  fai_destroy($self->{"fai"});
}


require XSLoader;
XSLoader::load('Faidx', $VERSION);

1;
__END__

=head1 NAME

Faidx - Perl extension for retrieve fasta seq quickly and lightly by cached samtools index file

=head1 VERSION

version 0.1.1

=head1 SYNOPSIS

  use Faidx;
  my $fetch = Faidx->new($fasta);
  my $seq = $fetch->getseq($bed);
  $fetch->destroy()

=head2 new

  About   :  Create new faidx object.
  Usage   :  my $fetch = Faidx->new('ref.fa');
  Args    :  fasta format file

=head2 getseq

  About   :  Retrieves sequence region
  Usage   :  my $seq = $fetch->getseq('chr1:1-2');
  Args    :  bed format region
             1-based corrdinate

=head2 destroy

  About   :  Destroy cached faidx struct
  Usage   :  $fetch->destroy();
  Args    :  None

=head1 AUTHOR

Shi Quan, E<lt>shiquan@genomics.cn>

=head1 COPYRIGHT AND LICENSE


Copyright (C) 2014 by BGI research.

This is free software, licensed under:

  The GNU General Public License, Version 3, June 2007

=cut
