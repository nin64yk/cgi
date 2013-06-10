package Module::View;
use strict;
use warnings;


sub draw_head {
# HTML HEAD                                                      
	print "Content-Type:text/html\n\n";
	print "<html>";
	print "<head>";
	print "<meta charset='utf-8'>";
	print "<title>DB bank</title>";
	print "</head>";
# End of HTML HEAD


# HTML BODY
	print "<body>";
	print "<div>";
	print "<a href=\"/cgi-bin/index.fcgi?f=top\">Top</a>|<a href=\"/cgi-bin/index.fcgi?f=create_form\">create course</a>|<a href=\"/cgi-bin/index.fcgi?f=all\">all course</a>";
	print "</div>";
	print "<hr>";
}



sub draw_footer {
# HTML Footer
	print "<hr>";

	print "<div id=footer divstyle=\"text-alight:right;\">";
	print "<p>Juhyun Kim, DB Bank</p>";
	print "</div>";

	print "<div id=footer>";
	print "<p>Time:...sec</p>";
	print "</div>";

	print "</body>";
# End of HTML BODY

	print "</html>";
# End of HTML

}



# draw_table
sub draw_table {

	my($tp, $arg) = @_;

	my $numRows = $arg->rows();
	my @col = @{$arg->{NAME}};

	&draw_head();
	
	if ($tp eq 'all' or $tp eq 'key' or $tp eq 'cate') {

		print "<p>search result</p>";
		print "<p>$numRows found.</p>";

	}

	if ($numRows > 1) {

		print "<table border>";

		print "<thead>";
		print "<tr>";

		for(my $j=0; $j<@col; $j++){
			print "<th>$col[$j]</th>";
		}

		print "</tr>";
		print "</thead>";

		print "<tbody>";
		while (my @row = $arg->fetchrow_array()) {

			print "<tr>";
			for(my $i = 0; $i < @row; $i++){
				if($tp eq 'all' && $i == 0){

					print "<td><a href='/cgi-bin/index.fcgi?f=single&course_id=$row[$i]'>$row[$i]<a></td>";

				} else {

					print"<td>$row[$i]</td>";

				}
			}

			print "</tr>";
		}
		print "</tbody>";

		print "</table>";


	} elsif ($numRows == 1) {

		&draw_single_table($tp, $arg);

	} else {

		print "<h3>Not found<h3>";


	}
	
	&draw_footer();

}



sub draw_single_table {

        my($tp_s, $arg_s) = @_;
        my @row_single = $arg_s->fetchrow_array();

        &course_update($tp_s, @row_single);

}




sub course_create {

		&draw_head();

                print <<EOF;
                <form action="/cgi-bin/index.fcgi">              
                    <input name='f' value='create' type='hidden'>
                    <table border>
                       
                        <tr>
                                <td style='background: red;'>course_id</td>
                                <td><input type='text' name='course_id'></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>course_title</td>          
                                <td><input type='text' name='course_title'></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>topic</td>
                                <td><textarea type='text' name="topic" rows="3"></textarea></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>day_length</td>
                                <td><input type='text' name='day_length'></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>price</td>
                                <td><input type='text' name='price'></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>level_id</td>
                                <td><input type='text' name='level_id'></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>category</td>
                                <td><input type='text' name='category'></td>
                        </tr>
                   </table>
                   <input type='submit'>
                </form>
EOF

		&draw_footer();

}
# End of course_create




sub check_delete_form {
        my($tp, $arg_cdf) = @_;
        my @arr_cdf =  split (/,/, $arg_cdf);

        &draw_head();
	
	print "<h3>Deleted course</h3>";
        print <<EOF;
                <form action="./index.fcgi?course_id=$arr_cdf[0]">              
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

		&draw_footer();

}



sub result_delete {
        my($value_rd) = @_;
	
	&draw_head();

        print "<h3>$value_rd deleted.</h3>";
        print "<a href=\"/cgi-bin/index.fcgi?f=top\">Go Top</a>";

	&draw_footer();
}



sub course_update {

                my($tp, @arr) = @_;
                my $delete_arr_list = join(",", @arr);

		&draw_head();


                if ($tp eq 'update'){

                        print "<h3>Course updated</h3>";

                }elsif($tp eq 'create'){

                        print "<h3>Course created</h3>";

                }elsif($tp eq 'single'){

                        print "<h3>Single table</h3>";

                }

                print "<a href=\"/cgi-bin/index.fcgi?f=delete_form&del_arr=$delete_arr_list\">Do you want to delete this course?</a>";
                print <<EOF;
                <form action="/cgi-bin/index.fcgi">              
                    <input name='f' value='update' type='hidden'>
                    <table border>
                       
                        <tr>
                                <td style='background: red;'>course_id</td>
                                <td><input name='course_id' type='hidden' value='$arr[0]'>
                                        $arr[0]</td>
                        </tr>
                        <tr>
                                <td style='background: red;'>course_title</td>          
                                <td><input name='course_title' type='text' value="$arr[1]"></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>topic</td>
                                <td><input name="topic" type='text' value="$arr[2]"></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>day_length</td>
                                <td><input name='day_length' type='text' value="$arr[3]"></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>price</td>
                                <td><input name='price' type='text' value="$arr[4]"></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>level_id</td>
                                <td><input name='level_id' type='text' value="$arr[5]"></td>
                        </tr>
                        <tr>
                                <td style='background: red;'>category</td>
                                <td><input name='category' type='text' value="$arr[6]"></td>
                        </tr>
                   </table>
                   <input type='submit'>
                </form>
EOF

		&draw_footer();

}






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




sub show_top {
	
	&draw_head();
	print << "EOF";
		<div>
		<h3>Training DB Webapp</h3>     
		<img src="var/www/html/image/book-img-2.png" alt=text></img> 
		<h4>Search</h4>
		<a href="/index.fcgi?f=all">all course</a>
		</div>      
		<br>    
		<div>       
		<form action="/index.fcgi"> keyword:
		<input name="f" value="key" type="hidden">
		<input type="text" name="keyword">
		<input type="submit">
		</form>

		<form action="/index.fcgi"> category: 
		<input name="f" value="cate" type="hidden">
		<input type="text" name="category">
		<input type="submit">
		</form>
		</div>  

		<hr>

		<div id=footer style="text-align:right;">
		<p>Juhyun kim, DB Bank</p>
		</div>
		<div id=footer>
		<p>Time:...sec</p>
		</div>     
		</body>
		</html>
EOF

	&draw_footer();

}

1;

