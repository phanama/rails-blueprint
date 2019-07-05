FROM bitnami/rails:5.2.3-0

RUN sudo apt update && sudo apt install git

RUN git clone https://github.com/phanama/rails-blueprint && \
        cd rails-blueprint && \
        gem install bundle && bundle install && \
        rails db:setup && rails db:migrate
