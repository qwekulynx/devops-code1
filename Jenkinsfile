pipeline {
    agent any

    tools {
        maven 'M2_HOME'   // Make sure you have Maven configured in Jenkins (Manage Jenkins -> Global Tool Configuration)
    }

    environment {
        registry = "qwekulynx/devops-code1"
        registryCredential = 'dockerhub'   // Jenkins credentials ID for DockerHub
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install package'
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                sh 'mvn test'
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', registryCredential) {
                        def app = docker.build("${registry}:${env.BUILD_NUMBER}")
                        app.push()
                        app.push("latest")   // keep a rolling latest tag
                    }
                }
            }
        }
    }
}
