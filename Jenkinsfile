pipeline {
  environment {
    imagename = "rdheepasri99/devops-assignment-jenkins-build:$BUILD_NUMBER"
    imagenameECR = "436617760852.dkr.ecr.us-east-1.amazonaws.com/devops-assignment-jenkins-build:$BUILD_NUMBER"
    registryCredential = 'Dheepasri_PAT'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/bennyhawk/C0886437_ClassAssignment_3.git', branch: 'master'])
 
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')
          }
        }
      }
    }
    stage('Building image for ECR') {
      steps{
        script {
          dockerImage = docker.build imagenameECR
        }
      }
    }
    stage('Deploy to ECR') {
      steps{
        script {
          docker.withRegistry("https://436617760852.dkr.ecr.us-east-1.amazonaws.com", "ecr:us-east-1:AWSECRCreds") {
            docker.image(imagenameECR).push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"
 
      }
    }
  }
}
