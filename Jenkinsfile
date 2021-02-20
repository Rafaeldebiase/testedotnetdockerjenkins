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
        stage('Parallel') {
            parallel {
                stage('Deploy to development') {
                    agent {
                        dockerfile true
                        args 'production'
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
                        args 'production'
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
                        beforeInput true
                        branch 'production'
                    }
                    input {
                        message "Deploy to production?"
                        id "simple-input"
                    }
                    steps {
                        echo 'deploy para prod'
                    }
                }
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

