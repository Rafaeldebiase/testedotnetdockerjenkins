pipeline{
    agent none
    stages{
        stage('Build') {
            agent dockerfile
            stage {
                echo 'docker build'
            }
        }
    }
}