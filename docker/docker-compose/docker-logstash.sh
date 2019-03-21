docker run -v /data/logstash/conf.d:/usr/share/logstash/pipeline/:ro \
 -v /data/logstash/logstash.yml:/usr/share/logstash/config/logstash.yml:ro \
 -v /etc/localtime:/etc/localtime:ro \
 -v /var/lib/docker:/var/lib/docker \
 --name logstash-01 \
 --network host -d docker.elastic.co/logstash/logstash:6.2.4
