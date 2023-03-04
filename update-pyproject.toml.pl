#!/usr/bin/env -S perl -0777pi
BEGIN {
    my @names = glob shift;
    foreach my $name (@names) {
        $name =~ m=.*/(.+?)\.txt=;
        my $temp = <<EOF;
[tool.setuptools.dynamic.optional-dependencies.$1]
file = "requirements/$1.txt"
EOF
        push @temps, $temp;
    }
}
$dependencies = join "\n", @temps;
s|(?<=# begin: scripts/update-pyproject\.toml\.pl\n).*?(?=# end: scripts/update-pyproject\.toml\.pl)|$dependencies|s;
