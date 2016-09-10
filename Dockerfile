FROM centos:centos6
MAINTAINER Makoto Kitamura

WORKDIR /root

# install essential software
RUN yum update && yum install -y \
            apr-devel \
            apr-util-devel \
            autoconf \
            automake \
            httpd-devel \
            curl-devel \
            gcc \
            git \
            g++ \
            make \
            openssl-devel \
            readline-devel \
            sqlite-devel \
            vim \
            zlib-devel

# install mysql
RUN yum install -y \
            mysql \
            mysql-devel \
            mysql-server

# install rbenv
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
RUN echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

# install ruby-build
RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile

# install ruby
RUN ~/.rbenv/bin/rbenv install 2.3.1
RUN ~/.rbenv/bin/rbenv global 2.3.1
RUN ~/.rbenv/shims/gem install bundler
RUN ~/.rbenv/bin/rbenv rehash

# install rails
RUN rpm -Uvh https://rpm.nodesource.com//pub_4.x/el/6/x86_64/nodesource-release-el6-1.noarch.rpm
RUN yum install -y nodejs
RUN ~/.rbenv/shims/gem install rails -v 4.2.7
RUN ~/.rbenv/bin/rbenv rehash

# copy initialize script file
ADD init.sh /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/init.sh

CMD ["/usr/local/bin/init.sh"]
