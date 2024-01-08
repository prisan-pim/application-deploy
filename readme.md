# How To Deploy Application


## CICD Deploy Application
## 1.1 Build Application By Dockerfile

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

## 1.2 Build Dockerfile by Github Action Pipeline
- Config Env use on Action
![image description](/image/20.png)


- Github Queue Run
![image description](/image/22.png)

- Github Build Dockerfile by Action 
![image description](/image/23.png)

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


## 2. Create S3 And SQS (Amazon Simple Queue Service) for AWS By Terraform

- go to folder Service
```
cd service-aws
```

- Install Terraform Lib
- 
```
terraform init
``` 
![image description](/image/9.png)


- RUN Terraform create S3 And SQS
```
terraform plan
terraform apply

```
![image description](/image/10.png)

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

kubectl port-forward svc/argocd-server -n argocd 8080:443   

kubectl create namespace application (for deploy application on namespace)

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

- Check Pods On EKS
![image description](/image/21.png)

# Deploy Ingress 
- install ingress by Helm
```
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx --namespace kube-system
```

- Apply ingress
```
kubectl apply -f ingress.yaml
```





