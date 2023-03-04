#!/usr/bin/env -S perl -pi
use Env qw(GITHUB_REF_NAME);

BEGIN {
    unless ( $GITHUB_REF_NAME eq '' ) {
        $version = $GITHUB_REF_NAME;
    }
    else {
        $version = `git describe --abbrev=0`;
        chomp $version;
    }
}
if ( not defined $name and /^name = "([^"]*+)"/ ) {
    $name = $1;
    next;
}
if ( not defined $description and /^description = "([^"]*+)"/ ) {
    $description = $1;
    next;
}
if ( not defined $url and /^Source = "([^"]*+)"/ ) {
    $url = $1;
    next;
}
if ( not defined $author
    and /^authors = \[\{ name = "([^"]*+)", email = "([^"]*+)" }]/ )
{
    $author = "$1 <$2>";
    next;
}
s/(?<="name": ")[^"]*/$name/;
s/(?<="description": ")[^"]*/$description/;
s/(?<="version": ")[^"]*/$version/;
s/(?<="author": ")[^"]*/$author/;
s/(?<="url": ")[^"]*/$url/;
