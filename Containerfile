FROM fedora:latest


RUN useradd -m collin


RUN mkdir -p /structure && chmod 777 /structure && \
    mkdir -p /structure/sync-work && chown sync:sync /structure/sync-work && \
    mkdir -p /structure/nobody-work && chown nobody:nobody /structure/nobody-work


RUN dnf -y update && \
    dnf -y install httpd && \
    dnf clean all


COPY index.html /var/www/html/index.html

EXPOSE 80

ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]
