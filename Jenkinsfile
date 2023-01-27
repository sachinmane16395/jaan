pipeline {

    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }

    agent any

    tools {
        maven 'maven'
    }
    stages {
        stage('Code Compilation') {
            steps {
                echo 'code compilation is starting'
                sh 'mvn clean compile'
				echo 'code compilation is completed'
            }
        }
        stage('Code Package') {
            steps {
                echo 'code packing is starting'
                sh 'mvn clean package'
				echo 'code packing is completed'
            }
        }
        stage('Building & Tag Docker Image') {
                    steps {
                        echo 'Starting Building Docker Image'
                        sh 'docker build -t sachin163/jaan .'
                        sh 'docker build -t jaan .'
                        echo 'Completed  Building Docker Image'
                    }
                }

                stage(' Docker push to Docker Hub') {
                                   steps {
                                      script {
                                         withCredentials([string(credentialsId: 'dockerhubCred', variable: 'dockerhubCred')]){
                                         sh 'docker login -u sachin163 -p ${dockerhubCred}'
                                         echo "Push Docker Image to DockerHub : In Progress"
                                         sh 'docker push sachin163/jaan:latest'
                                         echo "Push Docker Image to DockerHub : In Progress"
                                         sh 'whoami'
                                         }
                                      }
                                    }
                                }
        }
        }