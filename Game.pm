use 5.010;

package Game;
use Moose;

has 'moves'       => (is => 'ro', isa => 'ArrayRef[Move]', required => 1);
has 'was_swapped' => (is => 'ro', isa => 'Int', default => 0);

1;
