use strict;
use 5.010;
use String::Random;
use List::MoreUtils qw(uniq part);
use List::Util qw(shuffle);

say "Loading real...";
my @real;
open my $file, "<", "../var/real_starnames.txt";
while (my $name = <$file>) {
    chomp $name;
    push @real, $name;
}
close $file;

say "Loading us...";
my @us = qw(Dillon Knope Vrbsky Smith Runde Rozeske Parker);

say "Generating new...";
my $rs = String::Random->new;
$rs->{e} = [qw(a e i o u ea ee oa oo io ia ae ou ie oe ai ui eu ow)];
$rs->{E} = [qw(A E I O U Ea Ee Oa Oo Io Ia Ae Ou)];
$rs->{b} = [qw(b c d f g h j k l m n p qu r s t v w x y z ch sh fl fr bl sl st gr th xy tr tch sch sn pl pr sph ph str ly gl gh ll nd rv gg mb ck hl ckl pp ss mp nt nd rn ng tt ss dd cc ndl zz rn)];
$rs->{B} = [qw(B C D F G H J K L M N P Qu R S T V W X Y Z Ch Sh Fl Fr Bl Sl St Gr Th Xy Tr Tch Sch Sn Pl Pr Sph Ph Str Ly Gl Gh Ll Rh Kl Cl Vl Kn)];
$rs->{' '} = [' '];

my @generated;
for my $i (1..60_000) {
    push @generated, $rs->randpattern('Ebe');
    push @generated, $rs->randpattern('Beb');
    push @generated, $rs->randpattern('Bebe');
    push @generated, $rs->randpattern('Ebeb');
    push @generated, $rs->randpattern('Ebebe');
    push @generated, $rs->randpattern('Bebeb');
    push @generated, $rs->randpattern('Ebebeb');
    push @generated, $rs->randpattern('Bebebe');
    push @generated, $rs->randpattern('Eb Beb');
    push @generated, $rs->randpattern('Be Ebe');
    push @generated, $rs->randpattern('Eb Bebe');
    push @generated, $rs->randpattern('Be Ebeb');
    push @generated, $rs->randpattern('Eb Ebeb');
    push @generated, $rs->randpattern('Be Bebe');
    push @generated, $rs->randpattern('Eb Ebeb Eb');
    push @generated, $rs->randpattern('Eb Bebe Eb');
    push @generated, $rs->randpattern('Eb Bebe Be');
    push @generated, $rs->randpattern('Eb Ebeb Be');
    push @generated, $rs->randpattern('Be Bebe Be');
    push @generated, $rs->randpattern('Be Ebeb Be');
    push @generated, $rs->randpattern('Be Bebe Eb');
    push @generated, $rs->randpattern('Be Ebeb Eb');
}

my @all = (@us, shuffle(@real), @generated);
say "Making unique from ".scalar(@all)."...";
my @unique = uniq( @all );

say "Eliminating bad from ".scalar(@unique)."...";
my @naughty = qw(Fuck Shit Ass Cunt Nigger Dick Pussy Cock Snot Puke Damn Bitch Whore Slut);
my @part = part {  foreach my $bad (@naughty) { return 1 if ($_ =~ /$bad/); } return 0; } @unique;
my @good = @{$part[0]};
my @bad = @{$part[1]};

say "Writing list of ".scalar(@good)." names...";
open my $file, ">", "../var/starnames.txt";
print {$file} join("\n", @good);
close $file;

say "Found ".scalar(@bad)." bad...";