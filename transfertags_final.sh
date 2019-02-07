timer_tokenone=$SECONDS
timer_tokentwo=$SECONDS
#################################
#first token request
#################################
echo "first token: halyard"

raw_token=$(curl -X POST https://halyard.showpad.biz/api/v2/oauth2/token -H 'Authorization: Basic TTJObVlUUmlNbVptTkRRd1lUSTNNR015TlRneE5HUm1Nak5oTm1Gak9XSmhOMkl4TkRFM1pnPT06MmU1NjIxNzRlYWI2OTM2M2RkYTYyZDQ0YTVjZmE2ZGE2ZjYxZjhkOQ==' -H 'content-type: multipart/form-data' -F grant_type=password -F username=michael.haley@showpad.com -F password=Showpad1 | tr -d ' ')

access_token_1=$( echo "$raw_token" | jq -r .access_token) #
refresh_token_1=$( echo "$raw_token" | jq -r .refresh_token)

#################################
#second token request
#################################
echo "Second Token: avanosmedical"

raw_token_2=$(curl -X POST https://avanosmedical.showpad.biz/api/v2/oauth2/token -H 'Authorization: Basic WmpVMU5tRmpZVFJtWkRGaU9HRTBZVGd3TW1Sak9HVmhZemt3WVRWall6TmhORFZqWXpWaVl3PT06NGE4OGNmZTliMTZiYTgyZWU5MTM5NmM2NWJjZTQ5Njk5Y2Y5YTFjOA==' -H 'content-type: multipart/form-data' -F grant_type=password -F username=michael.haley@showpad.com -F password=Showpad1 | tr -d ' ')

access_token_2=$( echo "$raw_token_2" | jq -r .access_token)
refresh_token_2=$( echo "$raw_token_2" | jq -r .refresh_token)

######################
######################
#changes array to be broken up by new lines instead of spaces or new lines, necessary for tags with spaces in them

IFS=$'\n' 

#CURRENTLY SET TO LATAM
alltags_raw=$(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_1"'' 'https://halyard.showpad.biz/api/v3/divisions/4643adcc1621814e91c489b34bb428ed/tags.json?limit=1000&offset=1000')

tags=( $(echo "$alltags_raw" | jq -r .response.items[].name) )

echo "${tags[@]}"
#upload tags now

for x in ${tags[@]}
do
	
	duration2=$(( SECONDS - timer_tokentwo ))
	if [ $duration2 -gt 2700 ]
	then
		echo "We're generating that other new token y'all"
		#generate new token
		new_token2=$(curl -X POST https://avanosmedical.showpad.biz/api/v2/oauth2/token -H 'Authorization: Basic WmpVMU5tRmpZVFJtWkRGaU9HRTBZVGd3TW1Sak9HVmhZemt3WVRWall6TmhORFZqWXpWaVl3PT06NGE4OGNmZTliMTZiYTgyZWU5MTM5NmM2NWJjZTQ5Njk5Y2Y5YTFjOA==' -H 'content-type: multipart/form-data' -F grant_type=refresh_token -F refresh_token="$refresh_token_2" | tr -d ' ' )

		access_token_2=$( echo "$new_token2" | jq -r .access_token)
		refresh_token_2=$( echo "$new_token2" | jq -r .refresh_token)
		
		echo "new tokens:"
		echo "$access_token_2"
		echo "$refresh_token_2"

		#reset timer
		timer_tokentwo=$SECONDS
	fi

	echo "Tag: ${x}"
	thistag=$(echo "${x}" | sed 's/ /%20/g' )
	thistag=$(echo "${thistag}" | sed 's/&/%26/g' )
	thistag=$(echo "${thistag}" | sed 's/+/%2B/g' )


	#division set to APAC in avanosmedical
	curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_2"'' -d 'name='"$thistag"'&divisionId=3efaf0e6d0e19e6487e71a0f409c25c1' 'https://avanosmedical.showpad.biz/api/v3/tags.json'


done