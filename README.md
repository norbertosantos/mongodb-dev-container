# CRIANDO UM AMBIENTE LOCAL PARA RODAR BANCOS MONGO DB:

## Passos para criar a sua imagem e rodar um container a partir da imagem criada:

**1-** Indique a versão do Mongo Db que você deseja rodar suas instâncias. Ex: 4.4.3

**2-** Para garantir que você não perca os dados dos seus bancos Mongo Db. Recomenda-se a criação de um volume através do seguinte comando:

```docker
docker volume create <nome_volume>

```
**3-** Na documentação da imagem oficial do mongo no Docker Hub. É necessário informarmos duas variáveis de ambiente:

**MONGO_INITDB_ROOT_USERNAME**
**MONGO_INITDB_ROOT_PASSWORD**

[Documentação da imagem do mongo no Docker Hub](https://hub.docker.com/_/mongo)

**4-** O Mongo Db, por padrão, executa na porta 27017. Ao criar o seu container é importante passar o parâmetro **-p 27017:27017** a fim de realizar o port binding para que seja possível acessar o container do mongodb através da porta 27017.

**5-** Criar a sua imagem a partir do Dockerfile:

```docker
docker image build -t <nome_repositorio>/mongodb:4.4.3 .

```

**6-** Exportar a sua imagem para o Docker Registry(Docker Hub).

```docker
docker login
docker push <nome_repositorio>/mongodb:4.4.3

```
**7- Boa Prática:** Após fazer a exportação da sua imagem. Sempre devemos gerar uma imagem latest da nossa imagem.

```docker
docker tag <nome_repositorio>/mongodb:4.4.3 <nome_repositorio>/mongodb:latest
docker push <nome_repositorio>/mongodb:latest
```

**8 -** Como rodar um container a partir da nossa imagem criada:

```docker
docker container run -d -p 27017:27017 --name mongodb-dev <nome_repositorio>/mongodb:4.4.3
```
**Obs: Usuários de Mac Osx e Windows recomenda-se fazer -p(port binding) para que seja possível o acesso usando localhost:27017**

