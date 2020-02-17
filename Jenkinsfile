node{
   stage('git checkout'){
      git credentialsId: 'git-token', url: 'https://github.com/rbngtm1/CI_CD_Integration'
   }
  
stage('maven define'){
   // use the id of the globally configured maven instance
def mvnTool = tool 'maven-3.6.3'

// execute maven
sh "${mvnTool}/bin/mvn clean package" 
junit allowEmptyResults: true, testResults: 'target/surefire-reports/*.xml'
sh "echo hello world"
   }
stage('artifacts'){
archiveArtifacts '**/target/*.war'   
}

       stage ('docker build')
    {
      // sh  "docker version"
        sh "docker build -t rbngtm1/myapp:2 ."
    }
//stage('deployment'){
//       sshagent(['ec2-user']) {
//       sh "ssh -o StrictHostKeyChecking=no ec2-user@54.173.243.85 /home/ec2-user/tomcat9/bin/startup.sh"
//       sh "scp -o StrictHostKeyChecking=no /home/ec2-user/workspace/pipeline-project/addressbook_main/target/addressbook.war ec2-user@54.173.243.85 /home/ec2-user/tomcat9/webapps"
//      }
//   }
}
