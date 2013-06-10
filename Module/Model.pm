package Module::Model;
use strict;
use warnings;
use DBI;
#use Module::Create;
#use Module::Delete;
#use Module::Update;
use Module::View;

sub read_dbi {

	my($type, $value) = @_;

	# DBI
	my $data_source = "dbi:mysql:training_db:localhost";
	my $user = "train";
	my $pass = "train";

	my $dbh = DBI->connect($data_source, $user, $pass,
                        +{
                        AutoCommit => 0,
                        PrintError => 0,
                        RaiseError => 1,
                        }
                );



	if ($type eq 'all' && !defined($value)) {
		# Course all
        	my $sth_all = $dbh->prepare("SELECT * FROM course ORDER BY course_id");
        	$sth_all->execute();
		
		Module::View::draw_table($type, $sth_all);

	
	} elsif ($type eq 'key' && defined($value)) {
		# Keyword 
        	my $sth_key = $dbh->prepare("SELECT * FROM course WHERE (course_title LIKE ? OR category LIKE ?)");
        	$sth_key->execute("%$value%", "%$value%");
 	
		Module::View::draw_table($type, $sth_key);


	} elsif ($type eq 'cate' && defined($value)) {
        	# Category
		my $sth_cate = $dbh->prepare("SELECT * FROM course WHERE category = ?");
       		$sth_cate->execute($value);

		Module::View::draw_table($type, $sth_cate);
#		my $sql_cate = 'SELECT * FROM course WHERE category = ?';
#		my $sth_cate = $dbh->prepare($sql_cate);
#	       	my $rt_cate  = $sth_cate->execute($value);
#		&draw_table($type, $rt_cate);
		
	} elsif ($type eq 'create_form' && !defined($value)) { 
		
		#Module::Create::course_create();
		Module::View::course_create();


	}elsif ($type eq 'create' && defined($value)) {
		# Create
		my @arr_create = split(/,/, $value);	


#		my $sth_overlap = $dbh->prepare("SELECT course_id FROM course WHERE course_id='$arr_create[0]'");
#		$sth_overlap->execute();

	
		# check overlap
		my $sth_create = $dbh->prepare("INSERT INTO course VALUES('$arr_create[0]','$arr_create[1]','$arr_create[2]','$arr_create[3]','$arr_create[4]','$arr_create[5]','$arr_create[6]')");
		$sth_create->execute();
		
		#Module::Update::course_update($type, @arr_create);
		Module::View::course_update($type, @arr_create);
	
	
	} elsif ($type eq 'delete' && defined($value)) {
		
		my $sth_delete = $dbh->prepare("DELETE FROM course WHERE course_id='$value'");
		$sth_delete->execute();	

		#Module::Delete::result_delete($value);
		Module::View::result_delete($value);
	
	} elsif ($type eq 'update' && defined($value)) {

		my @arr_update = split(/,/, $value);
		print STDERR "arr_update : @arr_update";

		my $sth_update = $dbh->prepare("UPDATE course SET course_title='$arr_update[1]', topic='$arr_update[2]', day_length='$arr_update[3]', price='$arr_update[4]', level_id='$arr_update[5]', category='$arr_update[6]' WHERE course_id='$arr_update[0]'");	
		$sth_update->execute();	

                #Module::Update::course_update($type, @arr_update);
		Module::View::course_update($type, @arr_update);

	} elsif ($type eq 'single' && defined($value)) {
	
		my $sth_single = $dbh->prepare("SELECT * FROM course WHERE course_id='$value'");
		$sth_single->execute();
		
		Module::View::draw_single_table($type, $sth_single);
		
	}



	$dbh->commit();
	$dbh->disconnect();
}




1;

