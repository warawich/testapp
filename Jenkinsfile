node {
    stage('Checkout'){
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '1', url: 'https://github.com/warawich/testapp.git']]])
    }
    stage('Build Docker Image'){   
        sh 'docker build -t wichtrue/testapp .'
    }
    stage('Push to Docker Hub'){
        withCredentials([usernamePassword(credentialsId: '1c0dfc4c-e520-4aeb-86a0-fefb90612fe9', passwordVariable: 'Dockerpass', usernameVariable: 'Dockeruser')]) {
             sh "docker login -u ${Dockeruser} -p ${Dockerpass}"
        }
       
        sh "docker tag wichtrue/testapp wichtrue/testapp:$BUILD_NUMBER"
        sh "docker push wichtrue/testapp:$BUILD_NUMBER"
    }
    stage('Deploy Container on Test Server'){
        def cmd = 'docker run -it -d --restart unless-stopped -p 8000:8081 --name testapp wichtrue/testapp:$BUILD_NUMBER'
        def rmcmd = 'docker rm -f testapp'
        def rmicmd = 'docker rmi -f wichtrue/testapp:'
        try{
            sh "ssh root@192.168.1.28 ${rmcmd}" 
        }catch(Exception e){
            echo "Can not remove docker testapp" 
        }
        sh "ssh root@192.168.1.28 ${cmd}" 
        
    }
   
}
