pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('RAM_ACCESS_KEY')
        AWS_SECRET_ACCESS_KEY = credentials('RAM_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-2"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    sh "terraform init"
                    sh "terraform plan"
                    sh "terraform apply -auto-approve"
                }
            }
        }
       
    }
}
