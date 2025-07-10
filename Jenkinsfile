pipeline {
    agent any


    environment {
        imageName = "cicdspringboot"
        registryCredentials = "nexus"
        registry = "http://69.62.107.142:9003/"
        dockerImage = ""
    }

    
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

        stage('Build image') {
            steps {
                script {
                    dockerImage = docker.build imageName
                }
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    #!/bin/bash
                    echo "deploy image docker"
                 '''
                }
            }
        }

}
