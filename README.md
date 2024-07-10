# Jupyter-Enviroment
Baue deine eigene Jupyter-Umgebung mit inklusive postgres-DB, mongo-DB & neo4j-DB per Docker-Compose auf.
- Jupyter-Token=123

## Build-Images
 Naviergiere dich in das root Verzechniss des Repositorys und baue den image per Docker mit
 - docker-compose build

## Instanziere Container
Navigiere dich ins root Verzeichnis des Repos und instanziere den Container durch
- docker-compose up -d

Die Jupyter-Umgebung ist nun lokal gehostet und erreichbar durch:
- localhost:8888

## Datenbanken
Können erreicht werden durch:

### Postgres

```python
from sqlalchemy import create_engine

db_user = 'pat'
db_password = 'pat1'
db_host = 'postgres'  # Name des Containers im Docker Compose Netzwerk
db_port = '5432'
db_name = 'post_db'

engine = create_engine(f'postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}')
engine.connect() # Teste Connection
```

### MongoDB
```python
from pymongo import MongoClient

client = MongoClient('mongodb://pat:pat1@mongodb:27017/')
client.server_info() # Teste Connection
```

### neo4j
```python
from neo4j import GraphDatabase

uri = "bolt://neo4j:7687"
user = "neo4j"
password = "pat1pat1"

driver = GraphDatabase.driver(uri, auth=(user, password))

driver.session().run("RETURN 1 AS number") # Teste Connection
```
