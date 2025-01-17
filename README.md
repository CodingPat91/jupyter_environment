# Jupyter-Enviroment
Baue deine eigene Jupyter-Umgebung  inklusive postgres-DB, mongo-DB & neo4j-DB per Docker-Compose auf.
- Jupyter-Token=123

## Build-Images
 Naviergiere dich in das root Verzeichnis des Repositorys und baue das Image per Docker mit:
 ```sh
docker-compose build
```

## Instanziiere Container
Navigiere dich ins root Verzeichnis des Repos und instanziiere den Container durch:
```sh
docker-compose up -d
```
Nach der Instanziierung findest du die Ordner der Datenbanken als Bind-Mounts im root-Verzeichnis des Repos:
```jupyter_environment/
├── mongodb_data/
├── neo4j_data/
└── postgres_data
```

Die Jupyter-Umgebung ist nun lokal gehostet und erreichbar im Browser durch:
- `localhost:8888`

## Datenbanken
Verbindung der Datenbanken können wie folgt hergestellt und getestet werden:

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
Im Browser erreichst du die graphische Oberfläche inklusive Tutorial der neo4j-Graphdb durch: 
- `localhost:7474`
