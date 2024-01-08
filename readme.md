# How To Deploy Application

## 1. Build Application By Dockerfile

- go to folder application
```
cd /application
```

- run command for build Dockerfile and push image to Dockerhub


```
-- for Liunx ---

./build.sh $user $pass ( ./build.sh uer123 pas123 ) 


-- for M1 ---

./build_mac.sh $user $pass ( ./build.sh uer123 pas123 ) 

```

- Build Dockerfile By Script
![image description](/image/1.png)
![image description](/image/2.png)

- Push Docker image To DockerHub 
![image description](/image/3.png)


## 2. Create EKS (AWS)  By Terraform
- Install Terraform Lib

```
terraform init
``` 
![image description](/image/4.png)


- Run Response EKS 
```
terraform plan
```
![image description](/image/5.png)

- RUN Terraform create EKS
```
terraform apply
```
![image description](/image/6.png)
![image description](/image/7.png)

- Check EKS Cluster By AWS Console
![image description](/image/8.png)


## 2. Create S3 (AWS)  By Terraform

- go to folder S3 Service
```
cd service-aws/s3
```

- Install Terraform Lib
- 
```
terraform init
``` 
![image description](/image/9.png)


- Run Response EKS 
```
terraform plan
```
![image description](/image/10.png)

- RUN Terraform create EKS
```
terraform apply
```
![image description](/image/11.png)


- Get Access Key And Secret Key Sensitive
```
terraform output -raw access_key
terraform output -raw secret_key
```
![image description](/image/12.png)


# Create ArgoCD On EKS

- Install ArgoCD On EKS
```
kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}"| base64 -d;echo

kubectl patch svc argocd-server -n argocd -p '{"spec" : {"type" : "LoadBalancer"}}'

kubectl create namespace application

```


- Config ArgoCD Project Allow
![image description](/image/13.png)

- Config ArgoCD Cluster Allow
![image description](/image/14.png)


- Config Application Deploy
![image description](/image/15.png)
![image description](/image/16.png)
![image description](/image/17.png)

- Wait Processing Deploy
![image description](/image/18.png)

- Processing Deploy Success
![image description](/image/19.png)


# Deploy Application



helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx --namespace kube-system

