//This is file for a Jenkins pipeline to build a Java application and create a Docker image.  
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t notes-app .'
            }
        }
    }
}
