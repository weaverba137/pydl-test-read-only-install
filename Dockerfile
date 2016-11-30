FROM ubuntu:trusty
MAINTAINER Benjamin Alan Weaver <baweaver@lbl.gov>
#
# Add a non-privileged user.
#
RUN adduser --disabled-password --gecos "" travis
RUN chown travis:travis /home/travis
#
# Tools needed
#
RUN apt-get update && apt-get -y install git python-scipy python-pip
RUN pip install astropy 
RUN pip install git+https://github.com/weaverba137/pydl.git@temp-files-in-tests
#
# Set user.
#
USER travis
WORKDIR /home/travis
#
# Run test.
#
ENTRYPOINT ["/usr/bin/python"]
CMD ["-c", "import pydl; pydl.test()"]
