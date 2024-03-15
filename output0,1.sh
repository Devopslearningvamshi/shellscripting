echo installing node
echo dnf module disable nodejs -y
dnf module enable nodejs:20 -y

echo disablling node
echo dnf install nodejs -y

echo copying service file
echo cp backend.service /etc/systemd/system/backend.service

echo adding expense
echo useradd expense

rcho removing app
echo rm-rf /app

echo creating dir
echo mkdir /app 

echo downlaoding 
echo curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip 

 echo app crearting files
 echo cd /app 

 echo unziping files
echo unzip /tmp/backend.zip

echo cd /app 
echo npm install 

echo  systemctl daemon-reload

echo systemctl enable backend 
echo systemctl start backend

echo dnf install mysql -y 


echo mysql -h 172.31.26.167 -uroot -pExpenseApp@1 < /app/schema/backend.sql 


