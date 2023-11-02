pipeline {
    agent any
    environment {
        GIT_CREDENTIALS = credentials('githublocal')
        DOCKERHUB_CREDENTIALS = credentials('1970a63c-b561-4f07-af6b-489fb9261b97')
    }
    stages {
	    
	    stage('gitclone') {

			steps {
				git branch: 'main', credentialsId: 'githublocal', url: 'https://github.com/piyushak21/nodejenkins.git'
			}
		}

        stage('Build') {
            steps {
                sh 'npm install'
            }
        }

        stage('Stop and Remove Previous Container') {
            steps {
                sh 'docker stop piyushakotkar/jenkinsnode || true'
                sh 'docker rm piyushakotkar/jenkinsnode || true'
            }
        }

		stage('Docker Build') {

			steps {
				sh 'docker build -t piyushakotkar/jenkinsnode:latest .'
			}
		}

		stage('Login to Docker Hub') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push to Docker Hub') {

			steps {
				sh 'docker push piyushakotkar/jenkinsnode:latest'
			}
		}

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 3001:3001 piyushakotkar/jenkinsnode:latest'
            }
        }
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
