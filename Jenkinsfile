pipeline {
    agent any

    tools {
        // Specify the Maven installation from Jenkins tool configurations
        maven 'Maven 3'  // Make sure Maven is installed and configured in Jenkins under "Global Tool Configuration"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the GitHub repository
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Run Maven build (mvn clean install)
                echo 'Building the project with Maven...'
                sh 'mvn clean install'  // You can change this to 'mvn package' or 'mvn compile' if needed
            }
        }

        stage('Test') {
            steps {
                // Run Maven tests (mvn test)
                echo 'Running tests with Maven...'
                sh 'mvn test'  // Run unit tests with Maven
            }
        }

        stage('Deploy') {
            steps {
                // Deploy the project (if required)
                echo 'Deploying the project...'
                // Add deployment steps here if needed
            }
        }
    }

    post {
        success {
            echo 'Pipeline successfully completed!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
