def mvnHome 
node('node'){
   stage("Verificar GITHUB"){
      try{
       git branch: 'feature1', credentialsId: 'gittoken', url: 'https://github.com/gilardoni72/CI_CD_Integration.git'
      } catch(err) {
         sh "echo error in Verificacion"
      }
   }

   stage("maven test"){
      try{
         mvnHome=Tool "nodeMaven"
         sh "{$mvnHome}/bin/mvn --verion"
         sh "{$mvnHome}/bin/mvn clean test surefire-report:report"

      } cache (err){
         sh "echo error in La definicion de Maven"
      }
   }
   
}
   
