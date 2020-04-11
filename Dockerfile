# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Copyright 2019 Solipsis Software Solutions
# 
# This is a rework (derivative work) from the original approach to use gopls (and vim-plug rather than pathogen). 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM golang:latest

ENV EDITOR vim
ENV SHELL /bin/bash

RUN apt-get -q update -y && \
    apt-get install --no-install-recommends -y --force-yes -q \
    ca-certificates \
    build-essential \
    curl \
    git \
    libncurses5-dev  \
    python3-pip \
    python3-setuptools \
    && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Vim from source -- from https://www.vim.org/download.php#unix
RUN git clone https://github.com/vim/vim.git
RUN cd vim/src && make && make install

VOLUME ["/go/src"]

RUN groupadd --gid 999 vboxsf
RUN useradd --gid 999 -ms /bin/bash -d /vim-go vim-go
RUN usermod -a -G staff vim-go
USER vim-go

RUN curl -fLo /vim-go/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#RUN git clone --branch v1.20 https://github.com/fatih/vim-go.git /vim-go/.vim/plugged/vim-go
RUN git clone https://github.com/fatih/vim-go.git /vim-go/.vim/plugged/vim-go
ADD --chown=vim-go:vboxsf vimrc /vim-go/.vimrc
RUN vim -E -u /vim-go/.vimrc +PlugInstall +GoInstallBinaries

CMD ["/bin/bash"]
