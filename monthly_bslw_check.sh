#!/bin/bash

#Feb 15  2019 
###
# Alex: import_from_BSLW.sh out/${this_file} ${import_dir}${this_file} $error_log
# Clare: try feeding a file name that does not exist on the ftp server
# through the command above
###

#paths
out_to_alma_path=/tmp/
import_dir=/tmp/
error_log=/tmp/import_from_bslw.log
path_to_file_that_exists=/tmp/

#filenames
file_name="emory_bib_maintenance.d"
sample_file="emory_bib_maintenance.d190311.zip"
#this_file="emory_bib_maintenance.d"${this_month}"*.zip"

this_month=`date +%y%m`
friday=`date +%y%m%d`
thursday=`date --date="1 day ago" +%y%m%d`
wednesday=`date --date="2 days ago" +%y%m%d`
tuesday=`date --date="3 days ago" +%y%m%d`
monday=`date --date="4 days ago" +%y%m%d`
sunday=`date --date="5 days ago" +%y%m%d`
#sunday="emory_bib_maintenance.d190311.zip"
saturday=`date --date="6 days ago" +%y%m%d`


this_file="emory_bib_maintenance.d"${this_month}"*.zip"

echo "retrieving files from "${this_month}
/alma/bin/import_from_BSLW.sh out/${file_name}${friday}.zip ${import_dir}${file_name}${friday}.zip $error_log
/alma/bin/import_from_BSLW.sh out/${file_name}${thursday}.zip ${import_dir}${file_name}${thursday}.zip $error_log
/alma/bin/import_from_BSLW.sh out/${file_name}${wednesday}.zip ${import_dir}${file_name}${wednesday}.zip $error_log
/alma/bin/import_from_BSLW.sh out/${file_name}${tuesday}.zip ${import_dir}${file_name}${tuesday}.zip $error_log
/alma/bin/import_from_BSLW.sh out/${file_name}${monday}.zip ${import_dir}${file_name}${monday}.zip $error_log
/alma/bin/import_from_BSLW.sh out/${file_name}${sunday}.zip ${import_dir}${file_name}${sunday}.zip $error_log
/alma/bin/import_from_BSLW.sh out/${file_name}${saturday}.zip ${import_dir}${file_name}${saturday}.zip $error_log


if [ -s ${import_dir}${this_file} ]; then
  echo "transfer successful"
else
  echo "file not found"
fi

#+ '[' -s /tmp/emory_bib_maintenance.d190311.zip /tmp/emory_bib_maintenance.d190513.zip '/tmp/emory_bib_maintenance.d*.zip' ']'
#clare_test.sh: line 41: [: too many arguments
#+ echo 'file not found'

exit 0