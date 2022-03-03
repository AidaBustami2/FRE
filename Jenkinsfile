pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                sh '/root/test2/script6.sh'
            }
        }
    }
}
