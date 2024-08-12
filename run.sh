mkdir -p ~/setup-display && cd ~/setup-display
cat > docker-compose.yml <<EOF
version: '3.8'

services:
  display:
    image: dorowu/ubuntu-desktop-lxde-vnc
    restart: always
    ports:
      - 127.0.0.1:5900:5900
      - 127.0.0.1:5800:5800
    environment:
      - USER=root
      - PASSWORD=yourpassword  # Set a password for VNC access
    volumes:
      - /tmp/.X11-unix:/tmp/.X11-unix  # Optional: for X11 forwarding

  novnc:
    image: geek1011/easy-novnc
    restart: always
    command: -a :5800 -h display --no-url-password
    ports:
      - 127.0.0.1:5800:5800
EOF

docker compose up -d
