package Lacuna::DB::Result::Building::Module::IBS;

use Moose;
use utf8;
no warnings qw(uninitialized);
extends 'Lacuna::DB::Result::Building::Module';
with 'Lacuna::Role::Influencer';

use constant controller_class => 'Lacuna::RPC::Building::IBS';
use constant image => 'ibs';
use constant name => 'Interstellar Broadcast System';
use constant max_instances_per_planet => 1;
use constant energy_consumption => 160;

before demolish => sub {
    my $self = shift;
    my $laws = $self->body->laws->search({type => 'Jurisdiction'});
    while (my $law = $laws->next) {
        $law->delete;
    }
};

# after downgrade do we have the new range
after downgrade => sub {
    my $self = shift;
    my $station = $self->body;
    my $laws = $station->laws->search({type => 'Jurisdiction'});
    while (my $law = $laws->next) {
        unless ($station->in_range_of_influence($law->star)) {
            $law->delete;
        }
    }
};


no Moose;
__PACKAGE__->meta->make_immutable(inline_constructor => 0);
