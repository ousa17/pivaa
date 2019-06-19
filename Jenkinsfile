node {
   
  // Mark the code checkout 'stage'....
  stage 'Stage SCM'
  // Checkout code from repository and update any submodules
  git 'https://github.com/badredaha/pivaa.git'  

  stage 'Stage Test'

  //build your gradle flavor, passes the current build number as a parameter to gradle
  sh "./gradlew  build"

  stage 'Security'{


  printf "\n1 - upload APK To MobSF **********\n"
upload_output=`curl -F  'file=@app/build/outputs/apk/debug/app-debug.apk' http://localhost:8000/api/v1/upload -H "Authorization:a040efa948f0835871d40bd0badfc1e9c85c3a48d8ecd3f9d42418b1d6c453f5"`
printf "\nretreive hash\n"
hash=`sed -n 's/^.*"hash": "\(.*\)",.*$/\1/p' <<< $upload_output`
cat  $hash
printf "\n2- scan *************\n"
curl -X POST --url http://localhost:8000/api/v1/scan --data "scan_type=apk&file_name=app-debug.apk&hash=$hash" -H "Authorization:a040efa948f0835871d40bd0badfc1e9c85c3a48d8ecd3f9d42418b1d6c453f5"
printf "\n3- download pdf *****\n"
curl -X POST --url http://localhost:8000/api/v1/download_pdf --data "hash=$hash&scan_type=apk" -H "Authorization:a040efa948f0835871d40bd0badfc1e9c85c3a48d8ecd3f9d42418b1d6c453f5" -o report.pdf
printf "\nhttp://localhost:8000/StaticAnalyzer/?name=app-debug.apk&type=apk&checksum=$hash\n"
printf "\n4- generate json *****\n"
curl -X POST --url http://localhost:8000/api/v1/report_json --data "hash=$hash&scan_type=apk" -H "Authorization:a040efa948f0835871d40bd0badfc1e9c85c3a48d8ecd3f9d42418b1d6c453f5" -o report.json
   }

   stage 'Prepro'{
   echo "Preprod"

   }

   stage 'Prepro'{
   printf "Prod"
   
   }

}