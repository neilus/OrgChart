<?php
require_once('includes.inc');
require_once($PHPDOCX.'CreateDocx.inc');
$output='hello_world';
$docx = new CreateDocx();
$docx->addText('Hello world!');
$docx->createDocx($DOCX_OUT.'hello_world');
//print $DOCX_OUT.'hello_world.docx';
//print '<a href="'.$DOCX_OUT.$output.'.docx" >hello phpdocx!</a> ';

$pdf = new TransformDoc();
$pdf->setStrFile($DOCX_OUT.$output.'.docx');
$pdf->generatePDF();

?>
