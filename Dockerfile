FROM phusion/holy-build-box-32:latest
LABEL maintainers "jakobknutsen@gmail.com"

# Do what we can to update package checksums, because the parent image tends to be outdated
RUN yum -y install yum-plugin-ovl
RUN yum clean all && yum -y update
RUN yum -y install python-hashlib
# Install build deps
RUN yum install -y bison

WORKDIR /tmp/nwnsc
ENTRYPOINT ["/bin/bash", "-c"]
CMD ["/hbb_exe/activate-exec cmake . && make all"]
