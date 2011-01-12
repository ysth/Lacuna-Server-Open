use 5.010;
use strict;
use lib '/data/Lacuna-Server/lib';
use Lacuna::DB;
use Lacuna;
use Getopt::Long;
$|=1;
our $quiet;
our $add_one;
GetOptions(
    'quiet'         => \$quiet,
    addone          => \$add_one,
);



out('Started');
my $start = time;

my $trelvestian = Lacuna::AI::Tralvestian->new;

$trelvestian->add_colonies($add_one);


my $finish = time;
out('Finished');
out((($finish - $start)/60)." minutes have elapsed");




###############
## SUBROUTINES
###############

sub out {
    my $message = shift;
    unless ($quiet) {
        say format_date(DateTime->now), " ", $message;
    }
}

