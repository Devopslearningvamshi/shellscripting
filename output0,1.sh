echo installing node
 dnf module disable nodejs -y 
 dnf module enable nodejs:20 -y &>>/tmp/expense.log
echo $?

echo disablling node
 dnf install nodejs -y&>>/tmp/expense.log
echo $?

echo copying service file
 cp backend.service /etc/systemd/system/backend.service&>>/tmp/expense.log
echo $?

echo adding expense
 useradd expense&>>/tmp/expense.log
echo $?

echo removing app
 rm-rf /app&>>/tmp/expense.log
echo $?

echo creating dir
 mkdir /app &>>/tmp/expense.log
echo $?

echo downlaoding 
 curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip &>>/tmp/expense.log
echo $?

 echo app crearting files
  cd /app &>>/tmp/expense.log
echo $?

 echo unziping files
 unzip /tmp/backend.zip&>>/tmp/expense.log
echo $?

echo app
 cd /app &>>/tmp/expense.log
 npm install &>>/tmp/expense.log
echo $?

 echo reloading
  systemctl daemon-reload&>>/tmp/expense.log
echo $?

 echo starting
 systemctl enable backend &>>/tmp/expense.log
 systemctl start backend&>>/tmp/expense.log
echo $?

 echo installing sql&>>/tmp/expense.log
 dnf install mysql -y &>>/tmp/expense.log

echo $?

 echo password  
 mysql -h 172.31.26.167 -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>/tmp/expense.log
echo $?


