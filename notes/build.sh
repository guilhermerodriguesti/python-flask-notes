docker build -t notesapp:0.1 .
docker run --rm -it -v $PWD:/app notesapp:0.1 bash

flask db init
flask db migrate
flask db upgrade

docker run --rm -it -p 80:80 notesapp:0.1

# vim .env
# export FLASK_ENV='development'


docker build -t notesapp:0.2 .

docker run --rm -it -p 80:80 notesapp:0.2

docker build -t notesapp:0.3 .

docker run -d --name notesapp -p 80:80 notesapp:0.3