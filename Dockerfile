FROM openanalytics/r-base

MAINTAINER Tobias Verbeke "tobias.verbeke@openanalytics.eu"

# copy the app
RUN mkdir -p /root/shiny/app
COPY app /root/shiny/app

# copy package requirements
RUN mkdir /root/shiny/packrat
COPY packrat/init.R /root/shiny/packrat/
COPY packrat/packrat.lock /root/shiny/packrat/
COPY packrat/packrat.opts /root/shiny/packrat/

# copy Rprofile
COPY Rprofile.site /usr/lib/R/etc/
COPY .Rprofile /root/shiny/

# install R packages as specified in packrat
WORKDIR /root/shiny
RUN R -e "install.packages('packrat', repos='https://cloud.r-project.org/')"
RUN R -e "packrat::restore()"

# start the app
EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('/root/shiny/app')"]
