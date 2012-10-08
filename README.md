Permutations
============

A Perl script to check if two permutations act on a set of N letters equivalently, implying that both permutations decompose into an equivalent product of transpositions (up to reordering).

Usage
=====

```perl
my $n = 4;
my @student = [ ( 1, 3), (2, 4) ];
my @answer = [ (2, 4), (1, 3) ];
   
my $result = checker($n, @student, @answer);

if ( $result ) {
   print "Right answer!!", "\n";
} else {
  print "Wrong answer", "\n";
}
```

License
=======

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.