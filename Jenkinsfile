pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'jenkins'
        DOCKER_TAG = 'latest'
        DOCKER_REGISTRY = 'docker.io' // Modifier selon le registre si nécessaire
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Cloner votre repository Git contenant le code de l'application
                git 'https://github.com/AMEZIANDouha/Flask-app.git' // Remplacez avec votre URL GitHub
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Construire l'image Docker
                    sh 'docker build -t $DOCKER_IMAGE:$DOCKER_TAG .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Exécuter le conteneur Docker
                    sh 'docker run -d -p 5000:5000 $DOCKER_IMAGE:$DOCKER_TAG'
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Optionnel : Arrêter et supprimer les conteneurs une fois l'application terminée
                    sh 'docker ps -q --filter "name=$DOCKER_IMAGE" | xargs docker stop | xargs docker rm'
                }
            }
        }
    }

    post {
        always {
            // Optionnel : Nettoyage des images Docker
            sh 'docker rmi $DOCKER_IMAGE:$DOCKER_TAG || true'
        }
    }
}
