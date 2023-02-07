pipeline {
   agent any
  
   environment {
       DOCKER_HUB_REPO = "13579246800/flask-devops"
       CONTAINER_NAME = "flask-devops"
       DOCKERHUB_CREDENTIALS=credentials('fef905be-dce5-4850-a07f-3bf9c8e30d0c')
   }
  
   stages {
       stage('Build') {
           steps {
               echo 'Building..'
               sh 'docker image build -t $DOCKER_HUB_REPO:latest .'
           }
       }
       stage('Push') {
           steps {
               echo 'Pushing image..'
               sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
               sh 'docker push $DOCKER_HUB_REPO:latest'
           }
       }
       stage('Deploy') {
         steps {
            echo 'Deploying....'
            sh 'scp -r -o StrictHostKeyChecking=no deployment.yaml service.yaml meily_oeng@34.136.245.191:~/'
 
            sh 'ssh meily_oeng@34.136.245.191 kubectl apply -f ~/deployment.yaml'
            sh 'ssh meily_oeng@34.136.245.191 kubectl apply -f ~/service.yaml'
         }
      }
   }
}
