pipeline {
    environment {
        registry = "pranathi2207/swe645-ast1-app"
        registryCredential = 'Dockerhub'
        DOCKERHUB_PASS = credentials('Dockerhub')
        TIMESTAMP = new Date().format("yyyyMMdd_HHmmss")
    }
    agent any

    stages{

            stage('Build survey page') {
                steps {
                    script {
                        sh 'rm -rf *.war'
                        sh 'jar -cvf SWE645-Ast1.war -C src/main/webapp/ .'
                        sh 'echo ${BUILD_TIMESTAMP}'

                        docker.withRegistry('',registryCredential){
                            def customImage = docker.build("pranathi2207/swe645-ast1-app:${env.TIMESTAMP}")
                        }



//                         sh "docker login -u pranathi2207 -p ${DOCKERHUB_PASS}"
//                         def customImage = docker.build("pranathi2207/swe645-ast1-app:${env.TIMESTAMP}")

                   }
                }
            }

            stage('Push to Docker Hub') {
                steps {
                    script {
                        docker.withRegistry('',registryCredential){
                          sh "docker push pranathi2207/swe645-ast1-app:${env.TIMESTAMP}"
                       }
//                         sh 'docker push pranathi2207/swe645-ast1-app:${env.TIMESTAMP}'
                    }
                }
            }

          stage('Deploying Rancher to single node') {
             steps {
                script{
                    sh "kubectl set image deployment/hw2-nd container-0=pranathi2207/swe645-ast1-app:${env.TIMESTAMP}"
//                    sh 'kubectl set image deployment/hw2-nd container-0=pranathi2207/swe645-ast1-app:${env.TIMESTAMP}'
                }
             }
          }

        stage('Deploying Rancher to Load Balancer') {
           steps {
              script{
                  sh "kubectl set image deployment/hw2-nd container-0=pranathi2207/swe645-ast1-app:${env.TIMESTAMP}"
//                  sh 'kubectl set image deployment/hw2-nd container-0=pranathi2207/swe645-ast1-app:${env.TIMESTAMP}'
              }
           }
        }
    stage('Deploy YAML Files') {
        steps {
        // Set the KUBECONFIG environment variable to your kubeconfig file path
            env.KUBECONFIG = "/home/ubuntu/kubeconfig.yaml"
        
        // Deploy YAML files using kubectl apply
            sh 'kubectl apply -f /home/ubuntu/yaml-files'
    }
}

    }
}
