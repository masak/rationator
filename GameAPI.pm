use 5.010;

package GameAPI;
use YAML qw<LoadFile>;
use Game;
use Move;

sub load_games_from_file {
    my $class = shift;
    my $file = shift;

    my @games;
    for my $game (@{LoadFile($file)}) {
        my @moves = map {
            $_ =~ /swap/ ? Move->new(
                            is_swap => 1,
                            player  => substr($_, 0, 1),
                            row     => -1,
                            column  => -1 )
                         : Move->new(
                            player => substr($_, 0, 1),
                            row    => (ord(substr($_, 2, 1)) - ord("a") + 1),
                            column => (ord(substr($_, 3, 1)) - ord("a") + 1) )
        } split ';', $game->{moves};
        push @games, Game->new( moves => [@moves],
                                was_swapped => $moves[1]->is_swap );
    }
    return @games;
}

1;
