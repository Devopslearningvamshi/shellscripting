# check in the log how the output shown

Apps_installing(){

  echo "@@@@@@@@@@@@@ 1 @@@@@@@@@" &>>/tmp/expense.log
  echo "$1"

}
Apps_installing "installing node"
 dnf module disable nodejs -y
 dnf module enable nodejs:20 -y &>>/tmp/expense.log
echo $?

Apps_installing "disablling node"
 dnf install nodejs -y&>>/tmp/expense.log
echo $?

Apps_installing "copying service file"
 cp backend.service /etc/systemd/system/backend.service&>>/tmp/expense.log
echo $?

Apps_installing "adding expense"
 useradd expense&>>/tmp/expense.log
echo $?

Apps_installing "removing app"
 rm-rf /app&>>/tmp/expense.log
echo $?

Apps_installing "creating dir"
 mkdir /app &>>/tmp/expense.log
echo $?

Apps_installing "downlaoding"
 curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip &>>/tmp/expense.log
echo $?

 Apps_installing "app crearting files"
  cd /app &>>/tmp/expense.log
echo $?

 Apps_installing "unziping files"
 unzip /tmp/backend.zip&>>/tmp/expense.log
echo $?

Apps_installing "app"
 cd /app &>>/tmp/expense.log
 npm install &>>/tmp/expense.log
echo $?

 Apps_installing "reloading"
  systemctl daemon-reload&>>/tmp/expense.log
echo $?

 Apps_installing "starting"
 systemctl enable backend &>>/tmp/expense.log
 systemctl start backend&>>/tmp/expense.log
echo $?

 Apps_installing "installing sql"&>>/tmp/expense.log
 dnf install mysql -y &>>/tmp/expense.log

echo $?

 Apps_installing "password"
 mysql -h 172.31.26.167 -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>/tmp/expense.log
echo $?

