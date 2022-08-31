## About DCL

Reset MySQL root password
If you have lost the password of your root user, don't worry, it is possible to reset it by following the steps below.

If the server is on a remote machine, we must enter it through SSH [Tutorial](https://www.youtube.com/watch?v=DtUt79BVvJ0&t=14s)

The first thing we need to do is stop the server.

```powershell
mysql.server stop
```
```powershell
service mysqld stop
```

```powershell
mysqld stop
```
Once the server is stopped, we must restart it in a safe mode.

```powershell
sudo mysqld_safe --skip-grant-tables --skip-networkin
```

--skip-grant-tables It allows us to connect to the server without the need for a password, in addition to granting all the privileges to the session.

```powershell
--skip-networkin Detiene la escucha de peticiones TCP/IP
```

Now, in a new tab, we must connect to the server using the root user

```powershell
mysql -u root
```

Once inside the server, we must work with the MySQL database

```powershell
USE mysql;
```

With the database change we will update.

```powershell
UPDATE user SET password=PASSWORD('your_password') WHERE user='root';
```

If the update was successful we must exit the server

```powershell
FLUSH PRIVILEGES;
exit
```

The final step is to stop the server in safe mode. We start the server as usual and we authenticate, the password will already be working.

```powershell
mysql -u root -p 
```

How to connect:

```powershell
mysql -u root -p -h localhost
```
