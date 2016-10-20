# Base image with ruby 2.3.1
FROM ruby:2.2.2

MAINTAINER Silvia Puglisi <silvia@nopressure.co.uk>

WORKDIR /$APPROOT
ENV APPROOT fablabs

# Install essential Linux packages
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev libqt4-dev libqtwebkit-dev postgresql-client && apt-get install -y nodejs

# Update Gems
RUN gem update --system

# Clone GitHub Repository

RUN git clone -b api https://github.com/nopressurelabs/data-api.git
RUN cd /$APPROOT

# Define where our application will live inside the image
ENV RAILS_ROOT $APPROOT

# Create application home. App server will need the pids dir so just create everything in one shot
RUN mkdir -p $APPROOT/tmp/pids

# Set our working directory inside the image
WORKDIR $RAILS_ROOT

# Prevent bundler warnings; ensure that the bundler version executed is >= that which created Gemfile.lock
RUN gem install bundler

# Finish establishing our Ruby environment
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

# Copy the Rails application into place
COPY . /api

# Define the script we want run once the container boots
# Use the "exec" form of CMD so our script shuts down gracefully on SIGTERM (i.e. `docker stop`)
# CMD [ "scripts/startup.sh" ]
