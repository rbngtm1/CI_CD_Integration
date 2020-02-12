node{
     echo "hithere"
}
stage 1 {
     def mvnhome = tool name: 'maven360', type: 'maven'
    stage('Git upload'){
   //     git credentialsId: 'demo', url: 'https://github.com/Prabhu4tx/addressbook'
        
    }
}
    stage('Maven build'){
        //def MavenHome = tool name: 'maven', type: 'maven'
        //def mvnCMD = "${MavenHome}/bin/mvn"
        //sh "${mvnCMD} clean compile"
        //sh "${mvnCMD} package"
         sh "$mvnhme/bin mvn clean test"
        // sh "$mvnhome/bin/mvn clean test surefire-report:report-only"
    } 
  //  }
    //   stage ('package'){
    //    sh "$mvnhome/bin/mvn clean package -DskipTests=true"
   //     }
}
