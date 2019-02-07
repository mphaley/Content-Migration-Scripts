# Content-Migration-Scripts
The following shell scripts are used to migrate content across Showpad instances with meta data and tagging information intact via Showpad's open API.

Showpad is a content respository used by Marketing teams to allow Sales to have a central place for collateral. It is also a platform for sales reps to share content to proscpects while tracking the recipient's interaction of that collateral.



This includes:

transfer_files_master.sh -> takes two Showpad instances and transfers all files from one to the other.  All tags must be transferred first (using transfertags.sh) in order for all meta data to sucessfully transfer.  Divisions within each instance need to be specified as well

transfertags.sh -> transfers entire tag library from source instance to desitination instance

flobalssetswithtags.sh -> corrects tagging on assets that are global (belong to multiple divisions within Showpad)

transferusergroups.sh -> transfers all user groups from source instance to desitination instance 

