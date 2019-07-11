   pipeline {
   agent any
   stages {
   // Mark the code checkout 'stage'....
   stage ('Stage SCM'){
   steps {
   // Checkout code from repository and update any submodules
   git 'https://github.com/ousa17/pivaa.git'
   }

   }

   stage('Running Tests') {
   steps {
   parallel (
   "Unit Tests": {
   sh 'fastlane test'
   }
   )
   }
   }

   stage('Running Build') {
   steps {
   parallel (
   "Build Project": {
   sh 'fastlane build'
   }
   )
   }
   }

   stage('Running Metrics') {
   steps {
   parallel (
   "Check Dependency": {
   sh 'fastlane checkdependency'
   },"Sonar Metrics": {
   sh 'fastlane metrics'
   }
   )
   }  

   }

   stage('Documentation') {
   steps {
   sh 'fastlane documentation'
   }
   }


   stage ('Security'){

   steps {
   sh 'bash script_sec.sh'
   }
      post {
          success {
             slackSend color: 'good', message: 'Security test passed successfully'
          }
          failure {
             slackSend color: 'danger', message: 'Security Test Failed : http://localhost:8000/StaticAnalyzer/?name=app-debug.apk&type=apk&checksum=165fce4921d8215edb28e1b83e31b2cf'
          }
        }
   }

   stage ('Prepro'){

   steps {
   sh 'fastlane beta'
   }
   }

   stage ('Prod'){

   steps {
   sh 'fastlane prod'
   }
   }
   }

 stage('Slack Notification') {
   post {
       success {
          slackSend color: 'good', message: 'Yes we passed'
       }
       failure {
          slackSend color: 'danger', message: 'Boo We failed'
       }
     }
     }
   }
