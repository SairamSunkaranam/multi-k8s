docker build -t sairamsun/multi-client:latest -t sairamsun/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t sairamsun/multi-server:latest -t sairamsun/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t sairamsun/multi-worker:latest -t sairamsun/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push sairamsun/multi-client:latest
docker push sairamsun/multi-server:latest
docker push sairamsun/multi-worker:latest

docker push sairamsun/multi-client:$SHA
docker push sairamsun/multi-server:$SHA
docker push sairamsun/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=sairamsun/multi-server:$SHA
kubectl set image deployments/client-deployment client=sairamsun/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=sairamsun/multi-worker:$SHA
