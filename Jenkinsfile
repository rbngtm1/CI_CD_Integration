def mvnHome

node{
   stage('git checkout'){
      try {
      git credentialsId: 'git-token', url: 'https://github.com/rbngtm1/CI_CD_Integration'
      } catch(err) {
         sh "echo error in checkout"
      }
   }
  
   stage('maven define'){
      try {
      mvnHome=tool 'maven-3.6.3'
      sh "${mvnHome}/bin/mvn clean package" 
      } catch(err) {
         sh "echo error in defining maven"
      }
   }
   
   stage('artifacts'){
      try {
      archiveArtifacts 'target/**/*'   
      } catch(err) {
         sh "echo error in generating artifacts"
      }
   }

   stage('test and report'){
      try {
         echo "executing test cases"
         junit allowEmptyResults: true, testResults: 'target/surefire-reports/*.xml'
         publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'target/site/', reportFiles: 'surefire-report.html', reportName: 'HTMLReport', reportTitles: ''])
      } catch(err)
      throw err
      }
   }
   
   stage ('docker build and push'){
      try {
       sh "docker version"
       sh "docker build -t rbngtm1/archiveartifacts ."
       sh "docker run -d rbngtm1/archiveartifacts"
       sh "docker push rbngtm1/archiveartifacts"
      } catch(err) {
         sh "echo error in docker build and pushing to docker hub"
      }
   }

   stage('deployment of application') {
      try {
        sshagent(['ec2-user']){
            sh "ssh -o StrictHostKeyChecking=no ec2-user@54.80.200.161 /home/ec2-user/tomcat9/bin/startup.sh"
            sh "scp -o StrictHostKeyChecking=no /home/ec2-user/workspace/pipe-line-project/target/addressbook.war ec2-user@3.88.86.159:/home/ec2-user/tomcat9/webapps"
            }
        } catch(err) {
           sh "echo error in deployment of an application"
        }
   }
      
   stage('artifacts to s3') {
      try {
      withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-key-shared', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) 
      sh "aws s3 cp target/addressbook.war s3://mybucket/"
      } catch(err) {
         sh "echo error in sending artifacts to s3"
      }
   }
}
