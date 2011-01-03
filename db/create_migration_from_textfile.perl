#!/usr/bin/perl
    use warnings;

    my $file = 'vocab_eng_with_freq.txt';
    my $output_file = 'migration_from_jeff_vocab.rb';
    # Using a tab separated file
    open (OUTPUTFILE, '>>'.$output_file);

    open (FILE, $file);
   
	while (<FILE>) {
		
		 ($wordeng, $frequency) = split("\t");
		 my $ruby_var = 'Vocentry.create(:eng_word => "'.$wordeng.', :frequency => '.chomp($frequency).')';
		 print OUTPUTFILE "$ruby_var \n";
	 }
	 close (FILE);
	 close (OUTPUTFILE);
	 exit;

