pipeline {
   agent any
  
   environment {
       DOCKER_HUB_REPO = "13579246800/flask-devops"
       CONTAINER_NAME = "flask-devops"
 
   }
  
   stages {
       stage('Build') {
           steps {
               echo 'Building..'
               sh 'docker image build -t $DOCKER_HUB_REPO:latest .'
           }
       }
       stage('Deploy') {
           steps {
               echo 'Deploying....'
               sh 'docker stop $CONTAINER_NAME || true'
               sh 'docker rm $CONTAINER_NAME || true'
               sh 'docker run -d -p 5008:5000 --name $CONTAINER_NAME $DOCKER_HUB_REPO'
           }
       }
   }
}
