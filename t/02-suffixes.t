use Test::More tests => 3;
BEGIN { use_ok('Text::Affixes') };

my $text = "Hello, world. Hello, big world.";
my $suffixes = get_suffixes($text);

is_deeply( $suffixes ,
  # $suffixes now holds
  {
      3 => {
              'llo' => 2,
              'rld' => 2,
      }
  });

$suffixes = get_suffixes({min => 1, max => 2},$text);

is_deeply( $suffixes ,
  # $suffixes now holds
  {
      1 => {
              'o' => 2,
              'd' => 2,
              'g' => 1,
      },
      2 => {
              'lo' => 2,
              'ld' => 2,
              'ig' => 1,
      }
  });
