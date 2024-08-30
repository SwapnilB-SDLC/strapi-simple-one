pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'strapi-app:latest'
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/SwapnilB-SDLC/strapi-simple-one.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        
        //stage('Run Tests') {
            //steps {
                //script {
                    //docker.image(DOCKER_IMAGE).inside {
                        //sh 'npm test'
                    //}
                //}
            //}
        //}
        
        stage('Deploy') {
            steps {
                script {
                    def containerId = docker.run('-d -p 1337:1337 ' + DOCKER_IMAGE)
                    echo "Strapi app is running on: http://${HOST}:${PORT}"
                    docker.stop(containerId)
                    docker.rm('-f --volumes ' + containerId)
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
