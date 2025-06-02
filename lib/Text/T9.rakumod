my constant %default-keys = <
 a 2  b 2  c 2
 d 3  e 3  f 3
 g 4  h 4  i 4
 j 5  k 5  l 5
 m 6  n 6  o 6
 p 7  q 7  r 7  s 7
 t 8  u 8  v 8
 w 9  x 9  y 9  z 9
>;

proto sub t9(|) is export {*}

multi sub t9(Str(Int) $input, @words --> Seq:D) {
    my int $chars = $input.chars;

    @words.map: -> $word {
        $word
          if $word.chars == $chars
          && $word.comb.map({%default-keys{$_}}).join eq $input
    }
}

multi sub t9(Str(Int) $input, @words, %additional --> Seq:D) {
    my int $chars = $input.chars;
    my %keys = %default-keys, %additional;

    @words.map: -> $word {
        $word
          if $word.chars == $chars
          && $word.comb.map({%keys{$_}}).join eq $input
    }
}

my constant &t9_find_words is export = &t9;

# vim: expandtab shiftwidth=4
