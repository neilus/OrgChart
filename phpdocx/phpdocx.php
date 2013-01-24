<?php
require_once('includes.inc');
require_once($PHPDOCX.'/CreateDocx.inc');
$docx = new CreateDocx();
$docx->addText('Hello world!');
$docx->createDocx($DOCX_OUT.'/phpdocx_output');

?>