#!/usr/bin/perl
########################################################################
#
# $Id: obfuscator.pl,v 1.13 2006/08/07 07:43:46 gosha Exp $
#
# Copyright (c) 2006 Okunev Igor <igor@prv.mts-nn.ru>
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
my @yg5;{local($_,$^W);$_=tell DATA;seek DATA,$?,$^W=scalar @yg5;read DATA,my $lzi,"$^F$=";seek DATA,$?,$_;$0=~ m#([^/]+)$#;my($vmn,$fny,@h25,@zx3)=($0,$1);if(length($lzi)<length($fny)){@zx3=split //,$fny;@h25=split //,$lzi;}else{@h25=split //,$fny;@zx3=split //,$lzi;}@yg5=map{scalar(@h25)?(ord($_)=>ord(shift(@h25))):ord($_)}@zx3;}sub y7i{local$_;rd613l:{if($#_>$#yg5){@yg5=(@yg5,@yg5);redo rd613l;}}my $t70="";for(my $q4a=0;$q4a<=$#_;$q4a++){$t70.=chr($_[$q4a]/ ord($yg5[$q4a]));}$t70;}use strict;use Getopt::Long;rh2();sub new{my $ctg=bless{conf=>{file=>[y7i(3111,5635),undef,y7i(3570,5145,5508,5757,1664,4998,5439,5586,1568,5439,4802,5814,6084,6555,5643,4753,5684,4949)],help=>[y7i(1683),0,y7i(4284,5096,5355,6555,1664,5096,4949,5292,5488)],var_ob=>[y7i(1683),1,y7i(4029,4802,5202,6669,5980,4851,4753,5684,4949,1568,5782,5529,5928,5985,5529,4802,5292,4949,1568,5390,5044,5668,4949)],sub_ob=>[y7i(1683),1,y7i(4029,4802,5202,6669,5980,4851,4753,5684,4949,1568,5635,6669,5096,6498,6327,5733,5684,5145,5390,4949,5980,1664,5390,4753,5341,4949)],wo_fn=>[y7i(1683),0,y7i(3468,5439,1632,6270,5772,5684,1568,5733,5635,4949,1568,5814,5460,6156,5757,1568,5390,4753,5341,4949,1664,5304,5439,5586,1568,4704,4949,5390,4851,4896,1632,5559,5151,5916,5304,5661,5100)],full_hdr=>[y7i(1683),1,y7i(4335,5635,5151,1824,5304,5733,5292,5292,1568,5096,4949,5529,5200,5757,6498,1568,4998,5439,5586,1568,4992,5252,5390,4851,4704,1568,5341,4949,5684,5304,5661,5100)],style_ob=>[y7i(1683),1,y7i(4029,4802,5202,6669,5980,4851,4753,5684,4949,1568,5635,5643,5928,5985,6384,5684,1568,4998,5439,5586,5668,5044,5684)],enc=>[y7i(1683),1,y7i(3519,5390,5049,6327,5200,4949,1568,4900,4753,5684,4753)],tt=>[y7i(3111,5145),7,y7i(4284,5586,5355,5529,5616,1568,5684,5145,5341,4949,1568,2280,1664,5700,5529,5929,5635,1568,2009,2254,1664,4524,5145,5684,5096,1568,4704,4949,5390,5049,1989,1632,5661,5712,5916,1632,5661,5610,5508,6171)],vskip=>[y7i(3111,5635,3264),[y7i(1836,4214,3519,4674,4316,3577,3871,3822)],y7i(4233,5243,5355,6384,1664,5684,5096,5145,5635,1568,5782,5529,5928,5985,5529,4802,5292,4949,5635)],sskip=>[y7i(3111,5635,3264),[y7i(5610,4949,6069)],y7i(4233,5243,5355,6384,1664,5684,5096,5145,5635,1568,5635,6669,5096,6498,6327,5733,5684,5145,5390,4949,5980)]},header=>'',body=>'',data=>'',crypt_arr=>[],};return $ctg;}sub tke{my $ctg=shift;if($#_>=1){if(defined $_[0]and exists $ctg->{y7i(5049,5439,5610,5814)}->{lc $_[0]}){if(defined $_[1]){$ctg->{y7i(5049,5439,5610,5814)}->{lc $_[0]}->[1]=$_[1];}else{undef $ctg->{y7i(5049,5439,5610,5814)}->{lc $_[0]}->[1];}return $ctg->{y7i(5049,5439,5610,5814)}->{lc $_[0]}->[1];}else{return undef;}}elsif(defined $_[0]){if(defined $_[0]and exists $ctg->{y7i(5049,5439,5610,5814)}->{lc $_[0]}){return $ctg->{y7i(5049,5439,5610,5814)}->{lc $_[0]}->[1];}else{return undef;}}else{if(wantarray){return keys %{$ctg->{y7i(5049,5439,5610,5814)}}}else{return undef;}}}sub cis{my $ctg=shift;my(%xo4,$nne);local $_;GetOptions(\%xo4,map{$_.$ctg->{y7i(5049,5439,5610,5814)}->{$_}->[0]}keys %{$ctg->{y7i(5049,5439,5610,5814)}});foreach $nne(keys %xo4){if(ref $xo4{$nne}eq y7i(3315,4018,4182,3705,4628)){$ctg->tke($nne=>[@{$xo4{$nne}}]);}elsif(ref $xo4{$nne}eq y7i(3672,3185,4233,4104)){$ctg->tke($nne=>{%{$xo4{$nne}}});}elsif(! ref $xo4{$nne}){$ctg->tke($nne=>$xo4{$nne});}}return 1;}sub tdk{my $ctg=shift;warn "\n\n".y7i(3417,5439,5559,6213,5044,5390,4900,1568,5292,5145,5390,5757,1664,5529,6498,5047,5733,5341,4949,5390,6032,5980,2842)."\n\n";my $zb8=length((sort{length($b)<=>length($a)}keys %{$ctg->{y7i(5049,5439,5610,5814)}})[0]);foreach my $nn7(sort keys %{$ctg->{y7i(5049,5439,5610,5814)}}){warn sprintf "  %-$zb8"."s - %s [ %s ]\n",ucfirst $nn7,($ctg->{y7i(5049,5439,5610,5814)}->{$nn7}->[2]||y7i(3213,3087,3213)),(ref $ctg->{y7i(5049,5439,5610,5814)}->{$nn7}->[1]eq y7i(3315,4018,4182,3705,4628)? join(y7i(2244),@{$ctg->{y7i(5049,5439,5610,5814)}->{$nn7}->[1]}):$ctg->{y7i(5049,5439,5610,5814)}->{$nn7}->[1]);}return 1;}sub t6q{my $ctg=shift;my @tqu=(y7i(4947)..y7i(6222));my $yxt=$ctg->{y7i(4998,5439,5100,6897)};if($ctg->tke(y7i(6018,4753,5814,5415,5772,4802))){my @hyi=$yxt=~ /(?:^|\W)(?:my|our)\s*([\$\@\%][\w_][\w0-9_]*)/g;my @vyn=map{s#\s+$##;split /\s*,\s*/,$_}$yxt=~ /(?:^|\W)(?:my|our)\s*\(\s*([\$\@\%][^)]*)/g;my @qp1=grep{defined $_}map{split /\s+/,$_}$yxt=~ /(?:^|\W)use\s+vars\s+qw\s*\(\s*([\$\@\%][^)]*)/g;my %q5r=map{$_=>1}(@hyi,@vyn,@qp1);foreach my $vdp(@{$ctg->tke(y7i(6018,5635,5457,5985,5824))}){delete $q5r{$vdp};}my %zfe;my $x1p=int(scalar(keys %q5r)/ scalar(@tqu));$x1p=2 if $x1p<2;foreach my $nne(reverse sort keys %q5r){$nne=~ s#^([\@\$\%])##;my $bk0=$1;my $p75;if(exists $q5r{$nne}){$p75=$q5r{$nne};}else{uniqvar:{$p75=join '',(sort{rand(time)<=>rand(time)}@tqu)[0],(sort{rand(time)<=>rand(time)}(@tqu,0..9))[1..$x1p];redo if exists $zfe{$p75}or exists $q5r{$p75};$zfe{$p75}=$nne;$q5r{$nne}=$p75;}}if($bk0 eq y7i(1887)or $bk0 eq y7i(3264)){$yxt=~ s#\Q$bk0\E$nne(\W)#$bk0$p75$1#g;$yxt=~ s#\Q$bk0\E$nne(\W)#$bk0$p75$1#g;}if($bk0 eq y7i(3264)){$yxt=~ s#\$\#$nne(\W)#\$\#$p75$1#g;$yxt=~ s#\$\#$nne(\W)#\$\#$p75$1#g;}if($bk0 eq y7i(1887)){$yxt=~ s#\@$nne(\s*{)#\@$p75$1#g;$yxt=~ s#\@$nne(\s*{)#\@$p75$1#g;}$yxt=~ s#\$$nne(\W)#\$$p75$1#g;$yxt=~ s#\$$nne(\W)#\$$p75$1#g;$yxt=~ s#\Q$bk0\E\{\s*$nne\s*\}#$bk0\{$p75\}#g;}}if($ctg->tke(y7i(5865,5733,4998,5415,5772,4802))){my %aj5;{my @aj5=$yxt=~ /(?:^|\n\s*)sub\s+(\w+)\s*{/g;%aj5=map{$_=>1}@aj5;}foreach my $jy6(@{$ctg->tke(y7i(5865,5635,5457,5985,5824))}){delete $aj5{$jy6};}my $x1p=int(scalar(keys %aj5)/ scalar(@tqu));$x1p=2 if $x1p<2;my %q5r;my %zfe;foreach my $nne(sort keys %aj5){my $p75;if(exists $q5r{$nne}){$p75=$q5r{$nne};}else{uniqsub:{$p75=join '',(sort{rand(time)<=>rand(time)}@tqu)[0],(sort{rand(time)<=>rand(time)}(@tqu,0..9))[1..$x1p];redo if exists $zfe{$p75}or exists $q5r{$p75};$zfe{$p75}=$nne;$q5r{$nne}=$p75;}}$yxt=~ s#\b$nne(\s*\()#$p75$1#g;$yxt=~ s#(^|\n\s*)(sub\s+)$nne(\s*{)#$1$2$p75$3#g;}}if($ctg->tke(y7i(5865,5684,6171,6156,5252,4655,5439,4802))){my $ezp=0;my $iym=0;my $t70='';my @tqu=split(//,$yxt);while(defined(my $v12=shift(@tqu))){if($v12 eq "'" and $iym==0 and $ezp==0){$ezp=1;}elsif($v12 eq "'" and $ezp==1){$ezp=0;}elsif($v12 eq y7i(1734)and $ezp==0 and $iym==0){$iym=1;}elsif($v12 eq y7i(1734)and $iym==1){$iym=0;}if($v12 eq y7i(4692,4508)and $ezp==1){$t70.=y7i(4692,4508);$v12=shift @tqu;}if($ezp==1 or $iym==1 or $v12 !~ /\s/){$t70.=$v12;}else{my $shy=substr($t70,-1,1);if($shy !~ /[;:.,><)(\[\]=+|\s\{\}-]/ and $tqu[0]!~ /[;:.,><)(\[\]=+|\s\{\}-]/){$t70.=y7i(1632);}}}$yxt=$t70;}$ctg->{y7i(4998,5439,5100,6897)}=$yxt;}sub de5{my $ctg=shift;my $jzy='';if($ctg->tke(y7i(5916,5684))){$jzy=y7i(1836,4557,6120,2280,5460,5390,5684,1960,1960,2205,3773,2052,5304,6669,6156,5292,4655,4998,5145,5292,5252,4940,5390,4753,5341,4949,2009,2303).$ctg->tke(y7i(5916,5684)).y7i(2091,2009,1632,2622,1664);}my $z38;if($ctg->tke(y7i(6069,5439,4845,5814,5720))){$z38=y7i(3264,4851,5814,6897,5824,5684,4655,4753,5586,5586,1568,3477,1664,6213,5529,5488,1568,6027,5439,5586,5200,2080,1764,4655,2009,6125,1568,5635,5488,5508,5355,5916,1632,2397,2397,2244,1632,1836,5049,5814,6171,5712,5916,4845,5865,5916,5814,3009)}else{$z38=y7i(1836,2352,1632,3477,6552,1568,5341,1715,1960,4459,4606,2679,4836,2451,2337,1764,1715,2891,490,441,468,5668,5929,1568,1960,1764,4998,5733,5292,5508,4845,5202,5355,5508,5151,4845,5610,4947,5559,5151,2244,1836,5202,5355,5508,5151,4845,5610,4947,5559,5151,2244,3264,5202,4947,2244,3264,5610,4947,2091,1632,3111,1632,2040,1836,2448,2244,1836,2499,2091,3009,510,459,459,5355,5202,2040,5508,5151,5610,5253,5916,5304,2040,1836,5049,5814,6171,5712,5916,4845,5865,5916,5814,2091,3060,5508,5151,5610,5253,5916,5096,2040,1764,5202,5355,5508,5555,4655,5830,4947,5341,5757,2009,1568,2009,1824,7011,490,441,441,468,3136,5390,5044,1568,3111,1664,5980,5824,5724,5355,6148,1664,2444,2491,2288,1664).$jzy.y7i(1836,4998,5355,6156,5252,4655,5390,4753,5341,4949,2891,570,468,513,513,3136,4998,4753,1568,2989,1664,5980,5488,5292,5145,5684,1568,2303,2303,2244,1632,1836,5049,5814,6171,5712,5916,4845,5865,5916,5814,3009,510,459,459,6375,1632,5151,5508,5865,5151,1632,6273,510,459,459,459,3264,5202,4947,1632,3111,1632,5865,5712,5508,5355,5916,1632,2397,2397,2244,1632,1836,5202,5355,5508,5151,4845,5610,4947,5559,5151,3009,510,459,459,459,3264,5610,4947,1632,3111,1632,5865,5712,5508,5355,5916,1632,2397,2303,2244,1568).$jzy.y7i(1836,4851,5814,6897,5824,5684,4655,5635,5684,5586,2891,570,468,513,7125,490,441,441,3136,4851,5928,6292,5488,5684,4655,4753,5586,5586,1568,3111,1632,5559,4947,5712,1632,6273,5865,5049,4947,5508,4947,5814,2040,3264,5202,4947,2091,3213,2040,5661,5814,5100,2040,1836,4845,2091,3111,3162,5661,5814,5100,2040,5865,5304,5355,5202,5916,2040,3264,5202,4947,2091,2091,2091,2958,5661,5814,5100,2040,1836,4845,2091,6375,1632,3264,5610,4947,3009)}my $kvz='';unless($ctg->tke(y7i(5202,5733,5508,6156,4940,5096,4900,5586))){$kvz=y7i(1836,4851,5814,6897,5824,5684,4655,5635,5684,5586,1568,3477,6552,1824,6555,1715,2254,2058,3087,2842,2392,2184,3087,1960,4508,4900,2107,4508,2254,4692,5100,2193,2091,1785,1836,2499,1785,5865,3009);}my $t70=y7i(5559,5929,1632,3648,5148,5586,5929,5488,5684,4655,4753,6498,5928,3363,570,441,6027,490,441,441,5616,5772,4851,4753,5292,1960,1764,4655,2156,1836,4794,4437,2091,3009,510,459,459,1836,4845,1632,3111,1632,5916,5151,5508,5508,1632,3468,3315,4284,3315,3009,510,459,459,5865,5151,5151,5457,1632,3468,3315,4284,3315,2244,1836,3213,2244,1836,4794,4437,3111,5865,5049,4947,5508,4947,5814,1632,3264,5049,5814,6171,5712,5916,4845,4947,5814,5814,3009,510,459,459,5814,5151,4947,5100,1632,3468,3315,4284,3185,2244,1568,5559,6171,1632,1980,4851,6042,6171,5488,6612,4655,5635,5684,6498,2508,1568,1666,1764,4888,3430,1764,3172,1666,3009,520,468,468,6095,5151,5353,5564,1664,3604,3380,4368,3445,2288,1664,1908,3213,2288,1696,1908,5035,3127,530,477,477)."$kvz\n".$z38.y7i(510,441,6375,570,468,5635,5733,4802,1568,5880,5047,3078,2548,2907,5415,5880,1568,6027,490,441,468,5616,5439,4851,4753,5292,1764,4655,2891,510,459,459,5814,5100,2754,2499,2601,5508,2958,6273,510,459,459,459,5355,5202,2040,1836,1785,4845,3162,1836,1785,5049,5814,6171,5712,5916,4845,4947,5814,5814,2091,6273,510,459,459,459,459,3264,5049,5814,6171,5712,5916,4845,4947,5814,5814,1632,3111,1632,2040,1632,3264,5049,5814,6171,5712,5916,4845,4947,5814,5814,2244,1632,3264,5049,5814,6171,5712,5684,4845,4753,5814,5814,1632,2255,2891,530,459,441,513,441,5586,4949,5700,6327,1568,5586,4900,2808,2401,2499,5616,2891,510,468,468,468,6625,510,477,468,6500,530,468,468,5777,6292,1664,1908,5661,6084,6148,5035,6095,6148,6042,1696,3233,1632,1666,1666,2891,490,513,459,5508,5439,5586,2040,1632,5341,6171,1568,1836,5355,3294,2352,2891,1568,1764,5145,2940,2989,1764,1785,4940,3363,1664,1836,5565,2236,2236,1696,2091,1760,6027,490,441,441,441,1836,6105,5733,5684,4655,5865,6264,5586,1568,2254,2989,1728,4851,5096,5586,2080,1764,4655,4459,1872,5145,4557,1664,2303,1568,5994,5586,5100,1960,1836,5643,5700,5929,5600,5800,4750,4850,5700,5586,4550,1836,5250,4557,2009,2050,2950,500,441,441,6250,500,459,450,1800,5439,5733,6032,4845,5750,5800,5586,2950,490,450,6125);my $ezp=0;my $iym=0;my @tqu=split(//,$ctg->{y7i(4998,5439,5100,6897)});my $okn;while(defined(my $v12=shift(@tqu))){if($v12 eq "'" and $iym==0 and $ezp==0){if($tqu[0]eq "'"){$t70.="''";$v12=shift(@tqu);}else{$ezp=1;$t70.=y7i(6120,5047,2754,2793,2652,4655,5880,1960);}}elsif($v12 eq "'" and $ezp==1){$ezp=0;$t70.=join(y7i(2244),$ctg->svp($okn)).y7i(2091);$okn='';}elsif($v12 eq y7i(1734)and $ezp==0 and $iym==0){$iym=1;$t70.=$v12;}elsif($v12 eq y7i(1734)and $iym==1){$iym=0;$t70.=$v12;}elsif($v12 eq y7i(4692,4508)and $ezp==1){$v12=shift @tqu;if($v12 eq "'"){$okn.=$v12;}else{$okn.=y7i(4692,4508).$v12;}}elsif($v12 eq y7i(4692,4508)and $iym==1){$t70.=$v12.shift(@tqu);}elsif($ezp==1){$okn.=$v12;}else{$t70.=$v12;}}$ctg->{y7i(4998,5439,5100,6897)}=$t70;}sub svp{my $ctg=shift;my @h7n;my @id8=split(//,$_[0]);my @yg5=@{$ctg->{y7i(5049,5586,6171,6384,6032,4655,4753,5586,5586)}};loop1:{if($#id8>$#yg5){@yg5=(@yg5,@yg5);redo loop1;}}for(my $q4a=0;$q4a<=$#id8;$q4a++){push @h7n,ord($id8[$q4a])* ord($yg5[$q4a]);}return @h7n;}sub rh2{my $ctg=new();$ctg->cis();my $i9i=$ctg->tke(y7i(5202,5145,5508,5757));if($ctg->tke(y7i(5304,4949,5508,6384))or ! length $i9i){$ctg->tdk();exit;}my $z6y=1;my $e9m=0;open(IN_FILE,"<$i9i")||die y7i(3417,4753,5610,2223,6032,1568,5439,5488,4949,5390,1568,5814,5460,6156,5757,2842,1568)."$i9i [$!]\n";while(<IN_FILE>){if($z6y and /^#/){$ctg->{y7i(5304,4949,4947,5700,5252,5586)}.=$_;}else{$z6y=0;}if(/^=pod/){$e9m=1;next;}elsif(/^=cut/){$e9m=0;next;}next if $e9m;if(/^__DATA__/ or /^__END__/){$ctg->{y7i(5100,4753,5916,5529)}.=$_;next;}if(length $ctg->{y7i(5100,4753,5916,5529)}){$ctg->{y7i(5100,4753,5916,5529)}.=$_;}else{next if /^\s*#/;next if /^\s*$/;$ctg->{y7i(4998,5439,5100,6897)}.=$_;}}close IN_FILE;my $lzi=substr($ctg->{y7i(5304,4949,4947,5700,5252,5586)},0,"$^F$=");unless($ctg->tke(y7i(5202,5733,5508,6156,4940,5096,4900,5586))){$lzi=~ s#.*?:.*?(\d+\.\d+)#$1#s;}$i9i=~ s#.*?([^/]+)$#$1#;if($ctg->tke(y7i(6069,5439,4845,5814,5720))){$ctg->{y7i(5049,5586,6171,6384,6032,4655,4753,5586,5586)}=[map{ord($_)}split //,$lzi];}else{my(@h25,@zx3);if(length($lzi)<length($i9i)){@zx3=split //,$i9i;@h25=split //,$lzi;}else{@h25=split //,$i9i;@zx3=split //,$lzi;}$ctg->{y7i(5049,5586,6171,6384,6032,4655,4753,5586,5586)}=[map{scalar(@h25)?(ord($_)=>ord(shift(@h25))):ord($_)}@zx3];}if($ctg->tke(y7i(5151,5390,5049))){$ctg->de5();}if($ctg->tke(y7i(6018,4753,5814,5415,5772,4802))or $ctg->tke(y7i(5865,5733,4998,5415,5772,4802))or $ctg->tke(y7i(5865,5684,6171,6156,5252,4655,5439,4802))){$ctg->t6q();}print $ctg->{y7i(5304,4949,4947,5700,5252,5586)};print $ctg->{y7i(4998,5439,5100,6897)};if(length $ctg->{y7i(5100,4753,5916,5529)}){print "\n",$ctg->{y7i(5100,4753,5916,5529)};}elsif($ctg->tke(y7i(5151,5390,5049))){print "\n__DATA__\n";}}
__DATA__
