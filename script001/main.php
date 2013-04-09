<?php
if ($argc != 2) {
  echo "Usage: php " . $argv[0] . " file.csv\n";
  exit(-1);
}

// To read csv file.
$file = $argv[1];
$delimiter = ',';
$enclosure = '"';

// To write sql.
$output = "csv2sql.sql";

// Where data will be inserted.
$table = 'table';

$lines = file($file);

$end_sql = "";
$aux_sql = "INSERT INTO $table (";
file_put_contents($output, "-- Run queries to insert.\n");
foreach ($lines as $num => $csv) {
  $csvArray = str_getcsv($csv, $delimiter, $enclosure);

  if ($num == 0) {
    foreach ($csvArray as $index => $value) {
      if ($index > 0) {
        $aux_sql .= ",";
      }
      $aux_sql .= "`$value`";
    }
    $aux_sql .= ") VALUES (";
  } else {
    $end_sql = $aux_sql;
    foreach ($csvArray as $index => $value) {
      if ($index > 0) {
        $end_sql .= ",";
      }
      $data = trim($value);
      $end_sql .= "'" . $data . "'";
    }

    $end_sql .= ");\n";
  }
  file_put_contents($output, $end_sql, FILE_APPEND);
}

?>
