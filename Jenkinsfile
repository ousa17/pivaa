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
          always {
           slackSend color: 'good', message: 'sec done'
          }
          success {
             slackSend color: 'good', message: 'sec passed'
          }
          failure {
             slackSend color: 'danger', message: 'sec failed'
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

   post {
       always {
        slackSend color: 'good', message: 'Jenkins works done'
       }
       success {
          slackSend color: 'good', message: 'Yes we passed'
       }
       failure {
          slackSend color: 'danger', message: 'Boo We failed'
       }
     }
   }
