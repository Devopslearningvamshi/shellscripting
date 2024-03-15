echo installing node
 dnf module disable nodejs -y 
 dnf module enable nodejs:20 -y >>/tmp/expense.log
echo $?

echo disablling node
 dnf install nodejs -y
echo $?

echo copying service file
 cp backend.service /etc/systemd/system/backend.service
echo $?

echo adding expense
 useradd expense
echo $?

echo removing app
 rm-rf /app
echo $?

echo creating dir
 mkdir /app 
echo $?

echo downlaoding 
 curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip 
echo $?

 echo app crearting files
  cd /app 
echo $?

 echo unziping files
 unzip /tmp/backend.zip
echo $?

echo app
 cd /app 
 npm install 
echo $?

 echo reloading
  systemctl daemon-reload
echo $?

 echo starting
 systemctl enable backend 
 systemctl start backend
echo $?

 echo installing sql
 dnf install mysql -y 

echo $?

 echo password  
 mysql -h 172.31.26.167 -uroot -pExpenseApp@1 < /app/schema/backend.sql 
echo $?


