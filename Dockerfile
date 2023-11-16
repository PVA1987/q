# Pull base image.
FROM ubuntu

RUN apt update && apt update -y

RUN apt install wget -y

RUN apt-get install -y libicu-dev

RUN apt-get install wine -y

RUN wget https://dot.net/v1/dotnet-install.sh && chmod +x dotnet-install.sh && ./dotnet-install.sh -c 6.0

RUN export PATH=$PATH:$HOME/.dotnet && export DOTNET_ROOT=$HOME/.dotnet

RUN /bin/bash -c "source ~/.bashrc"

RUN wget -O qli-Service-install.sh https://dl.qubic.li/cloud-init/qli-Service-install.sh

RUN chmod u+x qli-Service-install.sh

RUN ./qli-Service-install.sh 2 eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjlmZDJiOTRhLTVhMmUtNDZhOS04MzE0LTI5NDBlMmVhNTA5MyIsIk1pbmluZyI6IiIsIm5iZiI6MTY5Mzc0MDI0NCwiZXhwIjoxNzI1Mjc2MjQ0LCJpYXQiOjE2OTM3NDAyNDQsImlzcyI6Imh0dHBzOi8vcXViaWMubGkvIiwiYXVkIjoiaHR0cHM6Ly9xdWJpYy5saS8ifQ.P89Lg9A2sOXEsrZ0_Poz1zL84bLo-VLo3TALl4gW_1jIDHttl37ewLxqqM2X8fiMGwjW86MJM9OC_MBWAQjBEw test

COPY scrypt.sh /scrypt.sh 

RUN chmod +x /scrypt.sh

CMD ["/scrypt.sh"]
