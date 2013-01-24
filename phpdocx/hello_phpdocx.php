<!DOCTYPE HTML>
<html><head><title>hello phpdocx library!</title></head>
<body>
<?php
require_once('includes.inc');
require_once($PHPDOCX.'CreateDocx.inc');
$docx = new CreateDocx();
$docx->addText('Hello world!');
$docx->createDocx($DOCX_OUT.'hello_world');
//print $DOCX_OUT.'hello_world.docx';
print '<a href="'.$DOCX_OUT.'hello_world.docx" >hello phpdocx!</a> ';
?>
</body></html>