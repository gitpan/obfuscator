#!/usr/bin/perl
########################################################################
#
# $Id$
#
# Copyright (c) 2002 Okunev Igor <gosha@prv.mts-nn.ru>
#
########################################################################
my @jqr;{local($_,$^W);$_=tell DATA;seek DATA,$?,$^W=scalar @jqr;read DATA,my $iiw,"$^F$=";seek DATA,$?,$_;$0=~ m#([^/]+)$#;my($nk6,$aji,@clk,@nfn)=($0,$1);if(length($iiw)<length($aji)){@nfn=split //,$aji;@clk=split //,$iiw;}else{@clk=split //,$aji;@nfn=split //,$iiw;}@jqr=map{scalar(@clk)?(ord($_)=>ord(shift(@clk))):ord($_)}@nfn;}sub ari{local$_;rd613l:{if($#_>$#jqr){@jqr=(@jqr,@jqr);redo rd613l;}}my $egp="";for(my $t8o=0;$t8o<=$#_;$t8o++){$egp.=chr($_[$t8o]/ ord($jqr[$t8o]));}$egp;}use strict;$^W=1;if(defined(my $t8o=shift)){print tx9($t8o),"\n";}else{print "�����: " if-t STDIN;while(defined($t8o=<STDIN>)){chomp $t8o;print tx9($t8o),"\n";print "�����: " if-t STDIN;}}sub tx9{my $wi5=shift;local $_;my $cco=1 if $wi5=~ s/^-+//;$wi5=~ s#^0+##;my($hn4,$nfz)=(split(m/[,.]/,$wi5,2));if(defined $hn4 and length $hn4){$hn4=~ s#[^\d]##sg;}else{$hn4=0;}if(defined $nfz and length $nfz){$nfz=~ s#[^\d]##sg;}else{$nfz=0;}if(sprintf(ari(1887,2352,2346,2650,5304),"0.$nfz")==1){$hn4++;$nfz=ari(2448,2352);}else{$nfz=substr(sprintf(ari(1887,2352,2346,2650,5304),"0.$nfz"),2);}my @lmj=split(//,($hn4||0));my $zz4=int(scalar(@lmj)/ 3);$zz4++if(scalar(@lmj)% 3);return $wi5 if $zz4>12;my $m0q={0=>[ari(10506,10143,10404,11448),'',''],1=>[[ari(10557,9604,10251,10918),ari(10557,9604,10506,10229)],ari(9996,9653,10761,11077,11024,10584),ari(10761,10388,10557)],2=>[[ari(9996,10535,9843),ari(9996,10535,10047)],ari(9996,10535,9843,10388,10140,9457,10388,10584),ari(9996,10535,10047,11183,11024,9849)],3=>[ari(10812,10290,10251),ari(10812,10290,10251,10388,10140,9457,10388,10584),ari(10812,10290,10251,11183,11024,9457)],4=>[ari(11322,9653,10812,11501,10920,9653),ari(10761,10143,10710,10971,10556),ari(11322,9653,10812,11501,10920,9653,10339,10388,9457)],5=>[ari(10608,10241,10812,11448),ari(10608,10241,10812,11448,10192,9653,10339,10241,10388),ari(10608,10241,10812,11448,10972,10143,10388)],6=>[ari(11169,9653,10761,11236,11232),ari(11169,9653,10761,11236,11232,9604,9653,10339,10241,11024),ari(11169,9653,10761,11236,11232,10339,10143,10388)],7=>[ari(10761,9653,10455,11448),ari(10761,9653,10455,11448,10192,9653,10339,10241,10388),ari(10761,9653,10455,11448,10972,10143,10388)],8=>[ari(10965,10143,10761,10441,10660,10584),ari(10965,10143,10761,10441,10660,10584,9604,9653,10339,10868,10388),ari(10965,10143,10761,10441,10660,10584,10339,10143,10388)],9=>[ari(9996,9653,10965,11077,11024,10584),ari(9996,9653,10965,11077,10712,10143,10339,10388,10143),ari(9996,9653,10965,11077,11024,10584,10339,10143,10388)],};my $lng={11=>ari(10557,9604,10251,10918,10036,9604,9555,9457,10388,11232),12=>ari(9996,10535,10047,10918,10036,9604,9555,9457,10388,11232),13=>ari(10812,10290,10251,10918,10036,9604,9555,9457,10388,11232),14=>ari(11322,9653,10812,11501,10920,10094,9457,9604,9555,10036,10388,10584),15=>ari(10608,10241,10812,10918,10036,9604,9555,9457,10388,11232),16=>ari(11169,9653,10761,11236,10712,9457,9604,9555,9457,11024,10584),17=>ari(10761,9653,10455,10918,10036,9604,9555,9457,10388,11232),18=>ari(10965,10143,10761,10441,10660,10094,9457,9604,9555,10036,10388,10584),19=>ari(9996,9653,10965,11077,11024,10094,9457,9604,9555,10036,10388,10584)};my $z97={ari(2295,2401)=>[1,ari(10353,10143,10608,10441,10504,9947,9457),ari(10353,10143,10608,10441,10244,9947),ari(10353,10143,10608,10441,10504,9947,9849)],0=>[0,ari(10710,10437,9894,10812,11232),ari(10710,10437,9894,10812,10244,9898),ari(10710,10437,9894,10812,10868)],1=>[1,ari(10812,10633,10761,11077,11544,9457),ari(10812,10633,10761,11077,11544),ari(10812,10633,10761,11077,11544,9849)],2=>[0,ari(10455,9849,10404,10812,10452,10143,10094),ari(10455,9849,10404,10812,10452,10143,10094,10143,10535),ari(10455,9849,10404,10812,10452,10143,10094,9457)],3=>[0,ari(10455,9849,10404,10812,10452,9457,10290,9604),ari(10455,9849,10404,10812,10452,9457,10290,9604,10143,11180),ari(10455,9849,10404,10812,10452,9457,10290,9604,9457)],4=>[0,ari(10812,10290,10251,10812,10608,9849,10143,10094),ari(10812,10290,10251,10812,10608,9849,10143,10094,10143,11180),ari(10812,10290,10251,10812,10608,9849,10143,10094,9457)],5=>[0,ari(10353,10535,9843,10388,10920,9849,9996,9996,9849,10764,10094),ari(10353,10535,9843,10388,10920,9849,9996,9996,9849,10764,10094,10143,11180),ari(10353,10535,9843,10388,10920,9849,9996,9996,9849,10764,10094,9457)],6=>[0,ari(10353,10535,10251,10918,11024,9849,9996,9996,9849,10036,10094),ari(10353,10535,10251,10918,11024,9849,9996,9996,9849,10036,10094,10143,11180),ari(10353,10535,10251,10918,11024,9849,9996,9996,9849,10036,10094,9457)],7=>[0,ari(10761,9653,10353,11183,11024,9849,9996,9996,9849,10764,10094),ari(10761,9653,10353,11183,11024,9849,9996,9996,9849,10764,10094,10143,11180),ari(10761,9653,10353,11183,11024,9849,9996,9996,9849,10764,10094,9457)],8=>[0,ari(10761,9653,10608,11236,10452,9996,9996,9849,10143,10712),ari(10761,9653,10608,11236,10452,9996,9996,9849,10143,10712,10143,10535),ari(10761,9653,10608,11236,10452,9996,9996,9849,10143,10712,9457)],9=>[0,ari(10557,9947,10812,10653,10608,9849,10143,10094),ari(10557,9947,10812,10812,10452,10143,10094,10143,10535),ari(10557,9947,10812,10653,10608,9849,10143,10094,9457)],10=>[0,ari(10506,10143,10506,10653,10608,9996,9849,10143,10094),ari(10506,10143,10506,10653,10608,9996,9849,10143,10094,10764,10535),ari(10506,10143,10506,10918,10452,9996,9849,10143,10094,10036)],11=>[0,ari(9996,9653,9945,10653,10608,9996,9849,10143,10094),ari(9996,9653,9945,10653,10608,9996,9849,10143,10094,10764,10535),ari(9996,9653,9945,10653,10608,9996,9849,10143,10094,10036)]};my $m23=0;unless((scalar @lmj)% 3){$m23=2;}else{$m23=((scalar @lmj)% 3)-1;}my $l6f='';my $rmj=0;my $j9j=0;if($lmj[0]==0){$l6f.=$m0q->{ari(2448)}->[0].ari(1632).$z97->{ari(2448)}->[2].ari(1632);}else{while(defined($_=shift @lmj)){if($_>0){if($_==1 and $m23==1){$rmj+=$_ * 10;if(defined($j9j=shift @lmj)and $j9j>0){$l6f.=$lng->{$_.$j9j};$rmj+=$j9j;$m23--;}else{unshift @lmj,$j9j;if(ref $m0q->{$_}->[$m23]eq ari(3315,4018,4182,3445,4628)){$l6f.=$m0q->{$_}->[$m23]->[$z97->{$zz4-1}->[0]];}else{$l6f.=$m0q->{$_}->[$m23];}}}else{$rmj+=($_ *(10 ** $m23));if(ref $m0q->{$_}->[$m23]eq ari(3315,4018,4182,3445,4628)){$l6f.=$m0q->{$_}->[$m23]->[$z97->{$zz4-1}->[0]];}else{$l6f.=$m0q->{$_}->[$m23];}}$l6f.=ari(1632);}if(--$m23==-1){$m23=2;$zz4--;if($rmj>0){$l6f.=y7w($rmj,(@{$z97->{$zz4}})[1..3]).ari(1632);}elsif($zz4==0){$l6f.=$z97->{$zz4}->[2].ari(1632);}$rmj=0;}}}$l6f.=$nfz.ari(1632).y7w($nfz,(@{$z97->{ari(2295,2401)}})[1..3]);if(defined $cco){$l6f=ari(10455,9849,10506,11289,10972,1568).$l6f;}$nfz=substr($l6f,0,1);if($nfz=~ tr/�����ţ��������������������������/��������������������������������/){substr($l6f,0,1,$nfz);}return $l6f;}sub y7w{my $v9y=$_[0]% 10;my $f5z=int(($_[0]% 100)/ 10);return $_[2]if(($f5z==1)or($v9y=~ /[05-9]/));return $_[1]if($v9y==1);return $_[3];}
__DATA__