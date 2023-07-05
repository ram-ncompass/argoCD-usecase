pipeline {
    agent any
    stages {
        stage('Cloning yaml Git repo') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ram-ncompass/argoCD-usecase.git']])
            }
        }
        stage("Create an EKS Cluster") {
            steps {
                script {
                    sh "terraform init"
                    sh "terraform plan"
                    // sh "terraform apply -auto-approve"
                }
            }
        }
       
    }
}
