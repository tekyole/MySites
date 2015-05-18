#!/cadtools/programs/perl 

#todo:
# add comment on how the code works


# Clear the screen in terminal:
system ('clear');

#The template for the website is located in template_file.htm
$template_file = 'template_file.htm';
 
# Looking for files with htm extension
# -f: only consider files, not folders
my @htm_files = grep ( -f ,<*.htm>);

# Editting them
	foreach $file (@htm_files) {
		
  		$file_name = $file;
		$Old_template_remove_flag = 0;

		if ($file_name ne $template_file ){
			print "Opening $file to add template to it... \n";

			print "Deleting the old template from $file_name... \n";
			open (file_handler1, " < $file_name") or die "cannot open < input file: $!";
			@ContentsOfTheFile = <file_handler1>; 
			close (file_handler1);

			open(file_handler1, " > $file_name")  or die "cannot open < input file: $!";
			foreach $line (@ContentsOfTheFile) {
				$temp_line = $line;
				chomp($line);
				if ($line eq '<StartOfHtmTemplate>') {
					$Old_template_remove_flag = 1;
					
				};
				if ( $Old_template_remove_flag == 0 ) { 
					print file_handler1 "$temp_line";
				};
			};
			close(file_handler1);


			open ($template_file_handler, " < $template_file") or die "cannot open < input file: $!"; # Means open $file in read mode	
			print "Reading the template files....\n";
			while (<$template_file_handler>) {
				$line = $_;
								
				open (file_handler1, " >> $file_name") or die "cannot open < input file: $!"; 
					  	
				chomp($line);
		
				if ($line ne '<EndOfTemplate>'){
					print file_handler1 "$_";
				}

				close(file_handler1);

			} #while
			close($template_file_handler);
		
				  
		} #if ($file_name ne $template_file_htm )	
		  
	}




