pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        ECR_REPO = 'public.ecr.aws/d8u9f9b9/java-ecr-demo' // replace with your ECR URI
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo "Cloning or using local code..."
                git branch: 'main', url: 'https://github.com/bhargavpr99-sudo/java-ecr-demo.git'
                // or comment above and use local code:
                // sh 'ls -la'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t java-ecr-demo:latest .'
                }
            }
        }

        stage('Tag Docker Image') {
            steps {
                script {
                    sh '''
                      docker tag java-ecr-demo:latest $ECR_REPO:$IMAGE_TAG
                      docker tag java-ecr-demo:latest $ECR_REPO:latest
                    '''
                }
            }
        }

        stage('Login to AWS ECR Public') {
            steps {
                script {
                    sh '''
                      aws ecr-public get-login-password --region $AWS_REGION \
                      | docker login -u AWS --password-stdin public.ecr.aws
                    '''
                }
            }
        }

        stage('Push Image to ECR') {
            steps {
                script {
                    sh '''
                      docker push $ECR_REPO:$IMAGE_TAG
                      docker push $ECR_REPO:latest
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "✅ Java image successfully pushed to AWS ECR Public!"
        }
        failure {
            echo "❌ Pipeline failed. Check logs."
        }
    }
}
