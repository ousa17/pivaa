#!/usr/bin/env bash
pwd
printf "\n1 - upload **********\n"
upload_output=`curl -F  'file=@app/build/outputs/apk/debug/app-debug.apk' http://localhost:8000/api/v1/upload -H "Authorization:3fc39aaa54925c9b4a311322d731023295e0e1618f0668695049b07924ca81ef"`
printf "\nretreive hash\n"
hash=`sed -n 's/^.*"hash": "\(.*\)",.*$/\1/p' <<< $upload_output`
cat  $hash
printf "\n2- scan *************\n"
curl -X POST --url http://localhost:8000/api/v1/scan --data "scan_type=apk&file_name=app-debug.apk&hash=$hash" -H "Authorization:3fc39aaa54925c9b4a311322d731023295e0e1618f0668695049b07924ca81ef"
printf "\n3- download pdf *****\n"
curl -X POST --url http://localhost:8000/api/v1/download_pdf --data "hash=$hash&scan_type=apk" -H "Authorization:3fc39aaa54925c9b4a311322d731023295e0e1618f0668695049b07924ca81ef" -o report.pdf
printf "\nhttp://localhost:8000/StaticAnalyzer/?name=app-debug.apk&type=apk&checksum=$hash\n"
printf "\n4- generate json *****\n"
curl -X POST --url http://localhost:8000/api/v1/report_json --data "hash=$hash&scan_type=apk" -H "Authorization:3fc39aaa54925c9b4a311322d731023295e0e1618f0668695049b07924ca81ef" -o report.json

#printf "\n5- run glue on json file*****\n"
#glue/lib/glue/mappings/schema.json
#Severity should be between 1 to 3, not 0
docker run  -v $(pwd):/app owasp/glue:raw-latest ruby bin/glue -t Dynamic -T /app/report.json --mapping-file mobsf --finding-file-path /app/android.json -z 2

