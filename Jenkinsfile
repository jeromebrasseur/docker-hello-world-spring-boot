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

        stage('Configure kubectl') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'awscred']]) {
                    sh '''
                        #!/bin/bash
                        aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME
                        aws sts get-caller-identity
                    '''
                }
            }
        }
        
        stage('Deploy to EKS') {
            steps {
                sh '''
                    #!/bin/bash
                    kubectl apply -f k8s/deployment.yaml
                    kubectl apply -f k8s/service.yaml
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
