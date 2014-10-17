FROM cucommunityapps/rvm-jruby-oracle

# File Author / Maintainer
MAINTAINER Kyle Oliveira <kyle.oliveira@cornell.edu>

####################################   XVFB   #################################
# Since we'd like to be able to run tests headlessly, we'll setup xvfb
# Install vnc, xvfb in order to create a 'fake' display and firefox
RUN apt-get update && apt-get install -y x11vnc xvfb firefox
RUN ["mkdir", "/.vnc"]
# Setup a password
RUN x11vnc -storepasswd 1234 /.vnc/passwd
# Autostart firefox (might not be the best way, but it does the trick)
RUN bash -c 'echo "firefox" >> /.bashrc'

EXPOSE 5900
CMD ["x11vnc", "-forever", "-usepw", "-create"]

##################################   Ruby Gems   ##############################
# When we build this monster we'd like to be able to install all needed gems.
# We'll do this by importing from these predetermined locations:
RUN ["mkdir", "/cucumber"]

# Add our scripts, etc.
ADD bin/run_tests.sh /cucumber/run_tests.sh
ADD bin/install_gems.sh /cucumber/install_gems.sh
ADD lib/Gemfile /cucumber/Gemfile
ADD gems /cucumber/gems

# Ok, so, let's get going.
WORKDIR /cucumber
RUN ["/cucumber/install_gems.sh"]
ENTRYPOINT ["/cucumber/run_tests.sh"]
