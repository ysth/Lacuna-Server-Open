package Lacuna::DB::Result::Ships::Bomber;

use Moose;
no warnings qw(uninitialized);
extends 'Lacuna::DB::Result::Ships';

use constant prereq         => { class=> 'Lacuna::DB::Result::Building::University',  level => 99 };
use constant food_cost      => 18000;
use constant water_cost     => 46800;
use constant energy_cost    => 291600;
use constant ore_cost       => 343830;
use constant time_cost      => 58400;
use constant waste_cost     => 75600;
use constant base_speed     => 1000;
use constant base_stealth   => 2000;
use constant base_hold_size => 0;


sub arrive {
    my ($self) = @_;
    $self->delete;
}

no Moose;
__PACKAGE__->meta->make_immutable(inline_constructor => 0);