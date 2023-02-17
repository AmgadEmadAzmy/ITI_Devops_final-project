# ITI_Devops_final-project
create a cluster and deploy jenkins and deploy a app in it in gcp

Deploy an application on GKE using CI/CD Jenkins Pipeline using the following steps and high-level diagram:


1- Implement a secure GKE Cluster

2- Deploy and configure Jenkins on GKE

3- Deploy the backend application on GKE using the Jenkins pipeline

============================================================================================================

first: Infrastructure Overview

1- Network Files Consist of :

- Two subnets one for GKE and another for Bastion Host   - NAT Gateway    - Firewall to allow SSH Connection

2- GKE Files Consist of:

-  private container cluster resource with authorized networks configuration   - node pool with count 1 


3- Bastion File: 

 - for Creating a Private VM to Connect with GKE Cluster
 
 ============================================================================================================
 
 Second : Build the Infrastructure
 
 -using terraform code in repo 
 
 -Initialize Terraform use 
 
    terraform init
    
 -Check Plan
 
   terraform plan
   
 -Apply the plan
 
   terraform apply
   
=============================================================================================================

Third : Connect to Private GKE Cluster through Bastion VM


![Screenshot from 2023-02-14 11-43-44](https://user-images.githubusercontent.com/119006761/218698339-3079cfec-d152-4793-bd88-6cb4abfe0388.png)




 from the GCP console then VM instances and click the SSH to private-vm2 to run these commands:
 
 1- Install Kubectl
 
   - sudo apt-get install kubectl
   
 2-  Install GKE gcloud auth Plugin
 
   - sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
   
 3- Log in with your Credentials
 
   - gcloud auth login
   
 4-  Set your active Application Default Credentials
 
   - gcloud auth application-default login
   
 ==================================================================================================================
 4th Connect to GKE Cluster:
 
 
 ![Screenshot from 2023-02-14 11-50-16](https://user-images.githubusercontent.com/119006761/218700034-76229083-abd7-431c-a0b9-f3db22de0141.png)


 Click on the Action button "Three dots" then Connect, Copy the command and paste it into the VM SSH window
 
 like:
 
 gcloud container clusters get-credentials private-cluster --zone us-central1-a --project <Your-Project-ID>
 
 ===================================================================================================================
 
 4th- You Can Deploy jenkins on GKE Cluster
 
  - using deploy jenkins code in repo you will run this Commands :
 
  
 
     -kubectl create -f jenkinsdeployment.yaml -n jenkins
 
     -kubectl get deployments -n jenkins
 
     -kubectl create -f jenkinsservice.yaml -n jenkins
 
     -kubectl get pods -n jenkins
 
  -------------------------------------------------------------------------------------------------------------------
 
 
  to get a EXTERNAL-IP 
 
  -kubectl get services -n jenkins
 
  -------------------------------------------------------------------------------------------------------------------   
 
   - to get password to configure jenkins you will run this commands:
   
     -kubectl exec -it " name-of-pod " bash -n jenkins
     
     and cat the pass.
     

- this URL for jenkins on my cluster
 
 
 
  ![Screenshot from 2023-02-17 19-12-32](https://user-images.githubusercontent.com/119006761/219719386-d34505ab-8e3b-457e-b29a-95346239deba.png)

 
 
 
 
 
 http://34.27.229.240:8080/


       
   ======================================================================================================================
 - 6th Part: Build CI/CD Pipeline using Jenkins (click on the next link )
 
 
 
 https://github.com/AmgadEmadAzmy/nodejs-app
 
 
 =======================================================================================================================
 1- Jenkins will:
 
 Build an image from Dockerfile
 
Push the image to DockerHub
 
Apply deployment for the app based on the image
 
Apply LoadBalancer service for the app
 
 
 2- Add Credentials in Jenkins
 
![image](https://user-images.githubusercontent.com/119006761/219725145-6bf3bb00-a15d-4334-9f5c-1616003e012c.png)

 
 3- Create CI-CD Pipeline:
 
 Pull Code from GitHub
 
 Build the Application image using Docker
 
 Push Image to DockerHub
 
 Trigger CD Pipeline to Run
 
 Deploy our Application in GKE
 
![Screenshot from 2023-02-17 19-28-05](https://user-images.githubusercontent.com/119006761/219723853-76452e2e-1e48-43d3-b573-3c4642d5fe19.png)

 
 
 you can ckeck link
 
 http://34.29.118.78:3000/
 

 
 



 
 
 
 

 
 
 
 
       
     
    
 
 
 
