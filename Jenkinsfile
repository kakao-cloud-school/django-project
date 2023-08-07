pipeline{
  agent any
  environment{
    REPOSITORY = "JoYoungKyung/jenkinshub"
    DOCKERHUB_CREDENTIALS = credentials(docker_access_token)
  }
  stages{
    stage('git pull'){
      steps{
        git url: 'https://github.com/kakao-cloud-school/django-project.git', branch: 'main'
      }
    }
    stage('build'){
      steps{
        sh 'docker build -t $REPOSITORY:$BUILD_TAG .'
      }
    }
    stage('docker login'){
      steps{
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('docker push'){
      steps{
        sh 'docker push $REPOSITORY:${BUILD_TAG}'
      }
    }
    stage('docker pull'){
      steps{
        sh 'docker pull $REPOSITORY:${BUILD_TAG}'
      }
    }
  }
}
