pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'strapi-app:latest'
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://your-repository-url.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        
        stage('Run Tests') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).inside {
                        sh 'npm test'
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).withRun('-p 1337:1337') { c ->
                        sh "echo 'Strapi app is running on port 1337'"
                    }
                }
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
