pipeline {
    agent any

    environment {
        // Define Docker Hub credentials stored in Jenkins
        DOCKER_CREDENTIALS = credentials('CredentialID_DockerHubPWD') // Name of your Jenkins Docker Hub credentials ID
        IMAGE_NAME = 'comp367-lab2-webapp'
        DOCKER_TAG = 'latest' // You can modify this as per your versioning/tagging strategy
    }

    // triggers {
        // pollSCM('H/5 * * * *')  // Poll the SCM every 5 minutes
    // }

    tools {
        // Specify the Maven installation from Jenkins tool configurations
        maven 'Maven 3'  // Replace with the name of your Maven installation configured in Jenkins
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
                    // Login to Docker Hub using Jenkins credentials
                    //docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS) {
                        //echo 'Docker login successful'
                    //}
                    sh 'docker login -u jbelenzo -p ${DOCKER_CREDENTIALS}'
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
