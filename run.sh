

echo "back container"
docker run -d --net back-net --name doh doh-server 

echo "connect to its own network"
docker network connect middle-net doh

docker run -d --net middle-net -p 4443:443 --name nginx-doh nginx-confed 

echo "its own middle-net network"
docker run --net back-net -it --name dns-local ronyking/dnscombackup bash 
