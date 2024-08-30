pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'strapi-app:latest'
        HOST = 'localhost'
        PORT = '1337'
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/SwapnilB-SDLC/strapi-simple-one.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE} .'
            }
        }
        
        stage('Deploy') {
            steps {
                sh 'docker run -d -p ${PORT}:${PORT} ${DOCKER_IMAGE}'
                echo "Strapi app is running on: http://${HOST}:${PORT}"
            }
        }
    }
    
    post {
        always {
            echo 'Cleaning up...'
            cleanWs()
        }
    }
}
