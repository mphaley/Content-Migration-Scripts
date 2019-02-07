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

raw_token=$(curl -X POST https://halyard.showpad.biz/api/v2/oauth2/token -H 'Authorization: Basic TTJObVlUUmlNbVptTkRRd1lUSTNNR015TlRneE5HUm1Nak5oTm1Gak9XSmhOMkl4TkRFM1pnPT06MmU1NjIxNzRlYWI2OTM2M2RkYTYyZDQ0YTVjZmE2ZGE2ZjYxZjhkOQ==' -H 'content-type: multipart/form-data' -F grant_type=password -F username=michael.haley@showpad.com -F password=Halyard1 | tr -d ' ') #password now Snowpad1

access_token_1=$( echo "$raw_token" | jq -r .access_token) #
refresh_token_1=$( echo "$raw_token" | jq -r .refresh_token)

#################################
#second token request
#################################
echo "Second Token: avanosmedical" #(mh)

raw_token_2=$(curl -X POST https://avanosmedical.showpad.biz/api/v2/oauth2/token -H 'Authorization: Basic WmpVMU5tRmpZVFJtWkRGaU9HRTBZVGd3TW1Sak9HVmhZemt3WVRWall6TmhORFZqWXpWaVl3PT06NGE4OGNmZTliMTZiYTgyZWU5MTM5NmM2NWJjZTQ5Njk5Y2Y5YTFjOA==' -H 'content-type: multipart/form-data' -F grant_type=password -F username=michael.haley@showpad.com -F password=123456 | tr -d ' ')

access_token_2=$( echo "$raw_token_2" | jq -r .access_token)
refresh_token_2=$( echo "$raw_token_2" | jq -r .refresh_token)

#################################
#################################

#generate a list of all assets under 1000 items
#getAssetIds=( $(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_1"'' 'https://showpadmhtest.showpad.biz/api/v3/assets.json?fields=id&isDownloadable=true&limit=1000' | jq .response.items[].id | tr -d \") )

#echo "HERE IS GET ASSET IDS"
#echo "${getAssetIds[@]}"

#LATAM assets below
getAssetIds=(
5dd5b400605639f942dadf788d1708f5
cbe5b063f935840c11b0ce3ad69b36e1
4b0676fb6b006a0ba97f9d2c9674c4f1
cc8eb76f0738db5753107342da38a4de
e27d31f86e376f4cb8c821598e22b5f7
46db49a330f8e13d38db3ed489eb4be1
60bdfa24adbaf2e676eecca6d5212f4e
57c0990e25fe048e150c5476887cfc77
c1fea54ca9426632146dd4ffebd9bb8f
0eed5c45fc2861adbf64da5e110de69f
e67e8debd7115399278f53208148e691
dfef8b9408be7c58e46e883992792b83
14d395894e425005d5d4da0b1e7cc830
a77a0dca1935f152a91c1f6fe44d26ca
b64f731c3aea8a57f80b9b2dac9cf5ba
68cf24e73d87b6c4432448598e6707fa
ac6aaf9d15bbaae9da09a7b59f2fcbdc
15b4f5e09f0185ffa2f7a0c39ed85c4b
6291d42a5e55337f9f1946cce115b2e5
5dcc24a02520f29078bfaf5da9562a4c
bd662e334d0161ca4007cedefac507c2
39d54a664bcc1c12c4d4afc6d35c7dd2
9b967695df9d189d154b0d4bd49136f8
6d1cfb5a0a46745c291c8e5b20511a4a
7320e248faafcfe24c42b79540f5a0b1
3e4d3ac6a4d42576a780b089771eaf5b
bb4528103ca4149eb3c5a7a547467811
0af506563abcad24f01d54b54c02ed89
c129581471473ef047d2e8a11d22cc60
dc6b8584d4180df6639eca8b03c817be
8da060797e2eb6116f2ae71998db08e6
9d10301961bbbbe59f7308c70aa047d5
07c51d400ffd1e7359319608042ec9b5
dec29664d4a308a6e0952b82b5ed9115
2bd9e0c7453959717d31fc630605434b
e6bf4e8f6633f1c61a22cede7b087822
0b26668a60671b631dc90f144db603f5
2a0319ce020ec8787f3aee5ea0364dca
c63877d7cf628c1e1b0a14323290fa7e
0f813d41676e67788e28c7ad9ea35345
a067aa1ed216671258f201dd48db44b4
04f0a8e6d5cb23c26e06d4ca07eb0fb2
f24d3e5d6f548c3291c709b2cfa1c609
133d0c9fca23836e1f71ff09e693eb20
52d9450197c0b4c357ef29d76a528bb4
25e6c8ce351c1bcaf30d9a9a6437b8fc
e926bae1e007213f7e29f38096ee3d99
68e745468b755e690c74cc50066ee4db
24eb070fef258abaa8185c17c675e75a
ab48f942a17b9f82f3dee3b934888118
539b72b5ba54e26fe2178d3740aa2369
1ec77fdccb616984249c9d40ded10445
195bb624a53fe29bc63bd101e0941418
0645aaec049f1cb7b86a3454b2891d54
914804658df203292e7ae0c84d9a6003
289654d898c94218bf3617f370045b37
9557d05481c93af0eeea0e41e244b0a6
877a5be9a17b94bb30c7de5bab0ef873
74dc42b30091fdabd1855c0b447d3f8e
f41141b7689e8f5a473660ab436c4e89
b7cecb122ca50a26718664ffe9032266
24eca15230e0c306379a16222b107cfe
6195695d045e8c8db898bd2341452bbc
6a10823fd04b5d922b55aded6acaea13
bb03022a1fb00c42349fbb1c43760f90
b0718c078e68cfe9a98765c4d8706e78
91fdce029eba0febe69cb2ff68207322
456f9e65c7bfb56ba7e7766ed09ffb7b
78d77267b9369542a73a5e88b99aa5d1
1be8711879ad969700a2597c9e38b2a2
dd36fdff164d95849c7016ae61d4ec83
6365d202c125c2b4db6e1c45f1356b1a
b4eadb8b439e9f2a9afec4688de2fcb8
c12ba76e0fccdd62deda11132c0e167f
3ef61db9077ac36d66c2fed2951f6566
ff2df39d3d727f28a044a99d0d5e2a36
ab71c8ab7f12cedd94687bc9041422bf
9b4a1d54c491fc3edea0e3c6b5770865
b73452aa627a88d262aa1f1ddfa6f846
739e316996293930f33b2e5a1ef76c30
6bde2e5c07fa9cc963d8c3ccc01e79f2
ec951b85e5dd23d219bbaa2a788a79fd
d6028bdd57cac63cba4423b7948bab0c
944852097255f405ceebcb996be86188
0ff7149c972ff2dab5eefc2162e60c47
c21c03db7d08dc07f03592a5b90384ea
deeeb8d0c2d804036e538d31e6f384c7
daf57b1a6e83f9a4adbf778551899f7d
054cf661d474a96d8fb5730770043f09
85b3a60631bb2483cdfd71d223e7c4ed
3c4f962e47a983e7b3190d6ed13bbfe6
b5a671decef3adc1dfb7d3f18630b9c9
35bef3b761fe7caec1a8eced8328384e
a7555dabfd2a714e2c5059ef7a3ddfc8
548b1ab7cc0954ed3b836918bdb5cc18
7f8cbacb758eba719a3674296c17d0bc
fc2e604928ef52e767f76b21ed094b1a
e2d04f6a6b27021baf891eea503d49f1
9691fe7019aa5b037531f747e077ef48
408a1a877a485b64c29a5d00f55eecf2
79ed33ee172632cd6b3702555eafae90
5e7a4837545924bf54e8036c0af1bf9c
1e0cb95b23270b6717d879df76a0d65a
89329d33a07cdc648d06d801e3c4a4b9
fc4414233c416205a84bf32d9dd04403
4437695cc864ae3d7aa5bc4f797f4b9f
f858c917dfddf1dc571e65a6aabc8962
63f521914403ee6922ee7c22c9d851f6
b1a44f753a5d9593dfa6cc7ab3fa0283
bfafdb29b05e7498e096db57ae209628
32ec3e5a8de30ba464d5f6e85c755ed6
5fc37337c65cc970529e340549581278
df57e01d53513d8284224fa013ca61ad
44b6c1fd51af94ab891150a9960336b5
4ea3a33dfcf3e5915a93975ef1aa62c2
94bcd20cf9a1b1f1b0bf88fa27e5e7a8
5ea809727ae6ae88295b83d31d685d17
d945a59a56111a0328e16d71352c0bc7
c3bd2698118d33efbb93e15816e00021
39bd59580ab98ece194e699e2451b3b7
5c82645c10a4902c0675be89c92c9eb3
1a5d75cefb9e0f1cfc357300ca4c4f4c
7a9121f33e7e184daa9ef9d7abc3708b
7177591f2e7d7d9cc2097446a82cafd0
2a8d277a505675165b501f1fdf35598d
b8014a78d88a0dbfdd6905dd870e9e5b
59599455ab7daca9a16953f93c1db078
0d57f26893a2a445752cc035c9e961a9
65bc8d905d91d0505a0293148dcc770b
e467de3a3826e1df547aa9d96f857836
6f31275fbe9da10687486fefe6ffe23b
5d89aa66293ab5817dc78806ab63b3a2
a8708a8f07b7b0644f226b7e6f11ecc5
52cdb33b15e481d05e8e1750473964e3
eef602fe8ad64fe3d9d8d17bfc3a8d59
318c3391d87d884309d6a9975992f659
8cde5695dbd63e4e62a0f5f02230bbfc
0b2c5bff928a1f337adf923537c5418c
68fc053b48998951258beea5e37e6606
b638676a8fcd2b90ff67bbd543fa920f
9028033a2d7b502692e557b6d94398ac
f07f38d50e61a65871f90df15ec56566
4d0c13947f082f78763af1688bb8e2aa
84f962aa327e9f3d063362af0e4d1ace
53357f0046e24f0bd52313e62e025c07
e734c53c14b929ab013d7a1b1407409c
d858f0d8da48f32cc1db1034aaf18496
5519b62aaeb277b8f67991bceb8106b5
a086bc4d4fe3892ebdb304d6c85e8c8e
dc2e9bd5fe9a6388090c0afb158c4e4a
9b5dc8a042a7c71137e3d076b526982a
29a7529c3f7d75a2b07c4b71cfca0d85
7a6dc7ade614c019aaaa5571332e4818
1e49645209e5f0e4f038433c99b53992
a02460be41d2414f5426008d57dfe516
405ee97fabe786c656c89daf54ddcea9
45b693c443925af377c24d817e427d39
89227c53f48666960f8bfd7c658315b1
cf5a99c69ef7a463ee823492cac8c24d
951271aca30a48856f384259607d3db3
4bf479cd1c11d1814170f788dc59a8ec
3b4a010c11d0b0c018c4a0766cdff89c
067c86f459d451b7760011954aea3c97
c0047f6faba1c56727246a50f7f023d6
d5c07d8e7cdd12db65a3a4e125797d04
e5076a1743613045a17c03b273b387d4
48005a2eb5cbef0e1b06d8e5307c2bf3
f74702967aaca07bf45de3c2c21156b3
6d946700fe5f844f8ada3183c5dcc47c
68e5d8b7088d2befc2535849eb6ddbe8
dda9d2a2b154728533bb5f3f6a50507f
a30c5950c12ae125019f5e411b4625de
bbdfeb5e6f92764a31e487bb7dd429b4
63b1bc22f8953fdbdf2ce7cecb4d4d3e
dee0d0cd4a3c2fa15ad32376405736a2
e1477598d3366432aa2301ffb6b3a872
6dca779185385eb89f7b2dc08d6a2718
0d3812eda1d902426f145ed06f62b6c5
120425d67dd4cd219f963ee9687dee3a
c832254ef2fa758933e76e5dc4d5efcb
c3469094310309ed6f81aa3c369d3bff
0668c79141fdfd5fb234ade317ceb8e6
2fb11628708c494825b12a72d400d971
00da705a807c64ac7795045ca9f91c33
52d0452fe99fa5a2380ac343a3b7e070
2f05d8ba3028ddede9ec5709b2b4f4d2
66ebb576d060c77df3c548021189e0ee
ac5deab73f801bb5b08ceea1db5cb560
5e171d7f252ad723f92fdfac54dd4e6e
a98ac6c2df740d7e17bcaa7031adb077
e51f2778717669d5df6ac4683a48de65
207a9ee7e053f1d3424d02db78c4ce1c
a864e2cfd3675c7ca8464272aa42458c
cce3be45c916ac411747515fc50e67b1
3b198a0f7c15b37a69c78cf154639ad7
a9913df4f2d59aad239220153c5b81a0
)
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
		new_token1=$(curl -X POST https://halyard.showpad.biz/api/v2/oauth2/token -H 'Authorization: Basic TTJObVlUUmlNbVptTkRRd1lUSTNNR015TlRneE5HUm1Nak5oTm1Gak9XSmhOMkl4TkRFM1pnPT06MmU1NjIxNzRlYWI2OTM2M2RkYTYyZDQ0YTVjZmE2ZGE2ZjYxZjhkOQ==' -H 'content-type: multipart/form-data' -F grant_type=refresh_token -F refresh_token="$refresh_token_1" | tr -d ' ' )

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
				new_token2=$(curl -X POST https://avanosmedical.showpad.biz/api/v2/oauth2/token -H 'Authorization: Basic WmpVMU5tRmpZVFJtWkRGaU9HRTBZVGd3TW1Sak9HVmhZemt3WVRWall6TmhORFZqWXpWaVl3PT06NGE4OGNmZTliMTZiYTgyZWU5MTM5NmM2NWJjZTQ5Njk5Y2Y5YTFjOA==' -H 'content-type: multipart/form-data' -F grant_type=refresh_token -F refresh_token="$refresh_token_2" | tr -d ' ' )

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


