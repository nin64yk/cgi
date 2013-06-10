package View::Error;
use strict;
use warnings;

sub error {

	my(@arr) = shift;

	print "Content-type:test/html\n\n";

	if (!defined($arr[0])) {
		print "<p>course_id is now valid.</p>";
	} 
	
	if (!defined($arr[1])) {
		print "<p>course_title is not valid.</p>";
	} 

	if (!defined($arr[2])) {
		print "<p>topic is not valid.</p>";
	}

	if (!defined($arr[3])) {
		print "<p>day_length between 1 and 99.</p>";
	}

	if (!defined($arr[4])) {
		print "<p>price between 0 and 999999.</p>";
	} 

	if (!defined($arr[5])) {
		print "<p>level_id between 1 and 5.</p>";
	} 

	if (!defined($arr[6])) {
		print "<p>category is required and less than 40 characters.</p>";
	}
} 
