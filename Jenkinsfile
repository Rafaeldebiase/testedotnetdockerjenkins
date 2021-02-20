pipeline{
    agent none
    environment {
        CI = 'true'
    }
    stages{
        stage('Build') {
            agent any
            steps {
                sh 'dotnet build'
            }
        }
        stage('Unit tests') {
            agent any
            steps {
                sh 'dotnet test'
            }
        }
        stage('Deploy to development') {
            agent {
                dockerfile true
                args 'development'
            }
            when {
                branch 'devolpment'
            }
            steps {
                echo 'deploy para dev'
            }
        }
        stage('Deploy to QA') {
            agent {
                dockerfile true
                args 'staging'
            }
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
                args 'production'
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

