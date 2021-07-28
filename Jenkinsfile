pipeline {
           agent any
           stages {
                stage('Pull from GitHub') {
                    steps {  
                        checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/manisharayudu/Jenkins_Docker.git']]])
                    }
                }

                stage('Build Docker image'){
                    steps {
              
                        sh 'docker build -t  manisharayudu12/project1:${BUILD_NUMBER} .'
                    }
                }

                stage('Docker Login'){
            
                    steps {
                        withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                            sh "docker login -u manisharayudu12 -p ${dockerhubpwd}"
                        }
                    }                
                }

                stage('Docker Push'){
                    steps {
                        sh 'docker push manisharayudu12/project1:${BUILD_NUMBER}'
                    }
                }
            }
}
