FROM ruby
LABEL maintainer "@awhitehatter"

# Install required packages
RUN apt-get update && apt-get install -y build-essential libpq-dev \
    && gem update --system && gem install gitrob

# There's an error with the newest Ruby github_api Gem - Heh Ruby; Workaround:
RUN gem uninstall --force github_api && gem install github_api -v 0.13

#Add config file:
ADD ./data/.gitrobrc /root/.gitrobrc

#ASSUMING YOU ARE ACCEPTING THE MIT LICENSE
RUN echo "user accepted" > /usr/local/bundle/gems/gitrob-1.1.0/agreement.txt

ENTRYPOINT ["/usr/local/bundle/bin/gitrob"]

CMD ["server", "--bind-address=0.0.0.0", "--port=9393"]
