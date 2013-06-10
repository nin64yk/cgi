package Module::Update;
use strict;
use warnings;


sub course_update {

                my($tp, @arr) = @_;
                my $delete_arr_list = join(",", @arr);
                
		
		if ($tp eq 'update'){
                
			print "<h3>Course updated</h3>";
		
		}elsif($tp eq 'create'){

			print "<h3>Course created</h3>";

		}elsif($tp eq 'single'){
		
			print "<h3>Single table</h3>";
		
		}                

		print "<a href=\"/var/www/cgi-bin/index.fcgi?f=delete_form&del_arr=$delete_arr_list\">Do you want to delete this course?</a>";
                print <<EOF;
                <form action="/var/www/cgi-bin/index.fcgi">              
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

}


1;
