pipeline {
    agent any


    environment {
        imageName = "jeromebrasseur/cicdspringboot:latest"
        DOCKERHUB_CREDENTIALS = credentials('dockerhubcred')
    }

    
    tools {
        jdk 'jenkins-jdk'
        maven 'jenkins-maven'
    }

    
    stages {

        stage('Clone') {
            steps {
                git 'https://github.com/jeromebrasseur/docker-hello-world-spring-boot.git'
            }
        }
        
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

        stage('Login') {
            steps {
                sh '''
                    #!/bin/bash
                    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                 '''
            }
        }
        
        stage('Push') {
            steps {
                sh '''
                    #!/bin/bash
                    docker push $imageName
                 '''
            }
        }
    }

    post {
        always {
            sh '''
                    #!/bin/bash
                    docker logout
                 '''
        }
    }
}
