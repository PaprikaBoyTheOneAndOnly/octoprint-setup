# Octoprint

`sudo docker build -f Dockerfile . -t mjpg-streamer`

`sudo NGROK_AUTHTOKEN="<secret-ngrok-octo>" NGROK_URL=<url-ngrok-octo> NGROK_AUTHTOKEN_2="<secret-ngrok-jpeg>" NGROK_URL_2=<url-ngrok-jpeg> docker compose up -d`
