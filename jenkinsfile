pipeline {
    agent any

    environment {
        DEPLOY_PATH = '/root/app'
    }

    stages {
        stage('Deploy') {
            steps {
                withCredentials([sshUserPrivateKey(
                    credentialsId: 'ssh-key',
                    keyFileVariable: 'SSH_KEY',
                    usernameVariable: 'SSH_USER'
                )]) {
                    sh """
                        ssh -o StrictHostKeyChecking=no -i \${SSH_KEY} \${SSH_USER}@207.148.71.96 '
                            cd \${DEPLOY_PATH} &&
                            docker pull znic/todo-backend:latest &&
                            docker pull znic/todo-frontend:latest &&
                            docker-compose up -d --remove-orphans
                        '
                    """
                }
            }
        }
    }

    post {
        success { echo '✅ Deploy thành công!' }
        failure { echo '❌ Deploy thất bại!' }
    }
}