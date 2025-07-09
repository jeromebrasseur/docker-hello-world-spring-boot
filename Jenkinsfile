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
                bash "mvn clean -DskipTests install"
            }
        }

        stage('Test') {
            steps {
                bash "mvn test"
            }
        }

        stage('Deploy') {
            steps {
                bash "mvn jar:jar deploy:deploy"
                }
            }
        }

}
