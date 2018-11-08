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
        withCredentials([usernamePassword(credentialsId: 'a9de592f-59b3-4920-af93-dc7873256ad4', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
          sh "git config remote.origin.url 'https://${GIT_USERNAME}@github.com/zooniverse/help.git'"
        }

        sh "cat .git/config"
        sh "mkdocs gh-deploy"
      }
    }
  }
}
