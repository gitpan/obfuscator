#!/usr/bin/perl
########################################################################
#
# $Id: obfuscator.pl,v 1.14 2007/04/23 18:43:40 gosha Exp $
#
# Copyright (c) 2006 - 2007 Okunev Igor <igor@prv.mts-nn.ru>
#
#	��������� ���������� ����. ����������:
#
#		- ���������� ��� ��������� ������ ������������ �� `#`
#			�.�.: print "hello world"; # ����������
#			�� ���������
#
#		- �������� ����� � ������ ������� � �� ��������
#			( �������� �� � ��� ��� ��������...)
#
#		- ���������� ������ ���������� ����������� � my, our
#			� use vars qw(...);
#
#		- ���������� ����� �������� ( /^\s*subs+\w\s*{/ )
#
#		- ��������� �������� `'` � `"` ������ ����
#		  �������� �� �� ����������������� ����������
#		  s#['"]#`# => s#[\x22\x27]#`#
#
#		- ��������� ������ ���������� ���������� � `�����������`
#			������ ��������� � ��������� ��������
#
########################################################################
use strict;
use Getopt::Long;

########################################################################
							main();
########################################################################

#=pod
#
#	sub new - ������������� ������.
#
#=cut
sub new {
	my $self = bless {
			#
			# ���������, �������� �� ��������� ������
			# ( ��, ��� ���� ���� �� ��������� )
			#
			conf => {
				file		=> [ '=s',	undef,	'File for obfuscate' ],
				help		=> [ '!',	0,		'This help' ],
				var_ob		=> [ '!',	1,		'Obfuscate variable name' ],
				sub_ob		=> [ '!',	1,		'Obfuscate subroutines name' ],
				use_fn		=> [ '!',	1,		'Use file name for `enc` method' ],
				use_hdr		=> [ '!',	1,		'Use header for `enc` method' ],
				full_hdr	=> [ '!',	1,		'Use full header for `enc` method' ],
				style_ob	=> [ '!',	1,		'Obfuscate script format' ],
				enc			=> [ '!',	1,		'Encode data' ],
				tt			=> [ '=i',	7,		'Trial time ( days ). With `enc\' opt only' ],
				vskip		=> [ '=s@',  [ '$VERSION' ],		'Skip this variables'  ],
				sskip		=> [ '=s@',  [ 'new' ],		'Skip this subroutines'  ]
			},

			#
			# ���� ���������...
			#
			header			=> '',

			#
			# ���� �������������� �������
			#
			body 			=> '',

			#
			# ������ �������
			#
			data			=> '',

			#
			# ����� �������� �������� �������� ��������� ������
			#
			crypt_arr		=> [],
		};

	return $self;
}

#=pod
#
#	sub conf - ������/��������� ���������������� ����������
#
#=cut
sub conf {
	my $self = shift;

	if ( $#_ >= 1 ) {
		#
		# ���� ����� ���������� 2 �� ������������� �������� ����������,
		# � ���������� ������������� ��������
		#
		if ( defined $_[0] and exists $self->{'conf'}->{ lc $_[0] } ) {
			if ( defined $_[1] ) {
				$self->{'conf'}->{ lc $_[0] }->[1] = $_[1];
			} else {
				undef $self->{'conf'}->{ lc $_[0] }->[1];
			}
			return $self->{'conf'}->{ lc $_[0] }->[1];
		} else {
			return undef;
		}
	} elsif( defined $_[0] ) {
		#
		# ������ ���������� �������� ������������� ����������
		#
		if ( defined $_[0] and exists $self->{'conf'}->{ lc $_[0] } ) {
			return $self->{'conf'}->{ lc $_[0] }->[1];
		} else {
			return undef;
		}
	} else {
		#
		# ���� ������� ��� ���������� �� ���������� ��� ������ � ������� ����
		# ����������, ��� �����....
		#
		if ( wantarray ) {
			return keys %{ $self->{'conf'} }
		} else {
			return undef;
		}
	}
}

#=pod
#
#	sub init_opt - ������������� ���������� ��������� ������ � ��� conf
#
#=cut
sub init_opt {
	my $self = shift;
	my ( %t_h, $key );

	local $_;

	GetOptions( \%t_h, map { $_ . $self->{'conf'}->{$_}->[0] } keys %{ $self->{'conf'} } );

	foreach $key ( keys %t_h ) {
		if ( ref $t_h{$key} eq 'ARRAY' ) {
			$self->conf( $key => [ @{$t_h{$key}} ] );
		} elsif ( ref $t_h{$key} eq 'HASH' ) {
			$self->conf( $key => { %{$t_h{$key}} } );
		} elsif ( ! ref $t_h{$key} ) {
			$self->conf( $key => $t_h{$key} );
		}
	}

	return 1;
}

#=pod
#
#	sub help - ����� ������� � ���������� ��������� ������...
#
#=cut
sub help {
	my $self = shift;

	warn "\n\n".'Command line arguments:'."\n\n";

	my $max_len = length( ( sort { length($b) <=> length($a) } keys %{ $self->{'conf'} } )[0] );

	foreach my $param ( sort keys %{ $self->{'conf'} } ) {
		warn sprintf "  %-$max_len" . "s - %s [ %s ]\n",
										ucfirst $param,
										($self->{'conf'}->{$param}->[2] || '???'),
										( ref $self->{'conf'}->{$param}->[1] eq 'ARRAY' ?
											join( ',', @{$self->{'conf'}->{$param}->[1]} ) : $self->{'conf'}->{$param}->[1] );
	}

	return 1;
}

#=pod
#
# sub obfuscate - �������� ����� ���������� � ��������...
#
#=cut
sub obfuscate {
	my $self = shift;

	#
	# ����� �������� �� �������� �������� ���������� � ��������� ( � ����� ��� � ����� )
	#
	my @chars  = ( 'a' .. 'z' );

	#
	# ������� ����� �������� ������
	#
	my $data = $self->{ 'body' };

	#
	# ����������� ����� ����������
	#
	if ( $self->conf( 'var_ob' ) ) {
		#
		# ��������� ���������� ���������� ( my $as = 1 )
		#
		my @single_var = $data  =~ /(?:^|\W)(?:my|our)\s*([\$\@\%][\w_][\w0-9_]*)/g;

		#
		# ��������� ���������� ����������� �� ��� ( my ($as1, $bes2) = (1,2) )
		#
		my @multi_var  = map { s#\s+$##; split /\s*,\s*/, $_ } $data =~ /(?:^|\W)(?:my|our)\s*\(\s*([\$\@\%][^)]*)/g;

		#
		# use vars qw( $as $bes %les );
		#
		my @use_vars  = grep { defined $_ } map { split /\s+/, $_ } $data =~ /(?:^|\W)use\s+vars\s+qw\s*\(\s*([\$\@\%][^)]*)/g;

		#
		# ��� ���������� ( ���� - ������������ �������� )
		#
		my %all_keys = map { $_ => 1 } ( @single_var, @multi_var, @use_vars );

		#
		# �� �������� ���������� �� vskip
		#
		foreach my $skip_var ( @{ $self->conf('vskip') } ) {
			delete $all_keys{ $skip_var };
		}

		#
		# ��� ���������� ( ���� - ����� �������� )
		#
		my %all_keys_reverse;

		#
		# ��������� ����� ����� �������� ����� ����������
		#
		my $len = int ( scalar(keys %all_keys) / scalar( @chars ) );

		#
		# �� �� ������ 3 �������� ( ������ ������ ����������� ����� )
		#
		$len = 2 if $len < 2;

		#
		# ������� ���������� ����������� ��� my
		#
		foreach my $key ( reverse sort keys %all_keys ) {
			#
			# ��������� ��� ����������
			#
			$key =~ s#^([\@\$\%])##;

			my $type = $1;

			#
			# ����� ��� ����������
			#
			my $conv;

			#
			# ���� ����� ���������� ��� ���� ( �� ����� ������ ���� ) �� ����� ������ ��������
			#
			if ( exists $all_keys{ $key } ) {
				$conv = $all_keys{ $key };
			} else {
				uniqvar:{
					$conv = join '',	( sort { rand(time) <=> rand(time) } @chars )[0],
										( sort { rand(time) <=> rand(time) } ( @chars, 0 .. 9 ) )[1..$len];
					redo if exists $all_keys_reverse{ $conv } or exists $all_keys{ $conv };
					$all_keys_reverse{ $conv } = $key;
					$all_keys{ $key } = $conv;
				}
			}

			#
			# ���� ���������� ������ ��� ��� �� ������������� ������
			# ���������� ������� ����
			#
			if ( $type eq '%' or $type eq '@' ) {
				$data =~ s#\Q$type\E$key(\W)#$type$conv$1#g; $data =~ s#\Q$type\E$key(\W)#$type$conv$1#g;
			}

			#
			# ��� �������� ��� ������������ ����������� ���� $#array
			#
			if ( $type eq '@' ) {
				$data =~ s#\$\#$key(\W)#\$\#$conv$1#g; $data =~ s#\$\#$key(\W)#\$\#$conv$1#g;
			}

			#
			# ��� ���� ��� ������������ ����������� ���� @hash{ @slice }
			#
			if ( $type eq '%' ) {
				$data =~ s#\@$key(\s*{)#\@$conv$1#g; $data =~ s#\@$key(\s*{)#\@$conv$1#g;
			}

			#
			# �� � ������ ��� `�������' ( my $as; $as[1]... )
			#
			$data =~ s#\$$key(\W)#\$$conv$1#g; $data =~ s#\$$key(\W)#\$$conv$1#g;

			#
			# ������ ���������� � �������� %{hash}, @{arr}, ${scalar}
			#
			$data =~ s#\Q$type\E\{\s*$key\s*\}#$type\{$conv\}#g;
		}
	}

	#
	# ���������� ���� ��������
	#
	if ( $self->conf( 'sub_ob' ) ) {
		#
		# ������� ����� ��������...
		#
		my %subs;

		{
			my @subs = $data =~ /(?:^|\n\s*)sub\s+(\w+)\s*{/g;
			%subs = map { $_ => 1 } @subs;
		}

		#
		# �� �������� ���������� �� sskip
		#
		foreach my $skip_sub ( @{ $self->conf('sskip') } ) {
			delete $subs{ $skip_sub };
		}

		#
		# ��������� ����� ����� �������� ����� ��������
		#
		my $len = int ( scalar(keys %subs) / scalar( @chars ) );

		#
		# �� �� ������ 3 �������� ( ������ ������ ����������� ����� )
		#
		$len = 2 if $len < 2;

		#
		# ��� �������� ������� ����� ���������� ��������...
		#
		my %all_keys;
		my %all_keys_reverse;

		foreach my $key ( sort keys %subs ) {
			#
			# ����� ��� ���������
			#
			my $conv;

			#
			# ���� ����� ���������� ��� ���� ( �� ����� ������ ���� ) �� ����� ������ ��������
			#
			if ( exists $all_keys{ $key } ) {
				$conv = $all_keys{ $key };
			} else {
				uniqsub:{
					$conv = join '',	( sort { rand(time) <=> rand(time) } @chars )[0],
										( sort { rand(time) <=> rand(time) } ( @chars, 0 .. 9 ) )[1..$len];
					redo if exists $all_keys_reverse{ $conv } or exists $all_keys{ $conv };
					$all_keys_reverse{ $conv } = $key;
					$all_keys{ $key } = $conv;
				}
			}
			$data =~ s#\b$key(\s*\()#$conv$1#g;
			$data =~ s#(^|\n\s*)(sub\s+)$key(\s*{)#$1$2$conv$3#g;
		}
	}

	#
	# ������� �������
	#
	if ( $self->conf( 'style_ob' ) ) {
		#
		# ������� �������� ���������� � ��������� ������ ��� ���...
		# '
		my $cvote 			= 0;
		# "
		my $double_cvote	= 0;

		#
		# ��������� �� �������� ���� �������
		#
		my $out_str = '';

		#
		# �������� ���� ������ �� �������...
		#
		my @chars = split( //, $data );

		while ( defined( my $c = shift(@chars) ) ) {
			if ( $c eq "'" and $double_cvote == 0 and $cvote == 0 ) {
				#
				# ������ ������ � ��������� ��������...
				#
				$cvote = 1;
			} elsif ( $c eq "'" and $cvote == 1 ) {
				#
				# ������������� ��������� �������
				#
				$cvote = 0;
			} elsif ( $c eq '"' and $cvote == 0 and $double_cvote == 0 ) {
				#
				# ������������� ������� �������
				#
				$double_cvote = 1;
			} elsif ( $c eq '"' and $double_cvote == 1 ) {
				#
				# ������������� ������� �������
				#
				$double_cvote = 0;
			}

			if ( $c eq '\\' and $cvote == 1 ) {
				#
				# �������������� ������
				#
				$out_str .= '\\';
				$c = shift @chars;
			}

			if ( $cvote == 1 or $double_cvote == 1 or $c !~ /\s/ ) {
				$out_str .= $c;
			} else {
				#
				# ������� `������' �������
				#
				my $pre_c = substr( $out_str, -1, 1);

				if ( 	$pre_c !~ /[;:.,><)(\[\]=+|\s\{\}-]/ and
						$chars[0] !~ /[;:.,><)(\[\]=+|\s\{\}-]/ ) {
					$out_str .= ' ';
				}
			}
		}
		$data = $out_str;
	}

	$self->{ 'body' } = $data;
}

#=pod
#
# sub simple_crypt - �������� ��������� ��������� � ������ ����� ������...
#
#=cut
sub simple_crypt {
	my $self = shift;

	#
	# ��� �������� trial time
	#
	my $tt_string = '';

	#
	# ����������� �������� �� ������ ����������� ��������
	# ��������� ������� ���������� -� �����...
	#
	if ( $self->conf( 'tt' ) ) {
		$tt_string = '$]x(int((-M$full_file_name)/'. $self->conf( 'tt' ) . ')) . ';
	}

	#
	# ������������� ��� ����� `����������' ���������+���_����� ��� ������ ���������
	#
	my $init_crypt_arr_code;

	unless ( $self->conf( 'use_fn' ) ) {
		$init_crypt_arr_code = '@crypt_arr = map {ord($_)} split //, $crypt_str;';
	} elsif ( ! $self->conf( 'use_hdr' ) ) {
		$init_crypt_arr_code = '$0 =~ m#([^/]+)$#; @crypt_arr = map {ord($_)} split //, $1;';
	} else {
		$init_crypt_arr_code= '$0 =~ m#([^/]+)$#;
		my ($full_file_name,$file_name,@fa,@na) = ($0,$1);
		if(length($crypt_str)<length($file_name) ) {
			@na = split //, ' . $tt_string. '$file_name;
			@fa = split //, $crypt_str;
		} else {
			@fa = split //, $file_name;
			@na = split //, ' . $tt_string . '$crypt_str;
		}
		@crypt_arr = map {scalar(@fa)?(ord($_)=>ord(shift(@fa))):ord($_)} @na;'
	}

	#
	# ������������� ���������� ���� ��������� ��� ���...
	#
	my $hdr_strip = '';

	if ( ! $self->conf('full_hdr') and $self->conf('use_hdr') ) {
		$hdr_strip = '$crypt_str =~ s#.*?:.*?(\d+\.\d+)#$1#s;';
	}

	#
	# ����� �������� ������...
	#
	my $out_str = 'my @crypt_arr;
	{
		local($_,$^W);
		$_ = tell DATA;
		seek DATA,$?,$^W=scalar @crypt_arr;
		read DATA, my $crypt_str, "$^F$=";
		seek DATA, $?, $_;
		'. "$hdr_strip\n\t" . $init_crypt_arr_code .'
	}
	sub xg613_x {
		local$_;
		rd613l:{
			if($#_>$#crypt_arr){
				@crypt_arr = ( @crypt_arr, @crypt_arr );
				redo rd613l;
			}
		}
		my $out_str = "";
		for( my $i=0; $i<=$#_; $i++ ) {
			$out_str .= chr($_[$i] / ord($crypt_arr[$i]));
		}
		$out_str;
	}';

	#
	# ������� �������� ���������� � ��������� ������ ��� ���...
	# '
	my $cvote 			= 0;
	# "
	my $double_cvote	= 0;

	#
	# �������� ���� ������ �� �������...
	#
	my @chars = split( //, $self->{ 'body' } );

	#
	# �������������� ������...
	#
	my $string;

	while ( defined( my $c = shift(@chars) ) ) {
		if ( $c eq "'" and $double_cvote == 0 and $cvote == 0 ) {
			#
			# ������ ������ � ��������� ��������...
			#
			if ( $chars[0] eq "'" ) {
				#
				# ������ ������...
				#
				$out_str .= "''";
				$c = shift(@chars);
			} else {
				#
				# ������ �����������...
				#
				$cvote = 1;
				$out_str .= 'main::xg613_x(';
			}
		} elsif ( $c eq "'" and $cvote == 1 ) {
			#
			# ������������� ��������� �������
			#
			$cvote = 0;
			$out_str .= join(',', $self->encode($string)) . ')';
			$string = '';
		} elsif ( $c eq '"' and $cvote == 0 and $double_cvote == 0 ) {
			#
			# ������������� ������� �������
			#
			$double_cvote = 1;
			$out_str .= $c;
		} elsif ( $c eq '"' and $double_cvote == 1 ) {
			#
			# ������������� ������� �������
			#
			$double_cvote = 0;
			$out_str .= $c;
		} elsif ( $c eq '\\' and $cvote == 1 ) {
			#
			# �������������� ��������� ������� � ������ 'te\'st'
			#
			$c = shift @chars;
			if ( $c eq "'" ) {
				$string .= $c ;
			} else {
				$string .= '\\' . $c ;
			}
		} elsif ( $c eq '\\' and $double_cvote == 1 ) {
			#
			# ������� ������ � ������ ������� �������...
			#
			$out_str .= $c . shift(@chars);
		} elsif ( $cvote == 1 ) {
			#
			# ������ ��� �����������
			#
			$string	.= $c;
		} else {
			#
			# `�������' ������
			#
			$out_str .= $c;
		}
	}

	$self->{ 'body' } = $out_str;
}

#=sub
#
# sub encode - ���������� ���� `�����������'...
#
#=cut
sub encode {
	my $self = shift;
	#
	# ������ `��������������' ��������
	#
	my @out_data;

	#
	# ������ �������� ��������
	#
	my @char_arr = split(//,$_[0]);

	#
	# ������ �������� �������� ��������
	#
	my @crypt_arr = @{ $self->{'crypt_arr'} };

 	loop1:{
		if ( $#char_arr > $#crypt_arr ) {
			@crypt_arr = ( @crypt_arr, @crypt_arr );
			redo loop1;
		}
	}

	for ( my $i=0; $i<=$#char_arr; $i++ ) {
		push @out_data , ord($char_arr[$i]) * ord($crypt_arr[$i]);
	}

	return @out_data;
}

#=pod
#
# sub main - ���������� �� ���� ��� �������
#
#=cut
sub main {
	my $self = new();

	#
	# ������������������� ��������� ��������� ������
	#
	$self->init_opt();

	#
	# ��� ��������� �����
	#
	my $in_file = $self->conf('file');

	#
	# ...�� ������� �� ��� � ������...
	#
	if ( $self->conf('help') or ! length $in_file ) {
		$self->help();
		exit;
	}

	#
	# �����, ������ ��� ��� ���������.
	#
	my $header_bool = 1;

	#
	# ����� ���� ��� ��� POD ������������
	#
	my $pod_bool = 0;

	open(IN_FILE, "<$in_file" ) || die 'Can\'t open file: '. "$in_file [$!]\n";

	#
	# ��������� ��������� � ������ �������
	# �� ����� ������ ������ �� �����������
	# � ������ �����
	#
	while ( <IN_FILE> ) {
		if ( $header_bool and /^#/ ) {
			$self->{'header'} .= $_;
		} else {
			$header_bool = 0;
		}

		if ( /^=pod/ ) {
			#
			# ������ ��� ������������
			#
			$pod_bool = 1;
			next;
		} elsif ( /^=cut/ ) {
			#
			# ��������� ��� ������������
			#
			$pod_bool = 0;
			next;
		}

		#
		# ������� POD ������������
		#
		next if $pod_bool;

		if ( /^__DATA__/ or /^__END__/) {
			$self->{'data'} .= $_;
			next;
		}

		if ( length $self->{'data'} ) {
			#
			# ������ ������ �������
			#
			$self->{'data'} .= $_;
		} else {
			#
			# ������ ���������� � ������ ������
			#
			next if /^\s*#/;
			next if /^\s*$/;
			$self->{'body'} .= $_;
		}
	}

	close IN_FILE;

	#
	# ��������� �������� � �������� ���������� �����...
	#
	my $crypt_str = substr( $self->{'header'} ,0, "$^F$=");

	#
	# ������������� � ������ ���������
	#
	if ( ! $self->conf('full_hdr') and $self->conf('use_hdr') ) {
		$crypt_str =~ s#.*?:.*?(\d+\.\d+)#$1#s;
	}

	#
	# ������������� ����� � ����� �����...
	#
	$in_file =~ s#.*?([^/]+)$#$1#;

	#
	# ����������������� ����� �������� ��� �����������...
	#
	unless ( $self->conf('use_fn') ) {
		$self->{'crypt_arr'} = [ map {ord($_)} split //,$crypt_str ];
	} elsif ( ! $self->conf('use_hdr') ) {
		$self->{'crypt_arr'} = [ map {ord($_)} split //,$in_file ];
	} else {
		my (@fa,@na);
		if(length($crypt_str)<length($in_file) ) {
			@na = split //, $in_file;
			@fa = split //, $crypt_str;
		} else {
			@fa = split //, $in_file;
			@na = split //, $crypt_str;
		}
		$self->{'crypt_arr'} = [ map {scalar(@fa)?(ord($_)=>ord(shift(@fa))):ord($_)} @na ];
	}

	#
	# ���������� ��������� ������
	#
	if ( $self->conf('enc') ) {
		$self->simple_crypt();
	}

	#
	# ����������� ������
	#
	if (	$self->conf( 'var_ob' )
			or $self->conf( 'sub_ob' )
			or $self->conf( 'style_ob' ) ) {
		$self->obfuscate();
	}

	#
	# ���������� ������������ ���������
	#
	print $self->{ 'header' };

	#
	# ���������� ���������� ���� �������
	#
	print $self->{ 'body' };

	#
	# ���� � ������� ������������� ��� __DATA__ ��� __END__ �� ����� ������������
	# �������� ����� ��������� __DATA__
	#
	if ( length $self->{'data'} ) {
		print ";package main;\n",$self->{ 'data' };
	} elsif ( $self->conf( 'enc' ) ) {
		print ";package main;\n__DATA__\n";
	}
}

=pod

=head1 NAME

obfuscator.pl - simple perl code obfuscator.

=head1 SYNOPSIS

see `obfuscator.pl --help` for more info.

=head1 NOTES

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

=head1 AUTHOR

 Igor V. Okunev  mailto:igor@prv.mts-nn.ru
                 http://www.mts-nn.ru/~gosha
                 icq:106183300

=head1 COPYRIGHT

Copyright (c) 2006 - 2007 Igor Okunev <igor@prv.mts-nn.ru>. All rights reserved.

=cut

