pipeline {
    agent { label 'nopcom' }
    stages{
        stage('scm') {
            steps {
                git url:'https://github.com/nagarjuna33/test.git', branch: 'master'
            }
        }
        stage('build image') {
            steps {
                sh
                 """
                 'docker image build -t nopcom:2.0 .'
                 'docker image tag nopcom:2.0 nagarjunaduggireddy/nopcom:2.0'
                 'docker push nagarjunaduggireddy/nopcom:2.0'
                 """
            }
        }
        stage('deployment ') {
            agent { label 'nopcomdeploy' }
            steps {
                sh 
                   """"
                   'kubectl apply -f secret.yml'
                   'kubectl apply -f nopcomservicefile.yaml'
                   'kubectl apply -f sqldb.yml'
                   'kubectl apply -f deploynopcom.yaml'
                  """"
            }
        }

    }
}