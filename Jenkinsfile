pipeline{
    agent {
        docker {
            image 'mcr.microsoft.com/dotnet/aspnet:5.0'
            args '-p 5000:5000'
        }
    }
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
                echo 'dotnet test'
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
            when {
                branch 'production'
            }
            steps {
                echo 'deploy para prod'
            }
        }

    }
}

