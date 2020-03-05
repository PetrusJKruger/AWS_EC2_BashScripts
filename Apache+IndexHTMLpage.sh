#!/bin/bash
yum update -y 
yum install httpd -y    #Install Apache
service httpd start     #Start Apache
chkconfig httpd on      #Ensure service restarts when instance is restarted

#Create simple HTML Page
cd /var/www/html
echo "<html><h1>Welcome to the EC2 Fleet!</h1></html>" > index.html
