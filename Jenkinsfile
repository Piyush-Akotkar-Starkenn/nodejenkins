pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('1970a63c-b561-4f07-af6b-489fb9261b97')
    }
    stages {
	    
	    stage('gitclone') {

			steps {
				git 'https://github.com/piyushak21/nodejenkins.git'
			}
		}

		stage('Build') {

			steps {
				sh 'docker build -t piyushakotkar/jenkinsnode:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push piyushakotkar/jenkinsnode:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
