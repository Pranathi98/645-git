##Task 1: Initial Setup  
- Upload the source code to the github repository.

##Task 2: Creating Docker Image. 
- Follow the instructions in the PDF to generate the docker image.  
- And push it to dockerhub  

##Task 3: Rancher Installtion  
- Create 3 instance in AWS  
- 2 for rancher, worker and 1 for jenkins  
- Install docker in it  
- Run rancher on it  

##Task 4: Add cluster and Deploy  
- Add cluster and create 2 deployments - Nodeport  
- Get the kube config file and save it  
- When you run the nodeport hyperlink in the services tab you should be able to see the survey page  

##Task 5: Jenkins install and setup  
- Run jenkins on the AWS ec2 instance and then install jenkins  
- Add the kube config file from the rancher which we had downloaded  
- Login to the jenkins configure the necessary changes  
- Add all the plugins, credentials  
- Post the creation of the pipeline we can test by updating the file in the guithub and it will reflect in our website.
