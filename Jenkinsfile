node {
  try {
    stage('Checkout') {
      checkout scm
    }
    stage('Environment') {
      sh 'git --version'
      echo "Branch: ${env.BRANCH_NAME}"
      sh ' echo "Spio12345" | sudo -S docker -v'
      sh 'printenv'
    }
  }
  catch (err) {
    throw err
  }
}
