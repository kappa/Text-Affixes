use Test::More tests => 3;
BEGIN { use_ok('Text::Affixes') };

my $text = "Hello, world. Hello, big world.";
my $prefixes = get_prefixes($text);

is_deeply( $prefixes ,
  # $prefixes now holds
  {
      3 => {
              'Hel' => 2,
              'wor' => 2,
      }
  });

$prefixes = get_prefixes({min => 1, max => 2},$text);

is_deeply( $prefixes ,
  # $prefixes now holds
  {
      1 => {
              'H' => 2,
              'w' => 2,
              'b' => 1,
      },
      2 => {
              'He' => 2,
              'wo' => 2,
              'bi' => 1,
      }
  });
