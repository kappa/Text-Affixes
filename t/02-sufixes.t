use Test::More tests => 3;
BEGIN { use_ok('Text::Affixes') };

my $text = "Hello, world. Hello, big world.";
my $sufixes = get_sufixes($text);

is_deeply( $sufixes ,
  # $sufixes now holds
  {
      3 => {
              'llo' => 2,
              'rld' => 2,
      }
  });

$sufixes = get_sufixes({min => 1, max => 2},$text);

is_deeply( $sufixes ,
  # $sufixes now holds
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
