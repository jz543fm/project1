			DAILY ARCHIVE SCRIPT

The workhouse for achiving daa in the Linux world is the tar command. 
Tar command is used to archive entire dirs into a single file. 

$ tar -cf archive.tar /home/Christine/Project/*.*
tar: Removing leading '/' from member names
$
$ ls -l archive.tar
-rw-rw-r--. 1 Christine Christine 51200 Aug 27 10:51 archive.tar
$

The tar commands responds with a warning message that it's removing the leading
forward slash from the pathnname to convert if rom an absolute pathname to a 
relative pathname. This allow you to extract the tar archived files anywhere
you want in your FS. You can accomplish this by redirecting STDERR to the 
/dev/null file.

$ tar -cf archive.tar /home/Christine/Project/*.* 2>/dev/null
$
$ ls -l archive.tar
-rw-rw-r--. 1 Christine Christine 51200 Aug 27 10:53 archive.tar
$

So, tar archive file can consume lots of disk space, it's good idea to compress
the file. You can do this by simply adding the -z option. This compress the 
tar archive file into a gzipped tar file, which is called tarball. Example:

$ tar -cf archive.tar /home/Christine/Project/*.* 2>/dev/null
$
$ ls -l archive.tar
-rw-rw-r--. 1 Christine Christine 51200 Aug 27 10:53 archive.tar
$

-> Now you have the main component for your archive script completed. 

You can have the scipt read thru the conf file and add the names of each 
directory to the archive list. To do this, use the simple read command, to read
each record from the file. But instead of using the cat command piped into a 
while loop, this script redirects STDIN using the exec command:

exec < $CONFIG_FILE

read FILE_NAME

Notice that a var is used for the archiving conf file, CONFIG_FILE. Each record
is read in from the conf file. As lonk as the read command finds a new conf file
record to read, it returns an exit value of 0 for success in the ? var. You can
use this as a test in a while loop in order to read all the records from the 
conf file:

while [ $? -eq 0 ]
do
[...]
read FILE_NAME
done

When the read command hits the end of the conf file, it returns a non-zero
status. At that point, the while loop is exited. 

In the while loop, 2 things need to happen. 1st, you must add the dir name to 
your archive list. Even more important is to check to see if that dir even
exists! It would be very easy to remove a dir from the filesystem and forget to
update the archive conf file. You can check a dir's existence using a simple if
statement. If the directory does exist, it is added to the list of dirs to
archive, FILE_LIST. Otherwise, a warning massage is issued. Here is what this
if statent looks like:

if [ -f $FILE_NAME -o -d $FILE_NAME ]
then
# If file exists, add its name to the list.
	FILE_LIST="$FILE_LIST $FILE_NAME"
else
# If file doesn't exist, issue warning
	echo
	echo "$FILE_NAME, does not exist."
	echo "Obviously, I will not include it in this archive."
	echo "It is listed on line $FILE_NO of the config file."
	echo "Continuing to build archive list..."
	echo 
fi
#
FILE_NO=$[$FILE_NO + 1]	# Increase Line/File number by one.

Because a record in our achive conf file can be a filename or a dir, the if 
statement tests for the existence of both, using the -f and the -d options. 
The or option, -o, allows for either the file's or the dir's existence test to
return a non-zero status for the entire if statement to be treated as true. 

To provide a little extra help in tracking down non-existent dirs and files, thevar FILE_NO is added, thus, the script can tell you exactly what line number in
the archive conf file contains the incorrect or missing file or dir.




		Creating a daily archive location


If you are just backing up a few files, it's fine to keep the archive in your 
personal dir. However, if several dirs are being backed up, it's best to create
a cetral repository archive directory:

$ sudo mkdir /archive

$ ls -ld /archive

After you have your central repository archive dir created, you need to grant 
access to it for certain users. If you do not do this, trying to create files in
this dir fails, as shown here: 

$ mv Files_To_Backup /archive/
mv: cannot move 'Files_To_Backup' to
'/archive/Files_To_Backup': Permission denied
$

You could grant the users needint to create files in this dir permission via
sudo or create a user gourp. In this case, a special user group is created,
Archivers:

$ sudo groupadd Archivers
$
$ sudo chgrp Archivers /archive
$
$ ls -ld /archive
drwxr-xr-x. 2 root Archivers 4096 Aug 27 14:10 /archive
$
$ sudo usermod -aG Archivers Christine
[sudo] password for Christine:
$
$ sudo chmod 775 /archive
$
$ ls -ld /archive
drwxrwxr-x. 2 root Archivers 4096 Aug 27 14:10 /archive
$

After a user has been added to the Archivers group, the user must log out and 
log back in for the group membership to take effect. Now files can be created bythis group's member without the use of super-user privileges:

$ mv Files_To_Backup /archive/
$
$ ls /archive
Files_To_Backup
$

Keep in mind that all Archivers group members can add and delete files from this
dir. It may be best to add the sticky bit to the dir, in order to keep group
members from deleting each other's archive tarballs. 


	
	Creating a daily archive script

The Daily_Archive.sh script automatically creates an archive to a designed 
location, using the current date to uniquely identify the file. Here's the code
for the portion of the script

DATE=$(date +%y%m%d)
#
# Set Archive File Name
#
FILE=archive$DATE.tar.gz
#
# Set Configuration and Destination File
#
CONFIG_FILE=/archive/Files_To_Backup
DESTINATION=/archive/$FILE
#

The DESTINATION var appends the full pathname for the archived file. 
THE CONFIG_FILE var points to the archive conf file containing the dirs to be 
archived. These both can be easily changed to alternate dirs and files if need.


	
			HOURLY ARCHIVE SCRIPT

If you are in high-volume production envireoment where files are changing 
rapidly, a daily archive might not be good enough. If you want to increase the
archiving frequency to hourly, you need to take another item into consideration.

When backing up files hourly and trying use the date command to timestamp each
tarball, things can get pretty ugly pretty quickly.

The archive directory contains dirs for each montch of the year, using the month
numbers as the dir name. Each month's dir in turn contains foldes for each day
of the month (using the day's numerical value as the dir name). This allows you
to just timestamp the individual tarballs and place them in appropriate dir for
the day and month. 

First, the new directory /archive/hourly must be created, along with the 
appropriate permissions set upon it. Remember from early in this chapter that
members of the Archivers group are granted permissions to create archives in 
this directory area. Thus, the newly created dir must have its primary group 
permissions changed. 

$ sudo mkdir /archive/hourly

$sudo chgrp Archivers /archive/hourly
$
$ ls -ld /archive/hourly/
drwxr-xr-x. 2 root Archivers 4096 Sep 2 09:24 /archive/hourly/
$
$ sudo chmod 775 /archive/hourly
$
$ ls -ld /archive/hourly
drwxrwxr-x. 2 root Archivers 4096 Sep 2 09:24 /archive/hourly
$

$ cat Files_To_Backup
/usr/local/Production/Machine_Errors
/home/Development/Simulation_Logs
$
$ mv Files_To_Backup /archive/hourly/
$

The script must create individual month and day dirs automatically. If these 
dirs already exist, and script tries to create them, an error is generated!!!


