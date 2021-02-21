pipeline{
    agent any
    environment {
        CI = 'true'
        profile = 'Development'
        release = 'Debug'
    }
    stages{
        stage('Build dotnet') {
            steps {
                sh 'dotnet build'
                step([$class:'TelegramBotBuilder']) {
                    telegramSend {
                        message 'teste'
                    }
                }
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
                echo 'deploy para ${env.Profile}'
            }
        }
        stage('Deploy to QA') {
            when {
                branch 'QA'
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
                branch 'main'
            }
            environment {
                profile = 'Production'
                release = 'Release'
            }
            steps {
                echo 'deploy para ${env.Profile}'
            }
        }
        stage('Build Docker') {
            agent {
                dockerfile {
                    additionalBuildArgs  '--build-arg PROFILE=${profile} --build-arg RELEASE=${release}'
                    args '-p 5000:80'
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


