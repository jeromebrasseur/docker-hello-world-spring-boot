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
                bash '''
                    #!/bin/bash
                    mvn clean -DskipTests install
                 '''
            }
        }

        stage('Test') {
            steps {
                bash '''
                    #!/bin/bash
                    mvn test
                 '''
            }
        }

        stage('Deploy') {
            steps {
                bash '''
                    #!/bin/bash
                    mvn jar:jar deploy:deploy
                 '''
                }
            }
        }

}
