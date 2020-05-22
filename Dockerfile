FROM ruby:2.6.5
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs           
RUN mkdir /product_mgt
WORKDIR /product_mgt
COPY Gemfile /product_mgt/Gemfile
COPY Gemfile.lock /product_mgt/Gemfile.lock
RUN bundle install
COPY . /product_mgt

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]