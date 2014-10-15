FROM heroku/cedar
MAINTAINER Eugene Ware <eugene@noblesamurai.com>
env HOME /app
ENV PORT 5000
ADD . /buildpack
ADD ./start.sh /start.sh
EXPOSE 5000

ONBUILD ADD	.	/app
ONBUILD RUN	/buildpack/bin/compile /app /tmp
ONBUILD CMD	["/start.sh", "start", "web"]
