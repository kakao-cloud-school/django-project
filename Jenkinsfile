pipeline{
  agent any
  triggers {
        githubPush() // GitHub에 커밋이 발생하면 자동으로 파이프라인 시작
  }
  environment{
    REPOSITORY = "JoYoungKyung/jenkinshub"
    DOCKERHUB_CREDENTIALS = credentials('docker_access_token')
  }
  stages{
    stage('Checkout') {
      steps {
        // GitHub 저장소의 코드를 가져옴
        checkout scm
      }
    }
    stage('build'){
      steps{
        script {
          sh 'docker build -t $REPOSITORY .'
        }
      }
    }
    stage('docker login'){
      steps{
        script{
          sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
        }
      }
    }
    stage('docker push'){
      steps{
        script{
          sh 'docker push $REPOSITORY'
        }
      }
    }
    stage('docker pull'){
      steps{
        script{
          sh 'docker pull $REPOSITORY'
        }
      }
    }
  }
}
