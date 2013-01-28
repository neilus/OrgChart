<?php

$output='phpdocx_template_output';
require_once('includes.inc');
require_once($PHPDOCX.'CreateDocx.inc');
require_once($PHPDOCX.'TransformDoc.inc');

$docx = new CreateDocx();

$docx->addTemplate($indoc.'simple_formatted_text.docx');
$docx->addTemplateVariable('NAME', 'John Smith');
$docx->createDocx($outdoc.$output);

$pdf = new TransformDoc();
//$pdf->setStrFile($DOCX_OUT.$output.'.docx');
$pdf->setStrFile($indoc.'simple_formatted_text.docx');
$pdf->generatePDF();
?>
