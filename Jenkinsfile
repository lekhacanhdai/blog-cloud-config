pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub_user')
    }
    stages {
        stage('Maven build') {
            agent {
                docker {
                    image 'maven:3.6.3-jdk-11'
                    args '-v /var/jenkins_home:/home/jenkins/.m2 --network=host'
                    reuseNode true
                }
            }
            steps {
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