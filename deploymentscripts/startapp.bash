#!/bin/bash
aws --region ap-southeast-1 ssm get-parameters --names "Dbuser" --with-decryption | awk 'match($0, /"Value":.*/) { print substr($0, RSTART, RLENGTH) }'| cut -d '"' -f4 | sudo tee user
username=$(cat user)

aws --region ap-southeast-1 ssm get-parameters --names "Dbpassword" --with-decryption | awk 'match($0, /"Value":.*/) { print substr($0, RSTART, RLENGTH) }'| cut -d '"' -f4 | sudo tee pwd
password=$(cat pwd)
cd /tmp/
mvn install dbdeploy:update -Ddatabaseuser=$username -Ddatabasepassword=$password
