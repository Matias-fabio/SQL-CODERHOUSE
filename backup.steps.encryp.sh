mysqldump -u $user -p --host $host --port $port 

# compress
tar -czf backup_workshop.tar.gz Dump20240505.sql
# Encrypt
openssl enc -aes-256-cbc -salt -in backup_workshop.tar.gz -out backup_workshop.tar.gz.enc -k your_password
# Decrypt
openssl aes-256-cbc -d -in backup_workshop.tar.gz.enc -out backup_workshop.tar.gz -k $your_password
# uncompress
tar -xvzf backup_workshop.tar.gz


# Store in the cloud
# Github - GitLab - AWS - AZURE - GCP