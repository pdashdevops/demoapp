pipeline{
    //agent any
    agent {label 'worker'}
    options{
        buildDiscarder(logRotator(daysToKeepStr: '15'))
        disableConcurrentBuilds()
        timeout(time: 5, unit: 'MINUTES')
        retry (3)
    }
    parameters{
        string(name: 'BRANCH', defaultValue: 'main')
        }
   
    stages{
            stage('Git Checkout'){
        steps{
            checkout scm
        }
        }
     
       stage('Build and Push'){
        steps{
            sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 713973836604.dkr.ecr.us-east-1.amazonaws.com"
            sh "docker build -t 713973836604.dkr.ecr.us-east-1.amazonaws.com/assignment:v${BUILD_NUMBER} ."
            sh "docker push 713973836604.dkr.ecr.us-east-1.amazonaws.com/assignment:v${BUILD_NUMBER}"
        }
       }
       
    }
    post{
        always{
            sh "echo running final steps"
        }
    }

}
