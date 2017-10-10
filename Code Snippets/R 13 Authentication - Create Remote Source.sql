------------------------------
-- run against tenant database
------------------------------

-- cleanup
DROP REMOTE SOURCE "RserveWithAuth";

-- create a remote source (need to customize server, port and authentication settings)
CREATE REMOTE SOURCE "RserveWithAuth" 
 ADAPTER "rserve" 
 CONFIGURATION 'server=0.0.0.0;port=30020;authenticationMode=crypted'
 WITH CREDENTIAL TYPE 'PASSWORD' USING 'user=myRserveUserName;password=myRservePW'
 ;

-- assign remote source to user
ALTER USER RUSER SET PARAMETER RSERVE REMOTE SOURCES = 'RserveWithAuth';
