# Oracle Express 11.2 Container

To build this container, first you need to combine the parts of the RPM file in a single file:

`./combine_rpm.sh`

Then, run the docker build command:

`docker build --rm -t cs-oracle-xe:latest .`

And finnaly, just execute the run script:

`./run_oracle_container.sh`

This will start the container and forward the localhost 8080 and 1521 ports to your brand new Oracle XE container running in background.
That is it!
