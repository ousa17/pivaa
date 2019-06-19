pipeline {
  agent any
   stages {
  // Mark the code checkout 'stage'....
  stage ('Stage SCM'){
    steps {
  // Checkout code from repository and update any submodules
  git 'https://github.com/badredaha/pivaa.git'  
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

     stage('Running Metrics') {
      steps {
        parallel (
          "Sonar Metrics": {
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
    sh 'script_sec.sh'
  }
  }

   stage ('Prepro'){
   
 steps {
      printf 'Preprod'
      }
   }

   stage ('Prod'){
    
    steps {
      printf 'Prod'
      }
   }
}
}