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
        }
        stage('Deploy to QA') {
            when {
                branch 'QA'
            }

        }
        stage('Deploy to production') {
            when {
                branch 'production'
            }
        }

    }
}

