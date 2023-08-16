pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dai_dockerhub_user')
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
    }
}