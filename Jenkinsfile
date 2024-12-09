pipeline {
    agent any
    stages {
        stage('Get Git Branch') {
            steps {
                script {
                    def branch = sh(script: 'git rev-parse --abbrev-ref HEAD', returnStdout: true).trim()
                    echo "Current Git branch is: ${branch}"
                }
            }
        }
    }
}
