#!/bin/sh
rm -rf /app/temp/cron/apacheip1.txt
python /app/temp/cron/getHosts.py --org=samsclubdotcom --assembly=ATG --env=prod --platform=estoreweb --datacenter=all >>/app/temp/cron/apacheip1.txt
rm -rf /app/temp/cron/diff.txt 
diff /app/temp/cron/apacheip1.txt /app/temp/cron/Originalip.txt >>/app/temp/cron/diff.txt
if [[ -s /app/temp/cron/diff.txt ]] ; then
[ -s /app/temp/cron/diff.txt ] && mail -s "Change in Estore-Apache Production IP's, please take action" pkumar@walmart.com,SCDOps@email.wal-mart.com,SAMSCLUB45@wal-mart.com < /app/temp/cron/diff.txt
else
mail -s "No change in Estore-Apache Production IP's" pkumar@walmart.com -c pkumar@walmart.com,SCDOps@email.wal-mart.com < /app/temp/cron/Originalip.txt 

echo ":::::::DONE:::::::"
fi ;
