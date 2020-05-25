pipeline {
   agent {
       docker{
           image 'python'
       }
   }

   stages {
      stage('Build') {
         steps {
            echo 'Compiling or resolving project dependencies!'
            sh 'pip install -r requirements'
         }
      }
      stage('Tests'){
          steps{
              echo 'Executing regression tests!'
              sh 'robot -d ./log -e todo tests/'
          }
      }
      stage('UAT'){
          steps{
              echo 'Waiting user acceptance testing!'
              input(message: 'Go to Production?', ok: 'Yes')
          }
      }
      stage('Production'){
          steps{
              echo 'App is ready!'
          }
      }
   }
}
