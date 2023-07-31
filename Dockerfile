# Stage 1: Build the application
FROM ruby:2.7.3-slim as builder

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /myapp

# Copy the Gemfile and Gemfile.lock first to leverage Docker's caching mechanism
COPY blog/Gemfile* ./
RUN bundle install

# Copy the entire application source
COPY blog ./

# Stage 2: Create the final runtime image
FROM ruby:2.7.3-slim

RUN apt-get update -qq && apt-get install -y libpq-dev nodejs

WORKDIR /myapp

# Copy only necessary files from the builder stage
COPY --from=builder /myapp/Gemfile* ./
COPY --from=builder /myapp/Gemfile.lock ./
COPY --from=builder /myapp/app ./app
COPY --from=builder /myapp/config ./config

# Install production gems only
RUN bundle install --without development test

# Run the rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
