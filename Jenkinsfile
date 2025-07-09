pipeline {
    agent any

    environment {
        mavenhome = tool 'jenkins-maven'
        imageName = "cicd-infoline"
        registryCredentials = "dockerhubcred"
        registry = ""
        dockerImage = ""
    }

    tools {
        jdk 'jenkins-jdk'
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/jeromebrasseur/docker-hello-world-spring-boot.git'
            }
        }

        stage('Install dependencies') {
            steps {
                bat "mvn clean -DskipTests install"
            }
        }

        stage('Test') {
            steps {
                bat "mvn test"
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
                script {
                    withDockerRegistry([credentialsId: registryCredentials, url: ""]) {
                        dockerImage.push()
                    }
                }
            }
        }


    }
}
