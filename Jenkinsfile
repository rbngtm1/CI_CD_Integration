def mvnHome 
node('node'){
   stage("Verificar GITHUB"){
      try{
       git branch: 'feature1', credentialsId: 'gittoken', url: 'https://github.com/gilardoni72/CI_CD_Integration.git'
      } catch(err) {
         sh "echo error in Verificacion"
      }
   }

   stage("Prueba MAVEN"){
      try{
         mvnHome=tool "nodeMaven"
         sh "$mvnHome/bin/mvn --verion"
         sh "$mvnHome/bin/mvn clean test surefire-report:report"

      } catch (err){
         sh "echo error in La definicion de Maven"
      }
   }

}
   
