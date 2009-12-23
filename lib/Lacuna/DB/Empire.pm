package Lacuna::DB::Empire;

use Moose;
extends 'SimpleDB::Class::Item';

__PACKAGE__->set_domain_name('empire');
__PACKAGE__->add_attributes(
    name            => { isa => 'Str' },
    date_created    => { isa => 'DateTime' },
    description     => { isa => 'Str' },
    status_message  => { isa => 'Str' },
    friends_and_foes=> { isa => 'Str' },
    username        => { isa => 'Str' },
    password        => { isa => 'Str' },
    species_id      => { isa => 'Str' },
    happiness       => { isa => 'Int' },
    essentia        => { isa => 'Int' },
    points          => { isa => 'Int' },
    rank            => { isa => 'Int' }, # just where it is stored, but will come out of date quickly
);

# achievements
# personal confederacies

__PACKAGE__->belongs_to('species', 'Lacuna::DB::Species', 'species_id');
__PACKAGE__->has_many('alliance', 'Lacuna::DB::AllianceMember', 'alliance_id');
__PACKAGE__->has_many('planets', 'Lacuna::DB::Planet', 'empire_id');

no Moose;
__PACKAGE__->meta->make_immutable;
