<?php

$output='phpdocx_output';
require_once('includes.inc');
require_once($PHPDOCX.'CreateDocx.inc');
require_once($PHPDOCX.'TransformDoc.inc');

$docx = new CreateDocx();
$text = array();
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
$docx->addText($text);

$docx->createDocx($DOCX_OUT.$output);

//print '<a href="'.$DOCX_OUT.$output.'.docx" >GRAB THE docx file!</a> ';

$pdf = new TransformDoc();
//$pdf->setStrFile($DOCX_OUT .$output .'.docx.');
//$pdf->setStrFile('../docx/hello_world.docx');
//$pdf->setStrFile('../docx/hello_bold_text.docx');
$pdf->generatePDF();
?>
