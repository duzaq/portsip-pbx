# Use uma imagem base com curl e bash
FROM ubuntu:20.04

# Defina variáveis de ambiente para evitar prompts durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Instale dependências necessárias
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crie o diretório de trabalho
RUN mkdir -p /opt/portsip

# Copie o script de inicialização para o contêiner
COPY init.sh /opt/portsip/init.sh

# Torne o script executável
RUN chmod +x /opt/portsip/init.sh

# Defina o diretório de trabalho
WORKDIR /opt/portsip

# Execute o script de inicialização
CMD ["./init.sh"]
