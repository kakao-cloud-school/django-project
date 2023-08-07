# django-mysql-nginx-docker
Django 3.0 + Mysql 8 + Nginx + Docker. 

## Documentation ##

### Directory Tree ###
```
.
├── Dockerfile
├── LICENSE
├── Makefile
├── README.md
├── config
│   ├── letsencrypt
│   ├── nginx
│   │   └── django_project.conf
│   ├── nginx-dev
│   │   └── django_project.conf
│   └── requirements.txt
├── docker-compose.yml
├── docker-production.yml
├── scripts
│   ├── command-dev.sh
│   └── wait-for-it.sh
└── src
    ├── __init__.py
    ├── album
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations
    │   ├── models.py
    │   ├── tests.py
    │   ├── urls.py
    │   └── views.py
    ├── board
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations
    │   ├── models.py
    │   ├── tests.py
    │   ├── urls.py
    │   └── views.py
    ├── django_project
    │   ├── __init__.py
    │   ├── settings
    │   ├── static
    │   ├── urls.py
    │   └── wsgi.py
    ├── main
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── fixtures
    │   ├── migrations
    │   ├── models.py
    │   ├── tests.py
    │   ├── urls.py
    │   └── views.py
    ├── manage.py
    ├── media
    │   └── Readme.md
    ├── static
    │   ├── _images
    │   ├── assets
    │   ├── board
    │   └── forms
    └── templates
```

### How to install the template ###

Clone the repository, and update your origin url: 
```
git clone https://github.com/sod723/django-docker.git
cd django_project
```

Rename your project files and directorys:
```
make name=django_project init
```
> Info: Make is required, for mac run `brew install make`

The command before will remove the `.git` folder so you will have to initialize git:
```
git init
git remote add origin <repository-url>
```

### How to run the project ###

The project use docker, so just run:

`docker-compose up`

> If it's first time, the images will be created. Sometimes the project doesn't run at first time because the init of mysql, just run again `docker-compose up` and it will work.

*Your app will run in url `localhost:8000` (The nginx port because it behaves as a proxy for the Django port 8080)*

## Production Deployment: ##

To deploy use `docker swarm` and `docker stack`.

To init a swarm use:
```
docker swarm init --advertise-addr=<ip_address>
```

Create the docker secrets:
```
echo "<secret>" | docker secret create <secret_name> -
```

Current secrets are:

* django_secret_key
* mysql_user
* mysql_password
* email_password

Initialize your app with the command:
```
docker stack deploy -c docker-production.yml --with-registry-auth bb404
```
