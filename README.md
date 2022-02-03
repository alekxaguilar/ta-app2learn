# Web app to practice test automation

By using the following application **OpenCart** we are going to simulate an e-commerce app having control over what we can create, delete, and modify products through the application with the main purpose to learn and practice test automation.

## Setup environment

Change information from  **.env** file and use your own passwords

### MySQL
```
MYSQL_ROOT_PASSWORD=<change_me>
MYSQL_DATABASE=opencartdb
MYSQL_USER=opencart
MYSQL_PASSWORD=<change_me>
```
### Docker build and run

```
docker-compose up -d 
```
Open following url and complete store setup.

http://localhost:8080