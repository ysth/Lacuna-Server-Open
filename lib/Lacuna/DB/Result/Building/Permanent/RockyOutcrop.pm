package Lacuna::DB::Result::Building::Permanent::RockyOutcrop;

use Moose;
use utf8;
no warnings qw(uninitialized);
extends 'Lacuna::DB::Result::Building::Permanent';

use constant controller_class => 'Lacuna::RPC::Building::RockyOutcrop';

around can_build => sub {
    my ($orig, $self, $body) = @_;
    if ($body->get_plan(__PACKAGE__, 1)) {
        return $orig->($self, $body);  
    }
    confess [1013,"You can't build a rocky outcropping. It forms naturally."];
};

sub can_upgrade {
    confess [1013, "You can't upgrade a rocky outcropping. It forms naturally."];
}

use constant image => 'rockyoutcrop';
use constant ore_production => 10; 

sub image_level {
    my ($self) = @_;
    return $self->image.'1';
}

use constant name => 'Rocky Outcropping';
use constant time_to_build => 0;


no Moose;
__PACKAGE__->meta->make_immutable(inline_constructor => 0);
