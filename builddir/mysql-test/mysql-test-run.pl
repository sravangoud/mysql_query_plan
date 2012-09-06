#!/usr/bin/perl
# Call mtr in out-of-source build
$ENV{MTR_BINDIR} = "/build/buildd/mysql-5.5-5.5.24/builddir";
chdir("/build/buildd/mysql-5.5-5.5.24/mysql-test");
exit(system($^X, "/build/buildd/mysql-5.5-5.5.24/mysql-test/mysql-test-run.pl", @ARGV) >> 8);
