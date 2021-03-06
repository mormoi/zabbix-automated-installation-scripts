#!/usr/bin/expect -f
###Fuction:Automatic interaction###

set timeout -1
set ip [lindex $argv 0]
set password [lindex $argv 1]
set dir1  [lindex $argv 2]
set dir2  [lindex $argv 3]
###Support Multi-Command###

spawn ssh -q -o StrictHostKeyChecking=no root@$ip
expect {
          "(yes/no)"  {
                         send "yes\r";exp_continue }
          "password:" {
                         send "$password\r"}
}
expect {
          "#*"        {
#                       send "sh /root/$dir1 $ip\r "
        send "\r "
#                       send "$dir1\r "
                         send "logout\r"  }
}

expect eof
