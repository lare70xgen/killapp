#!/usr/bin/perl -w
$app=$ARGV[0]||die "Give App name\n";
chomp $app;
&lookapp();

sub killpid()
{
	foreach $tmp (@pids){
		chomp $tmp;
		#print "1:$tmp\n";
		if($tmp){
			`kill -9 $tmp`;
			print "-killed $tmp\n";
		}
	}
}
sub lookapp()
{
	print "Looking Pids\n";
	@pids=`ps -ef|grep $app|grep -v grep|grep -v perl|awk \'\{print \$2\}\'`;
	if(@pids){
		&killpid();
		}
	else {
		print "-No application pid found\n"; 
		exit;
		}
	}
