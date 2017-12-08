# ml-template

Docker template for machine learning.

## Usage

Set password of Jupyter Notebook to environment variable.

```
export JUPYTER_NOTEBOOK_PASSWORD="your_password"
```

Start up docker container with Jupyter Notebook password.

```
docker-compose build
docker-compose up -d
```

Access the following URL.

http://localhost:8888
