pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                // Здесь укажите ваш репозиторий с Dockerfile и конфигурацией Nginx
                git 'https://github.com/MikeClean/cicd_test.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def image = docker.build("nginx-image")
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Останавливаем предыдущий контейнер
                    sh 'docker stop nginx-container || true && docker rm nginx-container || true'
                    
                    // Запускаем новый контейнер с Nginx
                    sh 'docker run -d --name nginx-container -p 80:80 nginx-image'
                }
            }
        }
    }
    post {
        always {
            echo 'Cleaning up...'
            sh 'docker system prune -f'
        }
    }
}
