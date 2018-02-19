# shinyproxy-deployment
Example how to deploy a Shiny app through shinyproxy

## Setup 
Install docker for your OS by following the instructions [here](https://docs.docker.com/install/).

If you are running OSX, you will also need to install `socat` as described in the issue [here](https://github.com/openanalytics/shinyproxy/issues/20).
You will need to have `brew` installed on your machine, go to [https://brew.sh/](https://brew.sh/) to download.

```
brew install socat
```

ShinyProxy requires the Java 8 (or higher) runtime environment which you can download from the [Oracle website](http://www.oracle.com/technetwork/java/javase/downloads/index.html).
You can check your Java version by running `java -version` in the terminal.

Finally, you will also need to download [ShinyProxy](https://www.shinyproxy.io/downloads/) which is essentially just a single `jar` file.
Copy this jar file (e.g. `shinyproxy-1.0.2.jar`) into the project's root directory.

## Containerize Shiny app
ShinyProxy requires your Shiny app to be encapsulated in a Docker container.
The container is defined by the `Dockerfile` in the root directory of this project.

Build the container by running:

```
bin/build-docker.sh
```

This creates a container named `shinyproxy/helloworld`.
You can list all available Docker containers using `docker images`.

Once the container is successfully built, it can be spun up using:

```
bin/run-local-docker.sh
```
Then point your browser to [http://0.0.0.0:3838](http://0.0.0.0:3838) to see your application in action.

## Run ShinyProxy
ShinyProxy is responsible to spin up Shiny containers.
The Docker image to spin up for a particular Shiny app is specified in the `apps` section of the configuration file `application.yml`.

Start ShinyProxy by running:

```
bin/start-shinyproxy.sh
```

A few seconds later, you can visit [http://localhost:8080](http://localhost:8080) in your browser.
Use the credentials `jack`/`password` to log in.

