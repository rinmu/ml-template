# ml-template

Docker template for machine learning.

## Usage

Start up docker container.

```
docker-compose build
docker-compose up -d
```

Start ipython and generate hash value of password with the following command.

```
docker-compose exec ml-container ipython
In [1]: from notebook.auth import passwd
In [2]: passwd()
Enter password:
Verify password:
Out[2]: 'sha1:xxxxx...'
```

Copy `'sha1:xxxxx...'`, And append to
`/root/.jupyter/jupyter_notebook_config.py` with the following command.

```
docker-compose exec ml-container bash
echo "c.NotebookApp.password = 'sha1:xxxxx...'" >> /root/.jupyter/jupyter_notebook_config.py
```

Restart container.

```
docker-compose stop
docker-compose start
```

Access the following URL.

http://localhost:8888
