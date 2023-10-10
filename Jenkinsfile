pipeline {
    environment {
        registry = "pranathi2207/swe645-ast1-image-new"
        registryCredential = 'b4fdf1c1-14e9-405a-928c-8bf51e66d927'
        TIMESTAMP = new Date().format("yyyyMMdd_HHmmss")
    }
    agent any

    stages {
        stage('Build survey page') {
            steps {
                script {
                    sh 'rm -rf *.war'
                    sh 'jar -cvf SWE645-Ast1.war -C src/main/webapp/ .'
                    sh 'echo ${BUILD_TIMESTAMP}'

                    docker.withRegistry('', registryCredential) {
                        def customImage = docker.build("pranathi2207/swe645-ast1-image-new:${env.TIMESTAMP}")
                    }

                    // Log in to Docker Hub using credentials
                    docker.withRegistry('https://index.docker.io/v1/', 'DOCKERHUB_PASS') {
                        // Push the Docker image
                        sh "docker push pranathi2207/swe645-ast1-image-new:${env.TIMESTAMP}"
                    }
                }
            }
        }

        stage('Deploying Rancher to single node') {
            steps {
                script {
                    sh "kubectl set image deployment/deploymain container-0=pranathi2207/swe645-ast1-image-new:${env.TIMESTAMP}"
                }
            }
        }

        stage('Deploying Rancher to Load Balancer') {
            steps {
                script {
                    sh "kubectl set image deployment/deploylb container-0=pranathi2207/swe645-ast1-image-new:${env.TIMESTAMP}"
                }
            }
        }
    }
}
