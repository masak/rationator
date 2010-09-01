use 5.010;

package Move;
use Moose;

has 'player'  => (is => 'ro', isa => 'Str', required => 1);
has 'row'     => (is => 'ro', isa => 'Int', required => 1);
has 'column'  => (is => 'ro', isa => 'Int', required => 1);
has 'is_swap' => (is => 'ro', isa => 'Int', default => 0);

sub as_game_coords {
    my $self = shift;
    return chr($self->row() - 1 + ord("a")) . $self->column();
}

sub normalize_upper_left {
    my $self = shift;
    if ($self->column() > 14 - $self->row()) { # XXX: 13x13 board assumed
        return Move->new( player    => ($self->player()),
                          row       => (14 - $self->row()),
                          column    => (14 - $self->column()) );
    }
    return $self;
}

1;
