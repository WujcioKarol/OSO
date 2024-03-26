# !/bin/bash
echo "Z1.1"
echo "secure"
grep "Failed" -c secure
echo "secure.1"
grep "Failed" -c secure.1 
echo "Z1.2"
echo "secure"
grep "Failed" secure | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | sort|uniq -c | sort -nr | uniq | head -n 30
echo "secure.1"
grep "Failed" secure.1 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' |sort| uniq -c | sort -nr | uniq | head -n 30
echo "Z1.3"
echo "secure"
grep "Failed" secure | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | sort|uniq | xargs -I{} geoiplookup {} | sort | uniq -c | sort -nr | head -n 10
echo "secure.1"
grep "Failed" secure.1 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | sort |uniq | xargs -I{} geoiplookup {} | sort | uniq -c | sort -nr | head -n 10
echo "Z1.4"
echo "secure"
grep 'Failed' secure | awk '{print $9,$11}' | awk '{if ($1 == "invalid") {print $2} else if (!(match($1, /^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$/))) {print $1}}' | sort | uniq -c | sort -nr | head -n 20echo "secure.1"
echo "secure.1"
grep 'Failed' secure.1 | awk '{print $9,$11}' | awk '{if ($1 == "invalid") {print $2} else if (!(match($1, /^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$/))) {print $1}}' | sort | uniq -c | sort -nr | head -n 20echo "Z1.5"
echo "Z1.5"
echo "secure"
grep 'Accepted' secure | awk '{print $9}' | sort | uniq -c
echo "secure.1"
grep 'Accepted' secure.1 | awk '{print $9}' | sort | uniq -c


# echo "Z2.1"
# grep "login authenticator failed" final.log -c
# echo "Z2.2"
# grep "login authenticator failed" final.log | grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' -o | sort | uniq -c | sort -nr
# echo "Z2.3"
# grep "login authenticator failed" final.log | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | xargs -I{} geoiplookup {} | sort | uniq -c | sort -nr | head -n 10
# echo "Z2.4"
# grep "R=localuser" final.log | cut -d ' ' -f 5 | cut -d "@" -f 1 | sort | uniq | sort -t "-" -k 2 -n
# echo "Z2.5"
# grep "login authenticator failed" final.log | grep -v "@" | awk '{print $NF}' | cut -d '=' -f 2 | cut -d ')' -f 1 | sort | uniq -c | sort -nr | head -n 20
# echo "Z2.6"
# echo "no host name found for IP address"
# grep "no host name found for IP address" final.log
# echo "rejected RCPT"
# grep "rejected RCPT" final.log
# echo "rejected unknown sender"
# grep "rejected unknown sender" final.log
# echo "rejected by non-SMTP server"
# echo "message too big for system"
# grep "message too big for system" final.log
# echo "max connection rate exceeded"
# grep "max connection rate exceeded" final.log
# echo "authentication failed"
# grep "authentication failed" final.log
