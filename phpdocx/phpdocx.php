<!DOCTYPE HTML>
<html><head><title>hello phpdocx library!</title></head>
<body>
<?php

$output='phpdocx_output';
require_once('includes.inc');
require_once($PHPDOCX.'CreateDocx.inc');
$docx = new CreateDocx();
// adding my formatted text into a string
$text[] =
	array(
	'text' => 'I am going to write',
	);
$text[] =
	array(
	'text' => ' Hello World!',
	'b' => 'single',
	);

$text[] =
	array(
	'text' => ' using bold characters.',
	);
// putting the my string in to the docx file
$docx->addText($text);
$docx->createDocx($DOCX_OUT.$output);

print '<a href="'.$DOCX_OUT.$output.'.docx" >GRAB THE docx file!</a> ';
?>
</body></html>