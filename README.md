# flask-ask-docker

## Build Container

```
$ docker build -t alexa .
$ docker run -ti alexa
```
You should get an ngrok endpoint from the docker output. Note that down!

## Setup AWS console

 * Create new skill
 * Fill in interaction model with aws.config/interaction.json
 * Fill in sample utterances with aws.config/utterances.txt
 * Select HTTPS endpoint for skill service and paste the ngrok output
 * Test either using an echo device or the simulator
