package View::Top;
use strict;
use warnings;


sub show_top {

print "Content-Type:text/html\n\n";
print << "EOF"
<html>
	<head>
		<meta charset='utf-8'>
		<title>DB Bank</title>
	</head>
	<body>
	    <div>
		<a href="cgi-bin/index.fcgi?f=top">top</a>|<a href="cgi-bin/index.fcgi?f=create_form">create course</a>|<a href="cgi-bin/index.fcgi?f=all">all course</a>
	    </div>

		<hr>	

  	    <div>
  		<h3>Training DB Webapp</h3>	
  	        <img src="image/book-img-2.png" alt=text></img>	
		<h4>Search</h4>
		<a href="cgi-bin/index.fcgi?f=all">all course</a>
	    </div>    	
		<br>	
	    <div>	
                <form action="cgi-bin/index.fcgi"> keyword:
		   <input name="f" value="key" type="hidden">
                   <input type="text" name="keyword">
		   <input type="submit">
                </form>
            
            	<form action="cgi-bin/index.fcgi"> category: 
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

}


1;
