FROM java:7
MAINTAINER Phil Fenstermacher <pcfens@wm.edu>

# Set customizable env vars defaults.
# Set Grails version (max version for this Docker image is: 2.5.3).
ENV GRAILS_VERSION 2.5.0

# Install Grails
WORKDIR /usr/lib/jvm
RUN wget https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip && \
    unzip grails-$GRAILS_VERSION.zip && \
    rm -rf grails-$GRAILS_VERSION.zip && \
    ln -s grails-$GRAILS_VERSION grails
ADD http://pkgs.fedoraproject.org/repo/pkgs/perl-Test-WWW-Selenium/selenium-core-1.0.1.zip/31833c856b59a87cf7958a020bf6907c/selenium-core-1.0.1.zip /root/.grails/$GRAILS_VERSION/download/
WORKDIR /

# Setup Grails path.
ENV GRAILS_HOME /usr/lib/jvm/grails
ENV PATH $GRAILS_HOME/bin:$PATH
