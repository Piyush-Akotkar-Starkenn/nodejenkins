pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('1970a63c-b561-4f07-af6b-489fb9261b97')
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t jenkinsnode .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: '1970a63c-b561-4f07-af6b-489fb9261b97', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
                    sh "docker push piyushakotkar/jenkinsnode"
                }
            }
        }
    }
}
