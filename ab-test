 #!/bin/bash

current_time=$(date "+%Y%m%d")

# for line in ${urls_to_test} ;
while read line;
do
    ab -n 100 -c 10 ${line} >> test_${current_time}_staging.txt &
    wait
    # echo ${line}
    echo "meow"
# done < staging-toplevel.txt
done < website-staging.txt

exit 0
