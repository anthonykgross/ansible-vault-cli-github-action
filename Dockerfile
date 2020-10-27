FROM ubuntu:bionic

ENV VAULT_KEY=''
ENV ANSIBLE_VAULT_PASSWORD_FILE='/.vault_key'

RUN apt-get update \
  && apt install -y python3-pip

RUN pip3 install ansible-vault

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
