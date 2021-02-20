pipeline{
    agent any
    environment {
        CI = 'true'
    }
    stages{
        stage('Build') {
            steps {
                sh 'dotnet build'
            }
        }
        stage('Unit tests') {
            steps {
                sh 'dotnet test'
            }
        }
        stage('Deploy to development') {
            when {
                branch 'devolpment'
            }
            steps {
                echo 'deploy para dev'
            }
        }
        stage('Deploy to QA') {
            when {
                branch 'QA'
            }
            steps {
                echo 'deploy para QA'
            }

        }
        stage('Deploy to production') {
            agent {
                dockerfile true
            }
            when {
                branch 'production'
            }
            steps {
                echo 'deploy para prod'
            }
        }

    }
}

