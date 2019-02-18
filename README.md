[![CircleCI](https://circleci.com/gh/tmichaud/circleci-101.svg?style=svg&circle-token=5b461b969e922d385734206b3a45919576b12062)](https://circleci.com/gh/tmichaud/circleci-101)

Go IDE in a Container
=========================

This is an example container that packages zsh, tmux, tmuxinator, vim, and Go-related plugins in a single container.
This example assumes you know how to run Docker.

This is not an official Google product.

Modified by Thomas.  I removed zsh and tmux. Shrug.

See http://tmichaud.blogspot.com/2018/10/developing-go-in-docker-container.html for insights on why.

Building the Container  
----------------------
    $ # Assumes that you have a ~/shared/go_docker
    $ cd ~/shared/go_docker
    $ git clone https://github.com/tmichaud/go-ide
    $ 
    $ docker build -t go-ide .

Running the Container
---------------------
To run this container:

    $ cd ~/shared/go_docker/go-ide
    $ ./run_ide.sh
    
   
