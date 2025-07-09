pipeline {
    agent any

    environment {
        mavenhome = tool 'jenkins-maven'
    }

    tools {
        jdk 'jenkins-jdk'
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
