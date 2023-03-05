use strict;
use warnings;

sub print_tower {
    my ($name, $discs) = @_;
    my @tower = map { (' ') x ($discs-$_) . ('#' x (2*$_-1)) } reverse(1..$discs);
    print "$name: $_\n" for @tower;
    print "\n";
}

sub move_disc {
    my ($from, $to, $towers) = @_;
    my $from_top = $towers->{$from}->[-1];
    my $to_top = $towers->{$to}->[-1];
    if (!defined($from_top)) {
        print "Invalid move: no discs on tower $from\n";
        return 0;
    } elsif (defined($to_top) && $from_top >= $to_top) {
        print "Invalid move: cannot place larger disc on smaller one\n";
        return 0;
    } else {
        push @{$towers->{$to}}, pop @{$towers->{$from}};
        return 1;
    }
}

sub play_game {
    my ($discs) = @_;
    my $towers = {
        A => [reverse(1..$discs)],
        B => [],
        C => [],
    };
    print_tower("A", $discs);
    while (1) {
        print_tower("B", $discs);
        print_tower("C", $discs);
        print "Enter move (e.g. A->B): ";
        chomp(my $move = <STDIN>);
        my ($from, $to) = split /->/, uc($move);
        if (move_disc($from, $to, $towers)) {
            if (@{$towers->{C}} == $discs) {
                print "Congratulations! You won the game!\n";
                return;
            }
        }
    }
}

print "Welcome to Tower of Hanoi!\n";
print "How many discs would you like to play with? ";
chomp(my $discs = <STDIN>);
play_game($discs);
