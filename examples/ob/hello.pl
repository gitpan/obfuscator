#!/usr/bin/perl
#
# (c) bla-bla-bla
#
########################################################################
my @enr;{local($_,$^W);$_=tell DATA;seek DATA,$?,$^W=scalar @enr;read DATA,my $uk7,"$^F$=";seek DATA,$?,$_;$0=~ m#([^/]+)$#;my($ah5,$a5f,@a0s,@x29)=($0,$1);if(length($uk7)<length($a5f)){@x29=split //,$a5f;@a0s=split //,$uk7;}else{@a0s=split //,$a5f;@x29=split //,$uk7;}@enr=map{scalar(@a0s)?(ord($_)=>ord(shift(@a0s))):ord($_)}@x29;}sub kix{local$_;rd613l:{if($#_>$#enr){@enr=(@enr,@enr);redo rd613l;}}my $mwn="";for(my $ynj=0;$ynj<=$#_;$ynj++){$mwn.=chr($_[$ynj]/ ord($enr[$ynj]));}$mwn;}print kix(3672,4949,5508,5292,5772,1568,5831,5439,5586,5292,4900,1664,1716,1617,1881)."\n";
__DATA__
