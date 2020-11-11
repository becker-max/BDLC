dateD=$(date +%d)
dateM=$(date +%m)
dateY=$(date +%Y)


api='https://data.sbb.ch/api/records/1.0/search/?dataset=rail-traffic-information&rows=100&facet=validitybegin&refine.validitybegin='$dateY'%2F'$dateM'%2F'$dateD

filename='sbb'$dateY$dateM$dateD

curl $api | jq -c ' .records[] | .fields' > $filename.json

hdfs dfs -put $filename.json /user/bd01/examples/sbb/

rm $filename.json