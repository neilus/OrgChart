<?php phpinfo();

require_once('phpdocx_free/classes/CreateDocx.inc');
$docx = new CreateDocx();
$docx->addText('Hello world!');
$docx->createDocx('docx/hello_world');

?>