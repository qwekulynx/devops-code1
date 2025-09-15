pipeline {
  agent any
  tools {
    maven 'M2_HOME'
  }
  environment {
    registry = "qwekulynx/devops-code1"
    registryCredential = 'dockerUserID'   // Jenkins credentials ID for DockerHub
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
    stage('Build Docker Image') {
      steps {
        script {
          dockerImage = docker.build("${registry}:${BUILD_NUMBER}")
        }
      }
    }
    stage('Push Image') {
      steps {
        script {
          docker.withRegistry('', registryCredential) {
            dockerImage.push()
            dockerImage.push("latest")   // keep a 'latest' tag always
          }
        }
      }
    }
  }
}
