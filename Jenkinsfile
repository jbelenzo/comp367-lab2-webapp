pipeline {
    agent any

    tools {
        // Specify the Maven installation from Jenkins tool configurations
        maven 'Maven 3'  // Replace with the name of your Maven installation configured in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Build the Maven project (clean, install dependencies, package)
                echo 'Building the project with Maven...'
                sh 'mvn clean package'  // This will build the project and package it (e.g., .war/.jar file)
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
