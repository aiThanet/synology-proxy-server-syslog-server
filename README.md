Based on: https://github.com/pbertera/dockerfiles/tree/master/syslogserver

## Rsyslogd + PimpMyLogs

This container creates a Syslog server with Rsyslogd, logs are accessible via PimpMyLogs interface (http://pimpmylog.com).

PympMylogs credentials are created using the script create-user.php:

`SYSLOG_USERNAME` and `SYSLOG_PASSWORD` are used to create credentials.

You can run the container with:

    docker run -it -e SYSLOG_USERNAME=admin -e SYSLOG_PASSWORD=1234 -p 8123:80 -p 519:514/udp -v /host/path:/var/log/net/syslog.log thanet31756/synology-proxy-server-syslog-server:latest
