FROM ruby:2.7.3

# Install required OS packages for the existing dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Create the application directory
RUN mkdir /myapp

WORKDIR /myapp

# Copy source code to the application directory
COPY blog/ /myapp

# Install all the application dependencies
RUN bundle install

# Run the rails server
CMD ["rails", "server"]
