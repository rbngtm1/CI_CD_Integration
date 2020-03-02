# CI_CD_Integration

#### Master-slave architecture.
  * add master public key to node authorized key (this way master can communicate with node)
  * In jenkins GUI, add private ip of node and private key of master (in manage nodes)

#### To access the page in current instance
  *  sudo cp /usr/share/tomcat/.jenkins/workspace/pipeline/addressbook_main/target/addressbook.war /var/lib/tomcat/webapps/
  
#### Maven Build LifeCycle
  * http://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html
  
#### Maven SureFire Report
  * https://maven.apache.org/surefire/maven-surefire-report-plugin/

#### HTML Publisher
  * The HTML Publisher plugin is useful to publish HTML reports that your build generates to the job and build pages. It is designed to work with both Freestyle projects as well as being used in a Jenkins Pipeline.

#### Deployment to Target EC2 instance
  * share the key from jenkins slave to target ec2-instance
  * Install ssh-agent plugin and configure pipeline syntax (use ssh with private key option: and share private key of node(Slave))
