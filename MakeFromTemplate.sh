#!/bin/sh

if [ $# -eq 0 ]; then
  echo "Usage: $(basename $0) daynumber"
  exit 1
fi

DAYNUMBER=$1
cp "Template/DayX.swift" "AdventOfCode2020/Day${DAYNUMBER}.swift"
sed -i '' "s/DayX_Number/$DAYNUMBER/" "AdventOfCode2020/Day${DAYNUMBER}.swift"
sed -i '' "s/DayX/Day$DAYNUMBER/" "AdventOfCode2020/Day${DAYNUMBER}.swift"

cp "Template/DayXTests.swift" "AdventOfCode2020Tests/Day${DAYNUMBER}Tests.swift"
sed -i '' "s/DayX_Number/$DAYNUMBER/" "AdventOfCode2020Tests/Day${DAYNUMBER}Tests.swift"
sed -i '' "s/DayX/Day$DAYNUMBER/" "AdventOfCode2020Tests/Day${DAYNUMBER}Tests.swift"

touch "AdventOfCode2020Tests/InputData/Day${DAYNUMBER}_Example.txt"
touch "AdventOfCode2020Tests/InputData/Day${DAYNUMBER}_MyInput.txt"

echo "Done! Just add to Xcodeproj"
open "AdventOfCode2020"
open "AdventOfCode2020Tests"
