<!DOCTYPE html>

<html>
<head></head>
<body>
<?php

$cmd ="/Applications/Octave-cli.app/Contents/MacOS/Octave";
$cmd2="cd GitHub/Octave-based-Sentiment-Analysis/";
$cmd3="sentimentAnalysis";

$ex = passthru($cmd, $output);

echo "done";

?>

</body>
</html>