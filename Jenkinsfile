node('node'){
   stage('git checkout'){
      try {
       git branch: 'feature1', credentialsId: 'gittoken', url: 'https://github.com/rbngtm1/CI_CD_Integration.git'
      } catch(err) {
         sh "echo error in checkout"
      }
   }
   
