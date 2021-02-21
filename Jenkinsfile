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
                sendTelegram('teste')
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

def sendTelegram(message) {
    def encodedMessage = URLEncoder.encode(message, "UTF-8")

    withCredentials([string(credentialsId: 'telegramToken', variable: 'TOKEN'),
    string(credentialsId: 'telegramChatId', variable: 'CHAT_ID')]) {

        response = httpRequest (consoleLogResponseBody: true,
                contentType: 'APPLICATION_JSON',
                httpMode: 'GET',
                url: "https://api.telegram.org/bot$TOKEN/sendMessage?text=$encodedMessage&chat_id=$CHAT_ID&disable_web_page_preview=true",
                validResponseCodes: '200')
        return response
    }
}

