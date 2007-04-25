########################################################################
#
# $Id: Makefile.PL,v 1.1 2007/04/25 06:01:59 gosha Exp $
#
# Copyright (c) 2004 Okunev Igor <gosha@prv.mts-nn.ru>
#
########################################################################

use ExtUtils::MakeMaker;

&WriteMakefile(
		NAME			=> 'obfuscator',
		EXE_FILES		=> [ 'obfuscator.pl' ],
		DISTNAME		=> 'obfuscator',
		VERSION			=> '1.14',
		dist			=> {
								COMPRESS	=> 'gzip',
								SUFFIX		=> 'gz'
							},
);
