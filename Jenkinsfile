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
            agent {
                dockerfile true
                args 'development'
            }
            steps {
                echo 'deploy para dev'
            }
        }
        stage('Deploy to QA') {
            when {
                branch 'QA'
            }
            agent {
                dockerfile true
                args 'staging'
            }
            steps {
                echo 'deploy para QA'
            }

        }
        stage('Deploy to production') {
            when {
                branch 'production'
            }
            agent {
                dockerfile true
                args 'production'
            }
            steps {
                echo 'deploy para prod'
            }
        }

    }
}

