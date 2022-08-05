FROM alpine

# Add CA certificates
# It currently throws a warning on alpine: WARNING: ca-certificates.crt does not contain exactly one certificate or CRL: skipping.
# Ignore the warning.
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/* && update-ca-certificates
# Create folder for the log files in the container
RUN mkdir /tmp/logs
#RUN mkdir /go/csms
# Since running as a non-root user, port bindings < 1024 is not possible
# 8000 for HTTP; 8443 for HTTPS;
EXPOSE 8080

#CMD ["/bin/server"]