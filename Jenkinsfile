def mvnHome

node('node'){
   stage('git checkout'){
      try {
      git credentialsId: 'git-token', url: 'https://github.com/rbngtm1/CI_CD_Integration'
      } catch(err) {
         sh "echo error in checkout"
      }
   }
  
   stage('maven test and package'){
      try {
      mvnHome=tool 'maven-3.6.3'
      sh "${mvnHome}/bin/mvn --version"
      sh "${mvnHome}/bin/mvn clean test surefire-report:report-only"
      sh "${mvnHome}/bin/mvn clean package -DskipTest=true" 
      } catch(err) {
         sh "echo error in defining maven"
      }
   }
   
   stage('test case and report'){
      try {
         echo "executing test cases"
         junit allowEmptyResults: true, testResults: 'addressbook_main/target/surefire-reports/*.xml'
         publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'addressbook_main/target/surefire-reports', reportFiles: 'index.html', reportName: 'htmlreports', reportTitles: ''])
      } catch(err) {
         throw err
      }
   }
   
//       stage('artifacts'){
//       try {
//          archiveArtifacts allowEmptyArchive: true, artifacts: 'addressbook_main/target/**/*.war'
//       } catch(err) {
//          sh "echo error in generating artifacts"
//       }
//    }

//    stage ('docker build and push'){
//       try {
//        sh "docker version"
//        sh "docker build -t rbngtm1/archiveartifacts:newtag -f Dockerfile ."
//        sh "docker run -d rbngtm1/archiveartifacts:newtag"
//       // withDockerRegistry(credentialsId: 'docker-hub-registry')
//        docker.withRegistry('', 'docker-hub-registry')  {
//        sh "docker push rbngtm1/archiveartifacts:newtag"
//         }
//       } catch(err) {
//          sh "echo error in docker build and pushing to docker hub"
//       }
//    }

//    stage('deployment of application') {
//       try {
//         sshagent(['ec2-user-target']){
//            // clone the repo on target /opt
//             sh "ssh -o StrictHostKeyChecking=no ec2-user@10.0.0.167 /opt/CI_CD_Integration/install_tomcat_jenkins.sh"
//             sh "scp -o StrictHostKeyChecking=no /home/ec2-user/workspace/ex1/workspace/pipeline/addressbook_main/target/addressbook.war ec2-user@10.0.0.167:/tmp/"
//            // sh "sudo ln -s /tmp/addressbook.war /var/lib/tomcat/webapps/"
//             }
//         } catch(err) {
//            sh "echo error in deployment of an application"
//         }
//    }
      
//    stage('artifacts to s3') {
//       try {
//       // you need cloudbees aws credentials
//       withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'deploytos3', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
//          sh "aws s3 ls"
//          sh "aws s3 cp addressbook_main/target/addressbook.war s3://cloudyeticicd/"
//          }
//       } catch(err) {
//          sh "echo error in sending artifacts to s3"
//       }
//    }
}
