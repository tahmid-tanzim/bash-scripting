#!/bin/bash
# Backup war sales-test.insightpool.com 
# FROM: /srv/tomcat7-dev/webapps/ema.war 
# To: /home/tanzim/Work/InsightPool/Backup_sales-test_WAR

cd /home/tanzim/Work/InsightPool
mkdir Backup_sales-test_WAR
cd Backup_sales-test_WAR

# LOCAL-PC: Download Existing ema.war from sales-test for backup
scp tahmidtanzim@sales-dev.insightpool.com:/srv/tomcat7-dev/webapps/ema.war .

# LOCAL-PC: Upload local ema.war to sales-test
cd /home/tanzim/Projects/next-principles
mvn clean install
scp /home/tanzim/Projects/next-principles/ema/target/ema.war tahmidtanzim@sales-dev.insightpool.com:/home/tahmidtanzim/uploaded-war

# SERVER: emergency-backup-war
ssh tahmidtanzim@sales-dev.insightpool.com
cd ~
rm -rf /home/tahmidtanzim/emergency-backup-war/ema.war
cp /srv/tomcat7-dev/webapps/ema.war /home/tahmidtanzim/emergency-backup-war/
sudo service tomcat7-dev status

# SERVER: Replace existing war with uploaded one
sudo service tomcat7-dev stop
sudo rm -rf /srv/tomcat7-dev/webapps/ema /srv/tomcat7-dev/webapps/ema.war
sudo cp /home/tahmidtanzim/uploaded-war/ema.war /srv/tomcat7-dev/webapps/
sudo service tomcat7-dev start
ll /srv/tomcat7-dev/webapps/

############################################################################
# Export MongoDB
mongodump -d dev_npslm -o /home/tahmidtanzim/emergency-backup-war/
tar -czvf dev_npslm.tar.gz dev_npslm
scp tahmidtanzim@sales-dev.insightpool.com:/home/tahmidtanzim/emergency-backup-war/smart_rule/dev_npslm.tar.gz /home/tanzim/Work/InsightPool

# Production Server Log
scp tahmidtanzim@e.insightpool.com:/srv/tomcat7-prod/logs/catalina.out /home/tanzim/Work/InsightPool
############################################################################