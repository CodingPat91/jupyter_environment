FROM jupyter/scipy-notebook
# -it iterative 
# Entr

COPY requirements.txt /home/jovyan/

WORKDIR /home/jovyan/

RUN pip install --no-cache-dir -r requirements.txt

# Entrypoint wird beim start Containers asugeführt, Run beim Build 
# welches Base Images liegt hier drunter
# docker run --rm -it --entrypoint /bin/bash jupyter-jupyter 

# Orcale DB (Express)
# Installiere UNIX-ODBC in Jupyter
# Orcale Instant-Client

# Orcale DB python nutze thick-mode
# Vllt. mal Bash anschauen 