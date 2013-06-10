package Module::Create;
use strict;
use warnings;


sub course_create {
              	
		print <<EOF;
                <form action="/var/www/cgi-bin/index.fcgi">              
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

}
# End of course_create


1;
