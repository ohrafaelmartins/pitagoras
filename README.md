sudo apt update -y

sudo apt install docker.io -y

sudo docker run -d --name nginx -p 80:80 -p 443:443 nginx

sudo docker logs nginx >> nginx-logs


sudo docker run --rm -it \
  --env AWS_SECRET_ACCESS_KEY="AWS_SECRET_ACCESS_KEY" \
  --env AWS_ACCESS_KEY_ID="AWS_ACCESS_KEY_ID" \
  -v $PWD:/app \
  -w /app amazon/aws-cli \
  s3 cp nginx-logs s3://pitagoras-desafio-bucket/nginx-logs
