hdfs dfs -mkdir /user/bd01/examples/sbb/

curl 'https://data.sbb.ch/api/records/1.0/search/?dataset=rail-traffic-information&rows=1000&facet=validitybegin&refine.validityend=2019%2F05%2F05' | jq -c ' .records[] | .fields' > base.json

hdfs dfs -put base.json /user/bd01/examples/sbb

dateD='06'
dateM=$(date +%m)
dateY=$(date +%Y)


api='https://data.sbb.ch/api/records/1.0/search/?dataset=rail-traffic-information&rows=100&facet=validitybegin&refine.validitybegin='$dateY'%2F'$dateM'%2F'$dateD

filename='sbb'$dateY$dateM$dateD

curl $api | jq -c ' .records[] | .fields' > $filename.json

hdfs dfs -put $filename.json /user/bd01/examples/sbb/

rm $filename.json

dateD='07'
dateM=$(date +%m)
dateY=$(date +%Y)


api='https://data.sbb.ch/api/records/1.0/search/?dataset=rail-traffic-information&rows=100&facet=validitybegin&refine.validitybegin='$dateY'%2F'$dateM'%2F'$dateD

filename='sbb'$dateY$dateM$dateD

curl $api | jq -c ' .records[] | .fields' > $filename.json

hdfs dfs -put $filename.json /user/bd01/examples/sbb/

rm $filename.json

dateD='08'
dateM=$(date +%m)
dateY=$(date +%Y)


api='https://data.sbb.ch/api/records/1.0/search/?dataset=rail-traffic-information&rows=100&facet=validitybegin&refine.validitybegin='$dateY'%2F'$dateM'%2F'$dateD

filename='sbb'$dateY$dateM$dateD

curl $api | jq -c ' .records[] | .fields' > $filename.json

hdfs dfs -put $filename.json /user/bd01/examples/sbb/

rm $filename.json
