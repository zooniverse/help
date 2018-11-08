#!groovy

pipeline {
  agent { dockerfile true }

  options {
    quietPeriod(120)
    disableConcurrentBuilds()
  }

  stages {
    stage('Deploy to Github Pages') {
      when { branch 'master' }
      options {
        skipDefaultCheckout true
      }
      steps {
        sh "cat .git/config"
        sh "mkdocs gh-deploy"
      }
    }
  }
}
