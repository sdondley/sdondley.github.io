---
date: '2020-09-27 19:15:34'
title: 'ufcw 371 mail'
updated: '2020-10-01 07:43:58'
---
* ip address
  * 54.205.84.89

## steps
* set up elastic ip address
  * done
* set domain name
  * change postfix main.cf
  * change roundcube configuration
  * change /etc//mailname
  * change /etc/hostanme
  * change /etc/hosts
* set up forwarding emails
  * [Postfix Forward Email To Another Email Account - nixCraft](https://www.cyberciti.biz/faq/linux-unix-bsd-postfix-forward-email-to-another-account/)


* set up instance
* get static ip?
* change hostname
* figure out ip address
* figrue out dns
* figure out mail server name
* install certificate

* [email - How do I fake an MX record for a domain? - Ask Ubuntu](https://askubuntu.com/questions/219723/how-do-i-fake-an-mx-record-for-a-domain)

* migrate mail from golf to new server
* do an rsync:
  * sudo rsync -av --rsync-path="sudo rsync" steve@golf.prometheuslabor.com:/srv/mailsystem/storage/ufcw371.org .
* mailbox links
  * cur
  * new
  * tmp
  * .Drafts
  * .INBOX.Drafts
  * .INBOX.Sent
  * .INBOX.Trash
  * .Sent
  * .Spam
  * .Trash
* write script to generate mailbox symlinks and modify permissions

---
### Other notes linking here:

[roundcube on AWS](/roundcube-on-AWS)
