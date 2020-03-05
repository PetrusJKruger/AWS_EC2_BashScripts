#!/bin/bash
# Source: acloudguru Solutions Architect Associate Course
yum update -y
yum install httpd php php-mysql -y      # Install services necessary for Wordpress
#Create a HTML page to service as evidence of positive Health-Check for AWS Auto-Scaling Group
cd /var/www/html
echo "healthy" > healthy.html
#Install Wordpress
wget https://wordpress.org/wordpress-5.1.1.tar.gz
tar -xzf wordpress-5.1.1.tar.gz
cp -r wordpress/* /var/www/html/
rm -rf wordpress
rm -rf wordpress-5.1.1.tar.gz
chmod -R 755 wp-content
chown -R apache:apache wp-content

# --not sure what this does; will check lab
wget https://s3.amazonaws.com/bucketforwordpresslab-donotdelete/htaccess.txt
mv htaccess.txt .htaccess
chkconfig httpd on
service httpd start
