node('maven'){
stage('maven define'){
   // use the id of the globally configured maven instance
def mvnTool = tool 'Apache Maven 3.6.2'

// execute maven
sh "${mvnTool}/bin/mvn clean package" 
junit allowEmptyResults: true, testResults: 'target/surefire-reports/*.xml'
sh "echo hello world"
   }
stage('artifacts'){
archiveArtifacts '**/target/*.war'   
}
#stage('deployment'){
#        sshagent(['ec2-user']) {
#        sh "ssh -o StrictHostKeyChecking=no ec2-user@54.173.243.85 /home/ec2-user/tomcat9/bin/startup.sh"
#        sh "scp -o StrictHostKeyChecking=no /home/ec2-user/workspace/pipeline-project/addressbook_main/target/addressbook.war ec2-user@54.173.243.85 /home/ec2-user/tomcat9/webapps"
#       }
#    }
}
