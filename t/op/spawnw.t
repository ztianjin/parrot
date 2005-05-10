# Copyright: 2004-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/spawnw.t - Run OS commands and tell about the exit code

=head1 SYNOPSIS

	% perl -Ilib t/op/spawnw.t

=head1 DESCRIPTION

Tests spawning external commands.

spawnw does not capture STDOUT and STDERR from the spawned command.
So only the exit code can be tested.

The returned value is actually returned from the 'waitpid' system call.
In order to get the exit code from the spawned process, it needs to be right
shifted by 8 bit. 

=head1 TODO

Test negative return codes.

=head1 SEE ALSO

The special variable $? in Perl5.

=head1 AUTHOR

Nigel Sandever - L<nigelsandever@btconnect.com>

=cut

use Parrot::Test tests => 6;

# perl command coded this way to avoid platform 
# quoting issue.

# test string version of spawnw

pasm_output_is(<<'CODE', <<'OUTPUT', "exit code: 0");
        set     S1, 'perl -e "exit(0)"'
        set     I1, 99
        spawnw  I1, S1
	shr	I2, I1, 8
        print   "return code: "
        print   I2
        print   "\n"
        end
CODE
return code: 0
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "exit code: 123");
        set     S1, 'perl -e "exit(123)"'
        set     I1, 99
        spawnw  I1, S1
	shr	I2, I1, 8
        print   "return code: "
        print   I2
        print   "\n"
        end
CODE
return code: 123
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "exit code: 3");
        set     S1, 'perl -e "exit(3)"'
        set     I1, 99
        spawnw  I1, S1
	shr	I2, I1, 8
        print   "return code: "
        print   I2
        print   "\n"
        end
CODE
return code: 3
OUTPUT

# test array version of spawnw

output_is(<<'CODE', <<'OUTPUT', "exit code: 0");
        new     P0, .Array
        set     P0, 3
        set     P0[0], "perl"
        set     P0[1], "-e"
        set     P0[2], "exit(0)"
        set     I1, 99
        spawnw  I1, P0
	shr	I2, I1, 8
        print   "return code: "
        print   I2
        print   "\n"
        end
CODE
return code: 0
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "exit code: 123");
        new     P0, .Array
        set     P0, 3
        set     P0[0], "perl"
        set     P0[1], "-e"
        set     P0[2], "exit(123)"
        set     I1, 99
        spawnw  I1, P0
	shr	I2, I1, 8
        print   "return code: "
        print   I2
        print   "\n"
        end
CODE
return code: 123
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "exit code: 3");
        new     P0, .Array
        set     P0, 3
        set     P0[0], "perl"
        set     P0[1], "-e"
        set     P0[2], "exit(3)"
        set     I1, 99
        spawnw  I1, P0
	shr	I2, I1, 8
        print   "return code: "
        print   I2
        print   "\n"
        end
CODE
return code: 3
OUTPUT
