IMAGE_NAME=lapierre/jenkins
IMAGE_VERSION=lts

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_VERSION) .
push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
run:
	docker run -d -p 9001:8080 -p 50000:50000 -e TZ=Europe/Warsaw -v /var/run/docker.sock:/var/run/docker.sock -v ${PWD}/jenkins_home:/var/jenkins_home --name jenkins $(IMAGE_NAME):$(IMAGE_VERSION)
