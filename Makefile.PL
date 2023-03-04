#!/usr/bin/env perl
use Env qw(GITHUB_REF_NAME);
use ExtUtils::MakeMaker;

if ( defined $GITHUB_REF_NAME ) {
    $version = $GITHUB_REF_NAME;
}
else {
    $version = `git describe --abbrev=0`;
    chomp $version;
}

my @exe_files = <*.pl>;
WriteMakefile(
    NAME      => 'Pre::Commit::Hooks',
    LICENSE   => 'gpl_3',
    AUTHOR    => 'Wu Zhenyu <wuzhenyu@ustc.edu>',
    EXE_FILES => exe_files,
);
