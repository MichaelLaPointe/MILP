# Script to analyze in ChatGPT, Claude AI, and DeepSeek R1

$r=@();ps|%{if($_.CPU-gt 100){$r+=[PSCustomObject]@{Name=$_.Name;CPU=$_.CPU;Memory=($_.WorkingSet/1MB).ToString("N2")+" MB"}}};$r|Sort CPU -Descending|epcsv -Path "H.csv" -NoTypeInformation
