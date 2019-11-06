pipeline {
  agent {
    node {
      label 'go'
    }

  }
   environment {
     DOCKERHUB_CREDENTIAL_ID = 'dockerhub-id'
   }
  stages {
    stage('checkout scm ') {
      steps {
        checkout(scm)
      }
    }
    stage('prepare') {
      steps {
        container('go') {
          sh 'go get github.com/cpuguy83/go-md2man'
          sh 'yum install distgen -y'
        }

      }
    }
    stage('python27 test') {
      steps {
        container('go') {
          sh '''git submodule update --init
make VERSIONS="2.7" BASE_IMAGE_NAME="python" test'''
        }

      }
    }
    stage('python34 test') {
      steps {
        container('go') {
          sh '''git submodule update --init
make VERSIONS="3.4" BASE_IMAGE_NAME="python" test'''
        }

      }
    }
    stage('python35 test') {
      steps {
        container('go') {
          sh '''git submodule update --init
make VERSIONS="3.5" BASE_IMAGE_NAME="python" test'''
        }

      }
    }
    stage('python36 test') {
      steps {
        container('go') {
          sh '''git submodule update --init
make VERSIONS="3.6" BASE_IMAGE_NAME="python" test'''
        }

      }
    }
    stage('push to dockerhub'){
      when {
        branch 'master'
      }
      steps{
        container('go'){
          withCredentials([usernamePassword(passwordVariable : 'DOCKER_PASSWORD' ,usernameVariable : 'DOCKER_USERNAME' ,credentialsId : "$DOCKERHUB_CREDENTIAL_ID" ,)]) {
            sh 'echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin'
          }
          sh '''docker tag kubespheredev/python-27-centos7 kubespheredev/python-27-centos7:2.1
docker tag kubespheredev/python-34-centos7 kubespheredev/python-34-centos7:2.1
docker tag kubespheredev/python-35-centos7 kubespheredev/python-35-centos7:2.1
docker tag kubespheredev/python-36-centos7 kubespheredev/python-36-centos7:2.1 
'''
          sh 'docker push kubespheredev/python-27-centos7'
          sh 'docker push kubespheredev/python-34-centos7'
          sh 'docker push kubespheredev/python-35-centos7'
          sh 'docker push kubespheredev/python-36-centos7'
        }
      }
    }
  }
}
