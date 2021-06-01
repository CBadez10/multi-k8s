docker build -t cbadez10/multi-client:latest -f ./client/Dockerfile ./client
docker build -t cbadez10/multi-server:latest -f ./server/Dockerfile ./server
docker build -t cbadez10/multi-worker:latest -f ./worker/Dockerfile ./worker

docker push cbadez10/multi-client:latest
docker push cbadez10/multi-server:latest
docker push cbadez10/multi-worker:latest

docker push cbadez10/multi-client
docker push cbadez10/multi-server
docker push cbadez10/multi-worker

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=cbadez10/multi-client
kubectl set image deployments/server-deployment server=cbadez10/multi-server
kubectl set image deployments/worker-deployment worker=cbadez10/multi-worker
