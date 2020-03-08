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

   // stage('deployment of application using docker'){
   //    try {
   //       sh "docker version"
   //       sh "docker build -t rbngtm1/archiveartifacts:newtag -f Dockerfile ."
   //       sh "docker run -p 8080:8080 -d rbngtm1/archiveartifacts:newtag"
   //       withDockerRegistry(credentialsId: 'docker-hub-registry') {
   //       sh "docker push rbngtm1/archiveartifacts:newtag"
   //       }
   //    } catch(err) {
   //       sh "echo error in deployment using docker"
   //    }
   // }

   stage('deployment of an application'){
      try {
         sshagent(['target-key-shared']) {
            sh "scp -o StrictHostKeyChecking=no tomcat.sh ec2-user@10.0.0.137:/tmp"
            sh "scp -o StrictHostKeyChecking=no symlink_target.sh ec2-user@10.0.0.137:/tmp"
            sh "ssh -o StrictHostKeyChecking=no ec2-user@10.0.0.137 /tmp/tomcat.sh"
            sh "scp -o StrictHostKeyChecking=no addressbook_main/target/addressbook.war ec2-user@10.0.0.137:/tmp"
            sh "ssh -o StrictHostKeyChecking=no ec2-user@10.0.0.137 /tmp/symlink_target.sh"
         }
      } catch(err){
         echo "error in deployment of an application"
      }
   }
}