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
                    args '-v /root/.m2:/root/.m2'
                    reuseNode true
                }
            }
            steps {
                 sh 'mvn -B -DskipTests clean package'
            }
        }
        stage("Docker build") {
            steps {
                script {
                    unixTime = (new Date().time / 1000) as Integer
                    developmentTag = "${unixTime}"
                }
                sh 'docker build -t anhdai0801/blog-cloud-config:${developmentTag} .'
            }
        }
        stage("Docker push") {
            steps {
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                sh "docker push anhdai0801/blog-cloud-config:${developmentTag}"
                sh "docker rmi anhdai0801/blog-cloud-config:${developmentTag}"
            }
        }
    }
}