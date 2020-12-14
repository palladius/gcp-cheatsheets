## Docker snippets

* docker with TWO ports, incredible:

Docker command with TWO ports to map (one for web one for health)

    $ docker run -it -p 10001:80 -p 10002:81 kelseyhightower/hello:1.0.0 
