NAME=yocto_ubuntu26_image
echo ${NAME}

docker image build  --tag ${NAME} \
                    --build-arg "DOCKER_WORKDIR=/work/yocto" \
                    --build-arg host_uid=$(id -u) \
                    --build-arg host_gid=$(id -g) \
                    --build-arg USER=$(whoami) \
                    -f Dockerfile_Ubuntu26.04 \
                    .
