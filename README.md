# SqlParser Test Task

# User story: 

	User wants to import his database schema into https://sqldbm.com application to analyze it.
	User can provide DDL script of his database
	https://sqldbm.com accepts DataModelDto object for import.


# Dev Task

	- Implement ISqlParserService interface.


# What to use:

	- sqlparser.com library (http://sqlparser.com/download.php)
	- Visual Studio 2017
	- C# .Net Framework 4.7.1
	- Best practices you know. 


# SqlParser Solution:

	- SqlParser.Dto - contains required for Task Data Transfer Objects (Dto). 
	- SqlParser.Biz - BL layer. It contains interface ISqlParserService
	- TestData - contains sql scripts for tests.


# Restrictions: 

	- Do not change anything in SqlParser.Dto project.
	- Do not modify ISqlParserService interface.


# Questions:

	- Ask Ajay (ajay.singh@sqldbm.com) any questions you have.


# Results:

	- zip your solution and send it back to Ajay (ajay.singh@sqldbm.com)
	