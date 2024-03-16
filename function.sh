#this is how u can install app using the function
prininting () {
echo hello patelvamshidhar reddy
echo installing app
dnf install nodejs -y &>>/tmp/expense.log
echo $?
}
prininting
