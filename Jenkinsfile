pipeline {
    agent { label 'nopcom' }
    stages{
        stage('scm') {
            steps {
                git url:  ,branch:
            }
        }
        stage('build image') {
            steps {
                sh 'docker image build -t nopcom:2.0 .'
                sh 'docker image tag nopcom:2.0 nagarjunaduggireddy/nopcom:2.0'
                sh 'docker push nagarjunaduggireddy/nopcom:2.0'
            }
        }
        stage('deployment ') {
            agent { label 'nopcomdeploy' }
            steps {
                sh 'kubectl apply -f secret.yml'
                sh 'kubectl apply -f nopcomservicefile.yaml'
                sh 'kubectl apply -f sqldb.yml'
                sh 'kubectl apply -f deploynopcom.yaml'

            }
        }

    }
}