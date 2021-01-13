HOST=leandromoraes.busercamp.com.br

function devhelp() {
  echo "dkbuild   constroi a imagem docker"
  echo "dkrun     roda o projeto dockerizado"
  echo "deploy    faz deploy do projeto"
}

function dkbuild() {
  docker build -t leandromb .
}

function dkrun() {
  docker run -it -p 8000:8000 \
    -e DATABASE_FILE=/dkdata/db.sqlite3 \
    -e DJANGO_STATIC_ROOT=/dkdata/static \
    -v $(pwd)/dkdata:/dkdata \
    leandromb start.sh
}

function deploy() {
  rsync -av --exclude dkdata --exclude db.sqlite3 \
        ./* ubuntu@$HOST:./leandromb/

  ssh ubuntu@$HOST "cd leandromb && ./dkrunprod.sh"
}

devhelp