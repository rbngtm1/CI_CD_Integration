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

   stage ("Compilacion y Artifacts"){
      try{
         sh "$mvnHome/bin/mvn clean package -DskipTests=True"
         archiveArtifacts allowEmptyArchive: true, artifacts: 'addressbook_main/target/**/*.war', followSymlinks: false
      } catch(err){
         sh "echo error en la generacion del arifacts"
      }
   }

   stage("Deploy to DOCKER"){
      try{
         sh "docker version"
         sh "docker build -t gilardoni72/archiveartifacts:newtag -f Dockerfile"
         sh "docker run -p 8080:8080 -d gilardoni72/archiveartifacts:newtag"
         withDockerRegistry(credentialsId: 'docker-hub-registry') {
         sh "docker push gilardoni72/archiveartifacts:newtag"
        }
      } catch(err){
         sh "echo error en el deploy usando docker"
      }
   }

}
   
