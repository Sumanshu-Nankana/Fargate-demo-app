Fargate - Does NOT comes under the Free Tier. Here is the Pricing - https://aws.amazon.com/fargate/pricing/

ECR - Comes under the Free Tier for 1 month - https://aws.amazon.com/ecr/?did=ft_card&trk=ft_card


aws ecs execute-command --region eu-west-1 --cluster fargate-demo --task {task number} --container {container-name} --command "/bin/bash" --interactive


conda create --name fargatedemo python=3.9
conda activate fargatedemo

docker build . -t fargatedemo
docker run -d -p 5000:5000 fargatedemo

Open AWS --> Open ECR --> Private (Give some name example fargatedemo)

docker tag fargatedemo:latest 681690797466.dkr.ecr.eu-west-1.amazonaws.com/fargatedemo
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 681690797466.dkr.ecr.eu-west-1.amazonaws.com
docker push 681690797466.dkr.ecr.eu-west-1.amazonaws.com/fargatedemo:latest


https://devcoops.com/aws-ecs-ssh-into-fargate-container/
https://towardsdatascience.com/deploying-a-docker-container-with-ecs-and-fargate-7b0cbc9cd608