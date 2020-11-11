hdfs dfs -mkdir /user/bd01/examples/sbb/

curl 'https://data.sbb.ch/api/records/1.0/search/?dataset=rail-traffic-information&rows=10000&facet=validitybegin&facet=validityend' | jq -c ' .records[] | .fields' > base.json

hdfs dfs -put base.json /user/bd01/examples/sbb

cd

if [ -f '.crontab' ]; then
	echo '*/1  21 *   *  *  bash ./sbb/dailyjob.sh' >> .crontab
else
	cp repos/sbb/.crontab ~
fi

crontab .crontab