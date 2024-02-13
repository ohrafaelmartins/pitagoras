# Pré-requisitos:
- Conta AWS
- Criar: AWS_SECRET_ACCESS_KEY e AWS_ACCESS_KEY_ID
- Docker
- Git


# 1 - clonar esse repo
# 2 - Criar o ambiente utilizando Terraform
`docker run --rm -it -v $PWD:/app --entrypoint "" -w /app hashicorp/terraform:light sh`

`export AWS_SECRET_ACCESS_KEY=""`

`export AWS_ACCESS_KEY_ID=""`

`terraform init`

`terraform plan -out plan`

`terraform apply "plan"`


# 3 - Instalar docker e rodar nginx

`sudo apt update -y`

`sudo apt install docker.io -y`

`sudo docker run -d --name nginx -p 80:80 -p 443:443 nginx`

# 4 - Extrair o log em um arquivo

`sudo docker logs nginx >> nginx-logs`

# 5 - Enviar o log para o bucket S3 (criado via Terraform)
`sudo docker run --rm -it \
  --env AWS_SECRET_ACCESS_KEY="AWS_SECRET_ACCESS_KEY" \
  --env AWS_ACCESS_KEY_ID="AWS_ACCESS_KEY_ID" \
  -v $PWD:/app \
  -w /app amazon/aws-cli \
  s3 cp nginx-logs s3://pitagoras-desafio-bucket/nginx-logs`

### Descrição do Código

Este código usa o Terraform, uma ferramenta de automação de infraestrutura, para configurar recursos na Amazon Web Services (AWS). 

1. **Backend S3:**
   - Armazena o estado da infraestrutura em um bucket S3, que é como o Terraform controla e gerencia os recursos criados.
   - O bucket é chamado "rafaelmartinsdescomplicandoterraform" e o arquivo de estado é "terraform-test.tfstate".
   - Esses arquivos são armazenados na região "sa-east-1" (São Paulo) da AWS.

2. **Provedor AWS:**
   - Configura o Terraform para usar a região "sa-east-1" da AWS.


### Configuração de Servidor na Nuvem com AWS

- **Baseado em Ubuntu:** Utiliza uma imagem do Ubuntu como base para o servidor.
- **Tipo de Instância Definido:** Define o tipo de instância a ser utilizado.
- **Configuração de Segurança da Rede:** Estabelece as regras de segurança da rede para o servidor.
- **Execução de Script durante Inicialização:** Permite a execução de um script durante a inicialização do servidor.
- **Automação do Processo:** Automatiza o processo de configuração de um servidor na nuvem.



### Criação de Bucket no Amazon S3

- **Descrição:** Este trecho de código cria um novo bucket (repositório de armazenamento) no serviço Amazon S3 (Simple Storage Service).
- **Nome do Bucket:** O nome do bucket é "pitagoras-desafio-bucket".
- **Configuração de Acesso:** A configuração de acesso é definida como "private" (privada), o que significa que apenas o proprietário tem acesso a ele por padrão.
- **Tags:** São atribuídas tags ao bucket para fins de identificação e organização, sendo que uma delas é "Name" com o valor "pitagoras-desafio-bucket".
- **Resumo:** Em resumo, esse código cria um bucket privado no Amazon S3 com o nome especificado e tags adicionais para identificação.


### aws_security_group "allow-ssh"
- Permite o tráfego SSH (Secure Shell), comumente usado para acesso remoto.
- Abre a porta 22 para conexões TCP de qualquer endereço IP.
- Permite todo o tráfego de saída.

### aws_security_group "allow-http"
- Permite o tráfego HTTP, usado para acessar sites na web.
- Abre a porta 80 para conexões TCP de qualquer endereço IP.
- Permite todo o tráfego de saída.

### aws_security_group "allow-https"
- Permite o tráfego HTTPS, a versão segura do HTTP.
- Abre a porta 443 para conexões TCP de qualquer endereço IP.
- Permite todo o tráfego de saída.

