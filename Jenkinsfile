pipeline {
    agent any


    tools {
        jdk 'jenkins-jdk'
        maven 'jenkins-maven'
    }

    
    stages {
        
        stage('Build') {
            steps {
                sh '''
                    #!/bin/bash
                    mvn clean -DskipTests install
                 '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                    #!/bin/bash
                    mvn test
                 '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    #!/bin/bash
                    mvn jar:jar deploy:deploy
                 '''
                }
            }
        }

}
