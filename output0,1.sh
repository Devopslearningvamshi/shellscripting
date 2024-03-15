echo installing node
 dnf module disable nodejs -y dnf module enable nodejs:20 -y

echo disablling node
 dnf install nodejs -y

echo copying service file
 cp backend.service /etc/systemd/system/backend.service

echo adding expense
 useradd expense

echo removing app
 rm-rf /app

echo creating dir
 mkdir /app 

echo downlaoding 
 curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip 

 echo app crearting files
  cd /app 

 echo unziping files
 unzip /tmp/backend.zip

echo app
 cd /app 
 npm install 

 echo reloading
  systemctl daemon-reload

 echo starting
 systemctl enable backend 
 systemctl start backend

 echo installing sql
 dnf install mysql -y 


 echo password
 mysql -h 172.31.26.167 -uroot -pExpenseApp@1 < /app/schema/backend.sql 


