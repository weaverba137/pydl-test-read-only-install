FROM ubuntu:trusty
MAINTAINER Benjamin Alan Weaver <baweaver@lbl.gov>
#
# Tools needed
#
RUN apt-get update && apt-get -y install git python-scipy python-pip
RUN pip install astropy git+https://github.com/weaverba137/pydl.git@temp-files-in-tests
#
# Add the travis user with sudo.
#
RUN adduser --disabled-password --gecos "" travis
RUN chown travis:travis /home/travis
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
