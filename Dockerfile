FROM ruby
LABEL maintainer "@awhitehatter"

ENV GITROB_VERSION 1.1.2

# Install required packages
RUN apt-get update && apt-get install -y build-essential libpq-dev \
    && gem update --system && gem install gitrob -v $GITROB_VERSION

# There's an error with the newest Ruby github_api Gem - Heh Ruby; Workaround:
RUN gem uninstall --force github_api && gem install github_api -v 0.13

#Add config file:
ADD ./data/.gitrobrc /root/.gitrobrc

#ASSUMING YOU ARE ACCEPTING THE MIT LICENSE
RUN echo "user accepted" > ls /usr/local/bundle/gems/gitrob-$GITROB_VERSION/agreement.txt

ENTRYPOINT ["/usr/local/bundle/bin/gitrob"]

CMD ["server", "--bind-address=0.0.0.0", "--port=9393"]
