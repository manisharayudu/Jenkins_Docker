pipeline {
environment {
registry = "manisharayudu12/learning"
registryCredential = 'docker-hub'
dockerImage = ''
}
agent any
stages {
stage('Cloning our Git') {
steps {
git url:'https://github.com/manisharayudu/Jenkins_Docker.git', branch:'main'
}
}
stage('Building our image') {
steps{
script {
dockerImage = docker.build registry + ":$BUILD_NUMBER"
}
}
}
stage('Deploy our image') {
steps{
script {
docker.withRegistry( "" ) {
dockerImage.push()
}
}
}
}
}
}
