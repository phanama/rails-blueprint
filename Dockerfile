FROM ruby:2.5.0

RUN apt update && apt install -y postgresql

USER postgres

RUN service postgresql start && \
        psql -U postgres -c "CREATE ROLE root WITH SUPERUSER LOGIN;" && psql -U postgres -c "CREATE DATABASE root;"

USER root

RUN mkdir /opt/rails-blueprint && \
        git clone https://github.com/phanama/rails-blueprint /opt/rails-blueprint && \
        cd /opt/rails-blueprint && \
        gem install rails && \
        gem install bundle && bundle install && \
        rails db:setup && rails db:migrate

WORKDIR /opt/rails-blueprint

CMD ["bash", "run.sh"]