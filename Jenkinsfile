pipeline {
    agent any
    stages {
        stage('Print Git Branch') {
            steps {
                script {
                    echo "Git branch name: ${env.GIT_BRANCH}"
                }
            }
        }
    }
}
