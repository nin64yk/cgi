package Module::Delete;
use strict;
use warnings;
use DBI;

=pod
sub check_delete {
	my($arg) = @_;
	
	my @arr = split(/,/, $arg);

        print "Content-Type:text/html\n\n";
        print "<h3>Deleted course</h3>";
        print <<EOF;
                <form action="http://localhost/cgi-bin/index.fcgi">              
                    <input name='f' value='delete' type='hidden'>
                    <table border>
                       
                        <tr>
                                <td style='background: red;'>course_id</td>
                                <td><a name='course_id'>$arr[0]</a></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>course_title</td>          
                                <td><a name='course_title'>$arr[1]</a></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>topic</td>
                                <td><a name="topic">$arr[2]</a></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>day_length</td>
                                <td><a name='day_length'>$arr[3]</a></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>price</td>
                                <td><a name='price'>$arr[4]</a></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>level_id</td>
                                <td><a name='level_id'>$arr[5]</a></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>category</td>
                                <td><a name='category'>$arr[6]"></td>
                        </tr>                                                                              
                   </table>
		 <br>Are you sure?	
                   <input type='submit' value="delete">
                </form>
EOF

}
=cut

sub check_delete_form {
	my($tp, $arg_cdf) = @_;
	my @arr_cdf =  split (/,/, $arg_cdf);        

	print "Content-Type:text/html\n\n";
        print "<h3>Deleted course</h3>";
        print <<EOF;
                <form action="/var/www/cgi-bin/index.fcgi?course_id=$arr_cdf[0]">              
                    <input name='f' value='delete' type='hidden'>
		    <input name='course_id' value="$arr_cdf[0]" type='hidden'>	
			<table border>
                       
                        <tr>
                                <td style='background: red;'>course_id</td>
                                <td><a name="course_id" type="text">$arr_cdf[0]</a></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>course_title</td>          
                                <td><a name='course_title'>$arr_cdf[1]</a></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>topic</td>
                                <td><a name="topic">$arr_cdf[2]</a></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>day_length</td>
                                <td><a name='day_length'>$arr_cdf[3]</a></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>price</td>
                                <td><a name='price'>$arr_cdf[4]</a></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>level_id</td>
                                <td><a name='level_id'>$arr_cdf[5]</a></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>category</td>
                                <td><a name='category'>$arr_cdf[6]</td>
                        </tr>                                                                              
                   </table>
		 <br>	
                   <input type='submit' value="delete">
                </form>
EOF

}

sub result_delete {
	my($value_rd) = @_;
	
	print "Content-Type:text/html\n\n";
	print "<h3>$value_rd deleted.</h3>";
	print "<a href=\"/var/www/cgi-bin/index.fcgi?f=top\">Go Top</a>";
}

1;
