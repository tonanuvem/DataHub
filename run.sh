echo "Instalando o DataHub"
# Atualizando a versão do docker compose v2

echo "   pre-req: Docker compose"
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.33.0/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

echo ""
echo ""
echo "   instalando DataHub via pip:"
python3 -m pip install --upgrade pip wheel setuptools
python3 -m pip install --upgrade acryl-datahub

echo ""
echo "   verificando versão do DataHub :"
datahub version

echo ""
echo "   executando DataHub :"
datahub docker quickstart

echo ""
echo "Aguardando a configuração."
#while [ "$(docker logs airflow 2>&1 | grep "Login with username: admin" | wc -l)" != "1" ]; do
#  printf "."
#  sleep 1
#done

# datahub docker ingest-sample-data
#docker exec -ti 

echo ""
echo ""
echo "Config OK"
IP=$(curl -s checkip.amazonaws.com)
echo ""
echo "URLs do projeto:"
echo ""
echo " - DATAHUB        : http://$IP:9002   (login = datahub, password = datahub)"
