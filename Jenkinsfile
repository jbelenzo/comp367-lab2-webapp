pipeline {
    agent any

    environment {
        // Define Docker Hub credentials stored in Jenkins
        DOCKER_CREDENTIALS = credentials('CredentialID_DockerHubPWD') // Jenkins Docker Hub Password
        IMAGE_NAME = 'comp367-lab2-webapp'
        DOCKER_TAG = 'latest'
    }

    tools {
        // Specify the Maven installation from Jenkins tool configurations
        maven 'Maven 3'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                checkout scm
                // git branch: 'master', url: 'https://github.com/jbelenzo/comp367-lab2-webapp.git'
            }
        }

        stage('Maven Build') {
            steps {
                // Build the Maven project (clean, install dependencies, package)
                echo 'Building the project with Maven...'
                sh 'mvn clean package'  // This will build the project and package it (e.g., .war/.jar file)
            }
        }

        stage('Docker Login') {
            steps {
                script {
                    sh 'docker login -u jbelenzo -p ${DOCKER_CREDENTIALS}'
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile
                    echo 'Building Docker image...'
                    sh 'docker build -t $IMAGE_NAME:$DOCKER_TAG .'
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    echo 'Pushing Docker image to Docker Hub...'
                    sh 'docker tag $IMAGE_NAME:$DOCKER_TAG jbelenzo/$IMAGE_NAME:$DOCKER_TAG'
                    sh 'docker push jbelenzo/$IMAGE_NAME:$DOCKER_TAG'
                }
            }
        }

    }

    post {
        success {
            echo 'Build completed successfully!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
