# SqlParser Test Task

### User story: 
Create a library that accepts DDL sql script as a text, extracts **required data** and returns C# object _DataModelDto_.

Required data (JSON pseudo structure): 
```javascript
schemas: [ { name }, ... ]
tables: [ {  schema,  name, columns: [ { table, name, datatype, allow nulls }, ... ] }, ... ]
```

### Development Task
1. Implement ISqlParserService interface:

```C#
public interface ISqlParserService { 
	DataModelDto ParseSql(DbTypeDto dbType, string sqlScript); 
}
```

2. Populate all fields in DataModelDto object


### What to use:
- sqlparser.com library (http://sqlparser.com/download.php)
- Visual Studio 2017
- C# .Net Framework 4.7.1
- Best practices you know. 

### SqlParser Solution:
- SqlParser.Dto - contains required for Task Data Transfer Objects (Dto). 
- SqlParser.Biz - BL layer. It contains interface ISqlParserService
- TestData - contains sql scripts for tests.

### Restrictions: 
- Do not change anything in SqlParser.Dto project.
- Do not modify ISqlParserService interface.

### Questions?
- You can ask any question you have.

### Task results:
- Do not upload your code to github
- zip your solution and send it back to us.
	