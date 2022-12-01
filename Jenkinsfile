pipeline {
    agent { label 'springpet' }
    //triggers { pollSCM('H * * * 1-5') }
        stages {
           stage('build') {
                steps{
                git url: 'https://github.com/nagarjuna33/test.git', branch: 'master'
            }
        }
        stage('build') {
            steps{
                sh 'docker image build -t springpet:1.0 .'
                sh 'docker container run -d --name test1 -p 8081:8080 springpet:1.0'
            }
        }
    }
}
