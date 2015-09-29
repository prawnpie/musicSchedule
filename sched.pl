#!/usr/bin/perl

my $hourHeight = 60;
my $stageWidth = 150;

my $stageHeight = 20;

$line = <STDIN>;
chop( $line );
my @stages = split(/\t/,$line);
my $i = 0;
foreach( @stages ){
	my $left = $i * $stageWidth;
	my $width = $stageWidth - 15;
	print "<div class=\"stage\" style=\"left:${left}px; height:${stageHeight}px; width:${width}px \">$_</div>\n";
	$i++;
}

while(<STDIN>){
	chop();
	my @tokens = split(/\t/);
	my $stage = $tokens[0];
	my $artist = $tokens[3];
	my $startTime = $tokens[1];
	my $endTime = $tokens[2];
	my $extra = $tokens[4];
#	print "$artist $startTime $endTime\n";

	my $start = getTime( $startTime ); 
	my $end   = getTime( $endTime ); 

	my $top = $hourHeight * $start - $hourHeight * 11 + $stageHeight + 20;
	my $left = $stageWidth * $stage - $stageWidth;
	my $height = $hourHeight * ($end - $start);
	my $width = $stageWidth;

	$height -= 6; # for padding in html
	$width -= 11; # for padding and spacing in html

	$top = int($top);
	$height = int($height);

	my $startAmPm = getAmPm( $startTime );
	my $endAmPm = getAmPm ( $endTime);


	print "<div style=\"top:${top}px; left:${left}px; width:${width}px; height:${height}px;\">";
	print "<span class=\"artist\">$artist</span>";
	if ($extra ){
		print " <span>$extra</span>";
	}
	print " <span class=\"time\">$startAmPm - $endAmPm</span>";
	print "</div>\n";
}

sub getTime(){
	my $timeString = shift;
	(my $hours,my $minutes) = split( /:/, $timeString );
	return $hours +( $minutes/60 );
}

sub getAmPm(){
        my $timeString = shift;
	(my $hours,my $minutes) = split( /:/, $timeString );
	my $ampm = "am";
	if( $hours > 11 ){
		$ampm = "pm";
	}
	if( $hours > 12 ) {
		$hours = $hours - 12;
	}
	return "$hours:$minutes$ampm";

}
