 echo "D.U.D."
 echo "DOWNLOAD UPLOAD DELETE"
 echo "(now with tags!)"




# echo "Please enter the following information..."
# echo "Subdomain:"
# read subdomain1
# echo "ClientID:"
# read clientid1
# echo "Secret:"
# read secret1

#################################
#start token timers
timer_tokenone=$SECONDS
timer_tokentwo=$SECONDS
#################################
#first token request
#################################
echo "first token: halyard" #(showpadmhtest)

raw_token=$(curl -X POST https://halyard.showpad.biz/api/v2/oauth2/token -H 'Authorization: Basic XXXXXXXXXXXX' -H 'content-type: multipart/form-data' -F grant_type=password -F username=michael.haley@showpad.com -F password=XXXXXXXXX | tr -d ' ') #password now Snowpad1

access_token_1=$( echo "$raw_token" | jq -r .access_token) #
refresh_token_1=$( echo "$raw_token" | jq -r .refresh_token)

#################################
#second token request
#################################
echo "Second Token: avanosmedical" #(mh)

raw_token_2=$(curl -X POST https://avanosmedical.showpad.biz/api/v2/oauth2/token -H 'Authorization: Basic XXXXXXXXXX' -H 'content-type: multipart/form-data' -F grant_type=password -F username=michael.haley@showpad.com -F password=XXXXXXXX | tr -d ' ')

access_token_2=$( echo "$raw_token_2" | jq -r .access_token)
refresh_token_2=$( echo "$raw_token_2" | jq -r .refresh_token)

#################################
#################################

#generate a list of all assets under 1000 items
getAssetIds=( $(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_1"'' 'https://showpadmhtest.showpad.biz/api/v3/assets.json?fields=id&isDownloadable=true&limit=1000' | jq .response.items[].id | tr -d \") )

#echo "HERE IS GET ASSET IDS"
#echo "${getAssetIds[@]}"

#LATAM assets below
#getAssetIds=(
#XXXXXXXXX
#)
#changes array to be broken up by new lines instead of spaces or new lines, necessary for tags with spaces in them
#IFS=$'\n' 
IFS=$'\n' 

echo "Here's the first one, here we go! ${getAssetIds[0]}"


for id in ${getAssetIds[@]}
do
	#check token 1 refresh here
	###########################
	duration1=$(( SECONDS - timer_tokenone ))
	echo "Duration: ${duration1}"
	if [ ${duration1} -gt 2700 ]
	then
		echo "We're generating a new token y'all"
		#generate new token
		new_token1=$(curl -X POST https://halyard.showpad.biz/api/v2/oauth2/token -H 'Authorization: Basic XXXXXXXXXXXXX' -H 'content-type: multipart/form-data' -F grant_type=refresh_token -F refresh_token="$refresh_token_1" | tr -d ' ' )

		access_token_1=$( echo "$new_token1" | jq -r .access_token)
		refresh_token_1=$( echo "$new_token1" | jq -r .refresh_token)

		echo "new tokens:"
		echo "$access_token_1"
		echo "$refresh_token_1"

		#reset timer
		timer_tokenone=$SECONDS
	fi

	# #get the download link of the old asset
	# downloadLinks=$(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_1"'' 'https://showpadmhtest.showpad.biz/api/v3/assets/'"${id}"'.json?fields=shortLivedDownloadLink' | jq -r .response.shortLivedDownloadLink) 
	
	# #get the old asset's name
	# oldassetname=$(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_1"'' 'https://showpadmhtest.showpad.biz/api/v3/assets/'"${id}"'.json?fields=name' | jq -r .response.name)

	 # #get an array of tags
	 # oldtags=( $(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_1"'' 'https://showpadmhtest.showpad.biz/api/v3/assets/'"${id}"'.json?expand=tags' | jq -r .response.tags.items[].name) )

	# #global status of old asset
	# isglobal=$(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_1"'' 'https://showpadmhtest.showpad.biz/api/v3/assets/'"${id}"'.json?fields=isDivisionShared' | jq -r .response.isDivisionShared)
	# #echo "Global?: ${isglobal}"
	echo "${id}"
	rawdoc=$(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_1"'' 'https://halyard.showpad.biz/api/v3/assets/'"${id}"'.json?expand=tags&fields=shortLivedDownloadLink,name,tags,isDivisionShared,isShareable,isAnnotatable,archivedAt,isSensitive' )
	
	echo "A NEW TEST"
	istrash=$(echo "$rawdoc" | jq -r .response.archivedAt)

	if [ ${istrash} == "null" ]
	then

		downloadLinks=$( echo "$rawdoc" | jq -r .response.shortLivedDownloadLink)
		echo "${downloadLinks}"
		oldassetname=$( echo "$rawdoc" | jq -r .response.name)
		echo "${oldassetname}"
		
		unset oldtags
		oldtags=$( echo "$rawdoc" | jq -r .response.tags.items[].name)
		echo "${oldtags[@]}"

		oldtags=( ${oldtags[@]} )
		
		
		isglobal=$( echo "$rawdoc" | jq -r .response.isDivisionShared)
		echo "${isglobal}"
		sharable=$( echo "$rawdoc" | jq -r .response.isShareable)
		echo "${sharable}"
		isannotate=$( echo "$rawdoc" | jq -r .response.isAnnotatable)
		echo "${isannotate}"
		iskiosk=$( echo "$rawdoc" | jq -r .response.isSensitive)
		


		echo "Download..."
		wget "${downloadLinks}" -O "${oldassetname}"
		echo "Now upload...."

		#check refresh token 2 here
		###########################
		duration2=$(( SECONDS - timer_tokentwo ))
			if [ $duration2 -gt 2700 ]
			then
				echo "We're generating that other new token y'all"
				#generate new token
				new_token2=$(curl -X POST https://avanosmedical.showpad.biz/api/v2/oauth2/token -H 'Authorization: Basic XXXXXXXXXXXXXXX' -H 'content-type: multipart/form-data' -F grant_type=refresh_token -F refresh_token="$refresh_token_2" | tr -d ' ' )

				access_token_2=$( echo "$new_token2" | jq -r .access_token)
				refresh_token_2=$( echo "$new_token2" | jq -r .refresh_token)
				
				echo "new tokens:"
				echo "$access_token_2"
				echo "$refresh_token_2"

				#reset timer
				timer_tokentwo=$SECONDS
			fi

		#gather new tag IDs
		taglink="<"

		for tid in ${oldtags[@]}
		do
			echo "Tag: ${tid}"
			thistag=$(echo "${tid}" | sed 's/ /%20/g' )
			thistag=$(echo "${thistag}" | sed 's/&/%26/g' )

			onetag=$(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_2"'' 'https://avanosmedical.showpad.biz/api/v3/divisions/24edd6f05a7493110227d7e52940b697/tags.json?name='"${thistag}"'' | jq -r .response.items[].id)
			taglink="${taglink}${onetag}>; rel=\"Tag\",<"

		done

		#remove last two characters ",<" of taglink variable for next call
		taglink2=${taglink%?}
		taglinkfinal=${taglink2%?}
		#echo "FINAL TAGS READY FOR CALL: ${taglinkfinal}"
		
		echo "$taglinkfinal"
		#oldassetname=$(echo "${oldassetname}" | sed 's/,/%2C/g')
		#oldassetname=$(echo "${oldassetname}" | sed 's/+/%2B/g')

		#upload that sucka'!
		upload=$(curl -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: application/json' --header 'Link: '"$taglinkfinal"'' --header 'Authorization: Bearer '"$access_token_2"'' 'https://avanosmedical.showpad.biz/api/v3/divisions/24edd6f05a7493110227d7e52940b697/assets.json' -F 'file=@"'"$oldassetname"'"' -F 'isDivisionShared='"$isglobal"'' -F 'isShareable='"$sharable"'' -F 'isAnnotatable='"$isannotate"'' -F 'isSensitive='"$iskiosk"'')
		echo "${upload}"
		error=$(echo "${upload}" | jq -r .meta.code)
		
		echo "${error}"
		if [[ ${error} != "201" ]]
			then
			echo "This file FAILED TO UPLOAD. ID: ${id}"
			echo "${id}" >> errorlog.txt
		fi
		
		echo "Delete..."
		rm "${oldassetname}"


	else	
		echo "This file is TRASH: ${id}"
	fi

	echo "end of loop"

	
	

done


