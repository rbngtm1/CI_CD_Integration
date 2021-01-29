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
         sh "$mvnHome/bin/mvn --version"
         sh "$mvnHome/bin/mvn clean test surefire-report:report"

      } catch (err){
         sh "echo error in La definicion de Maven"
      }
   }



   stage ("Reporte de test"){
      try{
         echo "ejcucion de test"
         junit allowEmptyResults: true, testResults: 'addressbook_main/target/surefire-reports/*.xml'
         publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'addressbook_main/target/site', reportFiles: 'surefire-report.html', reportName: 'Reporte_en_HTML', reportTitles: ''])  
      }catch(err){
         trrow err
      }


   }


}
   
