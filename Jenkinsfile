def mvnHome

node('node'){
   stage('git checkout'){
      try {
       git credentialsId: 'git-token', url: 'https://github.com/rbngtm1/CI_CD_Integration'
      } catch(err) {
         sh "echo error in checkout"
      }
   }
   
   stage('maven test'){
      try{
         mvnHome=tool 'maven-3.6.3'
         sh "$mvnHome/bin/mvn --version"
         sh "$mvnHome/bin/mvn clean test surefire-report:report"
      } catch(err) {
         sh "echo error in defining maven"
      }
   }
   
   stage('test case and report'){
      try {
         echo "executing test cases"
         junit allowEmptyResults: true, testResults: 'addressbook_main/target/surefire-reports/*.xml'
         publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'addressbook_main/target/site', reportFiles: 'surefire-report.html', reportName: 'SureFireReportHTML', reportTitles: ''])

      } catch(err){
         throw err
      }
   }

   stage('package and generate artifacts'){
      try {
         sh "$mvnHome/bin/mvn clean package -DskipTests=true"
         archiveArtifacts allowEmptyArchive: true, artifacts: 'addressbook_main/target/**/*.war'
      } catch(err) {
         sh "echo error in packaging and generating artifacts"
      }
   }

   stage('deployment of application using docker'){
      try {
         sh "docker version"
         sh "docker build -t rbngtm1/archiveartifacts:newtag -f Dockerfile ."
         sh "docker run -p 8080:8080 -d rbngtm1/archiveartifacts:newtag"
         withDockerRegistry(credentialsId: 'docker-hub-registry') {
         sh "docker push rbngtm1/archiveartifacts:newtag"
         }
      } catch(err) {
         sh "echo error in deployment using docker"
      }
   }
}