Go IDE in a Container
=========================

This is an example container that packages zsh, tmux, tmuxinator, vim, and Go-related plugins in a single container.
This example assumes you know how to run Docker.

This is not an official Google product.

Modified by Thomas.  I removed zsh.  Shrug.

Running the Container
---------------------
To run this container:

    $ docker run -ti saturnism/go-ide  # Don't do this.
    
Mount a volume so you don't lose your work:

    $ docker run -v /some/path:/go/src -ti saturnism/go-ide

Or, mount a volume from a named container.

Building the Container
----------------------
Nothing special if you already have Docker installed:

    $ git clone https://github.com/tmichaud/go-ide
    $ cd go-ide
    $ docker build -t go-ide .

