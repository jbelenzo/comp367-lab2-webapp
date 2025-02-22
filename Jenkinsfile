pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Pull the code from the Git repository
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Add your build steps here (e.g., build a Docker image, compile code, etc.)
                echo 'Building the project...'
                sh 'echo "Building"'
            }
        }

        stage('Test') {
            steps {
                // Add your test steps here (e.g., run unit tests)
                echo 'Running tests...'
                sh './run-tests.sh'  // If you have a script to run tests
            }
        }

        stage('Deploy') {
            steps {
                // Add deployment steps here if you need to deploy after building/testing
                echo 'Deploying the project...'
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
