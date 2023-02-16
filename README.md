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
 
 4th Deploy jenkins on GKE Cluster
 
  - using deploy jenkins code in repo you will run this Commands :
 
  
     -kubectl create namespace jenkins
 
     -kubectl get namespaces
 
     -kubectl create -f jenkinsdeployment.yaml -n jenkins
 
     -kubectl get deployments -n jenkins
 
     -kubectl create -f jenkinsservice.yaml -n jenkins
 
     -kubectl get pods -n jenkins
 
  -------------------------------------------------------------------------------------------------------------------
 
 
  to get a EXTERNAL-IP 
 
  -kubectl get services -n jenkins
 
  
  ![Screenshot from 2023-02-14 12-09-54](https://user-images.githubusercontent.com/119006761/218705065-553fb5be-baf8-4266-996f-35054d7c929f.png)

  -------------------------------------------------------------------------------------------------------------------   
 
   - to get password to configure jenkins you will run this commands:
   
     -kubectl exec -it <name-of-pod> bash -n jenkins
     
     and cat the pass.
     

- this URL for jenkins on my cluster


       http://34.172.152.171:8080/
       
   ======================================================================================================================
 - 6th Part: Build CI/CD Pipeline using Jenkins
       
     
    
 
 
 
