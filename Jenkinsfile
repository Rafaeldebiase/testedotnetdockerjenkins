pipeline{
    agent none
    environment {
        CI = 'true'
        profile = 'Development'
        release = '-c Debug'
    }
    stages{
        stage('Build dotnet') {
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
            agent any
            when {
                branch 'devolpment'
            }
            steps {
                echo 'deploy para ${env.Profile}'
            }
        }
        stage('Deploy to QA') {
            when {
                beforeInput true
                branch 'QA'
            }
            input {
                message "Deploy to QA?"
                id "simple-input"
            }
            environment {
                profile = 'Staging'
            }
            steps {
                echo 'deploy para ${env.Profile}'
            }
        }
        stage('Deploy to production') {
            when {
                beforeInput true
                branch 'main'
            }
            input {
                message "Deploy to production?"
                id "simple-input"
            }
            environment {
                profile = 'Production'
                release = '-c Release'
            }
            steps {
                echo 'deploy para ${env.Profile}'
            }
        }
        stage('Build Docker') {
            agent {
                dockerfile {
                    args '${profile}'
                    args '${release}'
                }
            }
            steps {
                echo 'build docker'
            }
        }
    }
    post{
        always{
            echo "====++++always++++===="
        }
        success{
            echo "====++++only when successful++++===="
            
        }
        failure{
            echo "====++++only when failed++++===="
        }
    }
}

