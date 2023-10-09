pipeline {
    environment {
        registry = "pranathi2207/swe645-ast1-image-new"
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
                            def customImage = docker.build("pranathi2207/swe645-ast1-image-new:${env.TIMESTAMP}")
                        }



//                         sh "docker login -u Nagasumukh -p ${DOCKERHUB_PASS}"
//                         def customImage = docker.build("pranathi2207/swe645-ast1-image-new:${env.TIMESTAMP}")

                   }
                }
            }

            stage('Push to Docker Hub') {
                steps {
                    script {
                        docker.withRegistry('',registryCredential){
                          sh "docker push pranathi2207/swe645-ast1-image-new:${env.TIMESTAMP}"
                       }
//                         sh 'docker push pranathi2207/swe645-ast1-image-new:${env.TIMESTAMP}'
                    }
                }
            }

          stage('Deploying Rancher to single node') {
             steps {
                script{
                    sh "kubectl set image deployment/deploymain container-0=pranathi2207/swe645-ast1-image-new:${env.TIMESTAMP}"
//                    sh 'kubectl set image deployment/deploymain container-0=pranathi2207/swe645-ast1-image-new:${env.TIMESTAMP}'
                }
             }
          }

        stage('Deploying Rancher to Load Balancer') {
           steps {
              script{
                  sh "kubectl set image deployment/deploylb container-0=pranathi2207/swe645-ast1-image-new:${env.TIMESTAMP}"
//                  sh 'kubectl set image deployment/deploylb container-0=pranathi2207/swe645-ast1-image-new:${env.TIMESTAMP}'
              }
           }
        }
    }
}
