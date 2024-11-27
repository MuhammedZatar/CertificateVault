# Use the official Ruby image
FROM ruby:3.2.2

# Set environment variables
ENV RAILS_ENV=development \
    RAILS_LOG_TO_STDOUT=true \
    RAILS_SERVE_STATIC_FILES=true

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
    nodejs \
    postgresql-client

# Set working directory
WORKDIR /app

# Add Gemfile and install gems
COPY Gemfile Gemfile.lock /app/
RUN bundle install

# Copy the rest of the application code
COPY . /app

# Precompile assets (if necessary) and migrate the database
RUN bundle exec rails assets:precompile || true

# Expose port 3000 for the Rails server
EXPOSE 3000

# Start the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
