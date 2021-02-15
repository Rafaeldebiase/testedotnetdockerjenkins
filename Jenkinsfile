pipeline{
    agent none
    stages{
        stage('Build') {
            agent {
                dockerfile
            }
            steps {
                echo 'docker build'
            }
        }
    }
}