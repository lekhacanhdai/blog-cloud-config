pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub_user')
    }
    stages {
        stage('Maven build') {
            agent {
                docker {
                    image 'maven:3.8.6-openjdk-11'
                    args '-v /home/jenkins/.m2:/home/jenkins/.m2'
                }
            }
            steps {
                 sh 'cat /home/jenkins/.m2/settings.xml'
                 sh 'mvn -s /home/jenkins/.m2/settings.xml -U clean install -Dmaven.test.skip=true'
            }
        }
        stage("Docker build") {
            steps {
                sh 'docker build -t anhdai0801/blog-cloud-config:latest .'
            }
        }
        stage("Docker push") {
            steps {
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                sh "docker push anhdai0801/blog-cloud-config:latest"
                sh "docker rmi anhdai0801/blog-cloud-config:latest"
            }
        }
    }
}