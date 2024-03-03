# Database-For-Administrative-Division-Of-Poland

In this repository, you will find an SQL script and CSV files for creating database of administrative division of Poland. This database was made for https://github.com/KuchnowskiP/AdministrativeDivisionOfPoland.

## Instruction
* Download script and data folder.
* Open the SQL script, go to line 1680, provide the path to your data folder, and save the script.
* Create a new database in PostgreSQL.
* Run the script in the newly created PostgreSQL database.
* Your database is now set up. Next, you need to provide the proper connection string in the YAML file in the Spring Boot App contained in this repository: https://github.com/LUKIS123/BD2-PWR-AdministrativeDivisionOfPoland.
