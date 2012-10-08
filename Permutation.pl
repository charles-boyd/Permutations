#-*-perl-*-
#!/usr/bin/perl

use warnings;
use strict;

sub cycle_to_trans {
    
    my @cycle = @_;
    my @prod = ();
    
    # length of the cycle
    my $n = $#cycle;
    
    # (a_{1},a_{2},..,a_{n}) ==
    # [(a_{1},a_{n}),(a_{1},a_{n-1}),..,(a_{1},a_{3}),(a_{1},a_{2})]
    for my $i ( 0 .. $n-1 ) {
        my @trans = ($cycle[0],$cycle[$n-$i]);
        push @prod, [ @trans ];
    }
    # return the list of transpositions for this cycle
    return @prod;
}

sub perm_to_trans {
    
    my @perm = @_;
    my @prod = ();
    
    # for each cycle in trans, turn it to a transposition
    for my $aref ( @perm ) {
        my @trans = cycle_to_trans(@$aref);
        push @prod, @trans;
    }
    # return the list of transpositons for this permutation
    return @prod;
}

sub swap {

    my ( @trans, @set ) = @_;

    my @res = ();
    
    my $a = $trans[0];
    my $b = $trans[1];
    
    # for each letter in @set
    for my $i ( 0 .. $#set ) {
        # if this letter is $a, swap it to $b
        if ( $set[$i] == $a ) {
            push @res, $b;
        }
        # if this letter is $b, swap it to $a
        elsif ( $set[$i] == $b ) {
            push @res, $a;
        }
        # otherwise, this element is fixed
        else {
            push @res, $set[$i];
        }
    }
    # return the permuted set
    return @res;
}

sub permute {
    
    my ( $n, @perm ) = @_;
    
    my @set = (1 .. $n);
    
    my @prod = perm_to_trans(@perm);
    
    for my $aref ( @prod ) {
	my @trans = @$aref;
	@set = swap(@trans, @set);
    }

    return @set;
}

sub checker {

    my $n = shift;
    my ( @student, @answer ) = @_;
    
    my @student_result = permute($n, @student);
    my @correct_result = permute($n, @answer);
    
    for my $i ( 0 .. $n-1 ) {
	if ( $student_result[$i] != $correct_result[$i] ) {
	    return 0;
	}
    }

    return 1;
}

1;

#EOF
