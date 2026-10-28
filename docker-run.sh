IMAGE_NAME=yocto_ubuntu26_image:latest
CONTAINER_NAME=yocto_ubuntu26

docker container ls | grep $CONTAINER_NAME
if [ $? -eq 0 ]; then
	CONTAINER_NAME=$(docker container ls | grep $CONTAINER_NAME | cut -d" " -f1)
        echo "Command: docker exec -ti $CONTAINER_NAME /bin/bash"
		docker exec -ti $CONTAINER_NAME /bin/bash
		exit 0
fi

docker run -it --rm --name $CONTAINER_NAME \
			-v /etc/passwd:/etc/passwd \
			-v /etc/group:/etc/group \
			-v /work:/work \
			-v /home/$(id -un):/home/$(id -un) \
			$IMAGE_NAME


