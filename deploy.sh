docker build -t cbadez10/multi-client:latest -t cbadez10/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t cbadez10/multi-server:latest -t cbadez10/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t cbadez10/multi-worker:latest -t cbadez10/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push cbadez10/multi-client:latest
docker push cbadez10/multi-server:latest
docker push cbadez10/multi-worker:latest

docker push cbadez10/multi-client:$GIT_SHA
docker push cbadez10/multi-server:$GIT_SHA
docker push cbadez10/multi-worker:$GIT_SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=cbadez10/multi-client:$GIT_SHA
kubectl set image deployments/server-deployment server=cbadez10/multi-server:$GIT_SHA
kubectl set image deployments/worker-deployment worker=cbadez10/multi-worker:$GIT_SHA
