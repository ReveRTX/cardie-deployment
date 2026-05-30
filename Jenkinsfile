pipeline {
    agent none

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION = 'ap-south-1'
    }

    stages {
        stage ('Terraform Initialize') {
            agent { label 'master-agent' }
            steps {
                sh 'cd terraform && terraform init'
            }
        }

        stage ('Terraform Plan') {
            agent { label 'master-agent' }
            steps {
                sh 'terraform plan'
            }
        }

        stage ('Terraform Apply') {
            agent { label 'master-agent' }
            steps {
                sh 'terraform apply -auto-approve'
            }
        }

        stage ('Wait for 3 mins') {
            agent { label 'master-agent' }
            steps {
                sh 'sleep 180'
            }
        }
    }
}