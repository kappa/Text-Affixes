package Text::Affixes;

use 5.006;
use strict;
use warnings;

require Exporter;
use AutoLoader qw(AUTOLOAD);

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	get_prefixes
	get_suffixes
);

our $VERSION = '0.04';

sub get_prefixes {
	my %conf = (min => 3, max => 3);
	if (ref $_[0] eq 'HASH') {
		%conf = (%conf, %{+shift});
	}
	my %elements;
	my $text = shift || return undef;
	$conf{min} = 1 if $conf{min} < 1;
	for ($conf{min} .. $conf{max}) {
	while ($text =~ /\b(\w{$_})\w/g) {
			$elements{$_}{$1}++;
		}
	}
	return \%elements;
}

sub get_suffixes {
	my %conf = (min => 3, max => 3);
	if (ref $_[0] eq 'HASH') {
		%conf = (%conf, %{+shift});
	}
	my %elements;
	my $text = shift || return undef;
	$conf{min} = 1 if $conf{min} < 1;
	for ($conf{min} .. $conf{max}) {
	while ($text =~ /\w(\w{$_})\b/g) {
			$elements{$_}{$1}++;
		}
	}
	return \%elements;
}

1;
__END__

=head1 NAME

Text::Affixes - Basis for Prefixes and Suffixes analisys of text

=head1 SYNOPSIS

  use Text::Affixes;
  my $text = "Hello, world. Hello, big world.";
  my $prefixes = get_prefixes($text);

  # $prefixes now holds
  # {
  # 	3 => {
  # 		'Hel' => 2,
  # 		'wor' => 2,
  # 	}
  # }

  # or

  $prefixes = get_prefixes({min => 1, max => 2},$text);

  # $prefixes now holds
  # {
  # 	1 => {
  # 		'H' => 2,
  # 		'w' => 2,
  # 		'b' => 1,
  # 	},
  # 	2 => {
  # 		'He' => 2,
  # 		'wo' => 2,
  # 		'bi' => 1,
  # 	}
  # }

  # the use for get_suffixes is similar

=head1 DESCRIPTION

This module, still in its early stages, is meant to be used
in Natural Language Processing tools that require Prefixe or
Suffix examination of text.

=head1 TO DO

=over 6

=item * Improve the documentation

=item * Make it more efficient (use C for that)

=item * Add object interface

=back

=head1 AUTHOR

Jose Alves de Castro, E<lt>cog@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2004 by Jose Castro

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.3 or,
at your option, any later version of Perl 5 you may have available.

=cut
