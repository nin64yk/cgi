package View::HTML.pm
use strict;
use warnings;

sub draw_table {

	my($tp, $arg) = @_;

	my $numRows = rows();
	my @col = @{$arg->{NAME}};

	
	if ($tp eq 'all' or $tp eq 'key' or $tp eq 'cate') {
		print "<p>Search result</p>";
		print "<p>$numRows found.</p>";
	}

	if ($numRows > 1) 

	
	

}
