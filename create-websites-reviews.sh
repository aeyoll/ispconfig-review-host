#!/bin/bash

db_user="@USER@"
db_password="@PASSWORD@"
db_host="@HOST@"
db_name="dbispconfig"

sites_directory="sites"

for i in $(ls $sites_directory)
do
	rm -rf $sites_directory/$i
done;

query="SELECT domain FROM web_domain WHERE type ='vhost'"

for j in $(/Applications/MAMP/Library/bin/mysql -h $db_host -u $db_user -p$db_password $db_name << eof
$query
eof)
do
	review_host_template="var review = require('review');
	
	module.exports = function () {
	  return review()
	    .title('$j')
	    .sites({
	      Home : 'http://$j',
	    })
	    .resolutions([
	      '1440x900',
	      '640x480'
	    ])
}";
	mkdir $sites_directory/$j
	echo $review_host_template > $sites_directory/$j/index.js
done;


