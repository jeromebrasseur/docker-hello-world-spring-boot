pipeline {
    agent any


    environment {
        imageName = "jeromebrasseur/cicdspringboot:latest"
        DOCKERHUB_CREDENTIALS = credentials('dockerhubcred')
        AWS_REGION = "eu-west-3"
        CLUSTER_NAME = "infoline-eks-cluster"
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

        stage('Build Docker image') {
            steps {
                script {
                    dockerImage = docker.build imageName
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh '''
                    #!/bin/bash
                    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
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
