#!/usr/bin/perl
use strict;
use warnings;
use CGI::Fast;
use Module::Model;
use Module::Create;
use Module::Delete;
use Module::Update;
use Module::Security;

use View::Top;

while(my $q = CGI::Fast->new) {


	my $param = $q->param('f');

	# input from HTML
	my $keyword  = Module::Security::sanitize($q->param('keyword'));
	my $category = Module::Security::sanitize($q->param('category'));
	# Create
	my $c_id  = Module::Security::sanitize($q->param('course_id'));
	my $c_title  = Module::Security::sanitize($q->param('course_title'));
	my $topic = Module::Security::sanitize($q->param('topic'));
	my $d_length = Module::Security::sanitize($q->param('day_length'));
	my $price = Module::Security::sanitize($q->param('price'));
	my $l_id  = Module::Security::sanitize($q->param('level_id'));
	my $cate  = Module::Security::sanitize($q->param('category')); 
	# Delete
	my $del_arr = Module::Security::sanitize($q->param('del_arr'));	


	if ($param eq 'all'){
	
		Module::Model::read_dbi($param);

	}elsif ($param eq 'key'){

		Module::Model::read_dbi($param, $keyword);

	}elsif ($param eq 'cate'){
	
		Module::Model::read_dbi($param, $category);

	}elsif ($param eq 'create_form'){

		Module::Model::read_dbi($param);

	}elsif ($param eq 'delete'){
		
		Module::Model::read_dbi($param, $c_id);

	}elsif ($param eq 'delete_form'){                
	
		Module::Delete::check_delete_form($param, $del_arr);

	}elsif ($param eq 'create'){
			
		my @form_create = ($c_id, $c_title, $topic, $d_length, $price, $l_id, $cate);
		my $create_list = join ",", @form_create;  
		
		Module::Model::read_dbi($param, $create_list);	

	}elsif ($param eq 'update'){
		
		my @form_update = ($c_id, $c_title, $topic, $d_length, $price, $l_id, $cate);
		my $update_list = join ",", @form_update;  
		
		Module::Model::read_dbi($param, $update_list);	

	}elsif ($param eq 'single'){
	
		Module::Model::read_dbi($param, $c_id);	

	}elsif ($param eq 'top'){
		
		View::Top::show_top();
	
	}else {

		View::Top::show_top();
		
	}

}



1;
