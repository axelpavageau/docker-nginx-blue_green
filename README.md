This project builds 2 nginx images used to demonstrate blue/green deployments using containers.

The images available are :
* axelpavageau/nginx-blue:latest
* axelpavageau/nginx-green:latest

Each will display a simple HTML index with a background of the appropriate color, and will respond to curl with a JSON output :
```
docker run -d --name test-container axelpavageau/nginx-blue:test
docker exec test-container sh -c "curl localhost"
{ "color": "blue" }
```
