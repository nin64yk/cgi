package Module::Security;
use strict;
use warnings;
#use View::Error;

sub sanitize {
	my $html = $_[0];
	$html =~ s/&/&#38;/g;
	$html =~ s/</&#60;/g;
	$html =~ s/>/&#62;/g;
	$html =~ s/"/&#34;/g;
	$html =~ s/'/&#39;/g;

	return $html;
}

=pod
sub validation {
	
	my ($id, $title, $top, $leng, $pr, $level, $cat) = @_;
	my @arr;
	my @arr_err;	

	if (defined($id)){

		push(@arr, $id);		

	} else {
		
		$id = undef;	
		push(@arr_err, $id);

	}


	# only numbers and characters
	if (defined($title) && $title =~ /^(?:[0-9a-zA-Z]+)$/){
		
		push(@arr, $title);
	
	} else {

		$title = undef;
		push(@arr_err, $title);
	}



	if (defined($top)){
	
		push(@arr, $top);

	} else {
		
		$top = undef;		
		push(@arr_err, $top);
	}


	# Number
	if (defined($leng) && $leng =~ /^(?:0|[1-9]\d*)$/ && $leng >= 1 && $pr <= 99){
	
		push(@arr, $leng);

	} else {

		$leng = undef;
		push(@arr_err, $leng);
	}
	

  	# Number
	if (defined($pr) && $pr =~ /^(?:0|[1-9]\d*)$/ && $pr >= 0 && $pr <= 999999){

		push(@arr, $pr);

	} else {	
	
		$pr = undef;	
		push(@arr_err, $pr);

	}

	# Number
	if (defined($level) && $level =~ /^[1-5]$/){ 

		push(@arr, $level);

	} else {

		$level = undef;
		push(@arr_err, $level);

	}

	if (defined($cat) && (length($cat))<40 && $cat =~ /^(?:[0-9a-zA-Z]+)$/) {

		push(@arr, $cat);
            
	} else {	

		$cat = undef;
		push(@arr_err, $cat);
	}
	
	
	if (!defined($id) || !defined($title) || !defined($top) || !defined($leng) || !defined($pr) || !defined($level) || !defined($cat)) {
	
		print "<a href=\"http://localhost/cgi-bin/index.fcgi?create_form\">Browser back or click</a>";
		
#		View::Error::error(@arr_err);	

	} else {

		return @arr;

	}
}
=cut
1;
