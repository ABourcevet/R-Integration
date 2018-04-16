------------------------------
-- run against tenant database
------------------------------

-- create user for R development
CREATE USER RUSER PASSWORD Password1;

-- authorize user for R script
GRANT CREATE R SCRIPT TO RUSER;

-- can create / remove remote sources using SQL or interactively via Database Explorer
CREATE REMOTE SOURCE "Rserve" ADAPTER "rserve" CONFIGURATION 'server=0.0.0.0;port=30020';

-- assign remote source to user
ALTER USER RUSER SET PARAMETER RSERVE REMOTE SOURCES = 'Rserve';

-- XSA : authorize HDI container owner for R script and also authorize technical users
GRANT CREATE R SCRIPT TO "_SYS_DI_OO_DEFAULTS" WITH ADMIN OPTION;
