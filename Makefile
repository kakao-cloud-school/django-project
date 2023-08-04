init:
	test -n "$(name)"
	rm -rf ./.git
	find ./ -type f -exec perl -pi -e 's/django_project/$(name)/g' *.* {} \;
	mv src/django_project src/$(name)
	mv config/nginx/django_project.conf config/nginx/$(name).conf
	mv config/nginx-dev/django_project.conf config/nginx-dev/$(name).conf

superuser:
	docker exec -it django_project ./manage.py createsuperuser

makemigrations:
	docker exec -it django_project ./manage.py makemigrations

migrate:
	docker exec -it django_project ./manage.py migrate

initialfixture:
	docker exec -it django_project ./manage.py loaddata initial

testfixture:
	docker exec -it django_project ./manage.py loaddata test

test:
	docker exec -it django_project ./manage.py test

statics:
	docker exec -it django_project ./manage.py collectstatic --noinput
