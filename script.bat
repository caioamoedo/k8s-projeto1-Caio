echo "Criando as imagens..."

docker build -t caioamoedo/projeto-backend:1.0 backend/.
docker build -t caioamoedo/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push caioamoedo/projeto-backend:1.0
docker push caioamoedo/projeto-database:1.0

echo "Criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Realizando os deployments..."

kubectl apply -f ./deployments.yml

