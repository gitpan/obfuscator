NAME
    obfuscator.pl - simple perl code obfuscator.

SYNOPSIS
    see `obfuscator.pl --help` for more info.

NOTES
     - Write all comments in new line
            e.g.: print 'Hello world !!!'; # any comments
                    not work.
            Like:
            # any comments
            print 'Hello world !!!'

     - Use copyright header into your script.

     - Single ' and " must change to hex code ( s#['"]#`# => s#[\x22\x27]#`# ).

     - Strings for obfuscate must by write into ' quote.

     - Changing variables declared in `my`, `our` and `use vars qw(..)`

     - Changing subroutines names ( /^\s*subs+\w\s*{/ )

    I do not warrant this script for work with your code...

AUTHOR
     Igor V. Okunev  mailto:igor@prv.mts-nn.ru
                     http://www.mts-nn.ru/~gosha
                     icq:106183300

HOME
    http://home.sinn.ru/~gosha/perl-scripts/obfuscator/hidden_index.html


COPYRIGHT
    Copyright (c) 2006 - 2007 Igor Okunev <igor@prv.mts-nn.ru>.
		    All rights reserved.

