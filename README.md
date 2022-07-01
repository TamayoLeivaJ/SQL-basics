# SQL-basics

Here you will find information about SQL, SQL clauses and aggregate functions, along with coding exercises and their answers, that will help you if you are learning SQL.


## SQL Clauses

SQL Clauses and their sequences 
| Order | Clause   | Description                        |
|-------|----------|------------------------------------|
| 1     | SELECT   | Column or expressions to be return |
| 2     | FROM     | Table to retrieve data from        |
| 3     | WHERE    | Row-level filtering                |
| 4     | GROUP BY | Group specification                |
| 5     | HAVING   | Group-level filtering              |
| 6     | ORDER BY | Output sort order                  |
<br>

## SQL WHERE Clause Operators

WHERE Clause Operators
| Operator    | Description                                           |
|-------------|-------------------------------------------------------|
| =           | Equality                                              |
| <> !=       | Non-equality                                          |
| <           | Less than                                             |
| <=          | Less than or equal to                                 |
| !<          | Not less than                                         |
| >           | Greater than                                          |
| >=          | Greater than or equal to                              |
| !>          | Not greater than                                      |
| BETWEEN     | Between two specified values                          |
| IS NULL     | Is a NULL value                                       |
| IS NOT NULL | Is not a NULL value                                   |
| ANY         | TRUE if ANY of the subquery values meet the condition |
| ALL         | TRUE if ALL of the subquery values meet the condition |
| EXISTS      | TRUE if the subquery returns one or more records      |
<br>

## SQL Statement

| Statement | Description |
|---|---|
| DISTINCT | Return only distinct values in a column |
| AS | Create an alias (for the duration of that query) <br>for a table or column. |
| CASE | The CASE statement check through conditions and <br>returns an assigned value when the first condition <br>is met (CASE WHEN). If none of the conditions are <br>met, it returns the value in the ELSE clause. |
<br>

Examples Statement<br>
**Code** <br>
```SQL
--- DISTINCT Statement
SELECT DISTINCT column 
FROM table;

--- AS Statement
SELECT column AS column2 
FROM table;

--- CASE Statement
SELECT column, quantity
CASE
    WHEN quantity > 10 THEN 'Above 10'
    WHEN quantity = 0 THEN 'Zero'
    ELSE 'Below 10'
END AS discrete_quantity
FROM Table;
```
<br>

## SQL Aggregate Functions 

| Function | Description                                                            | DBMSs |
|----------|------------------------------------------------------------------------|-------|
| AVG()    | Return a column's average value                                        | All   |
| COUNT()  | Return the number of rows in a columns.  COUNT(*) count also NULL rows | All   |
| MAX()    | Return a column's highest value                                        | All   |
| MIN()    | Return a column's lowest value                                         | All   |
| SUM()    | Return a the sum of a column's value                                   | All   |
<br>

## Excercises
### Tables

nobel table 

| yr   | subject    | winner                      | 
|------|------------|-----------------------------|
| 1960 | Chemistry  | Willard F. Libby            |
| 1960 | Literature | Saint-John Perse            |
| 1960 | Medicine   | Sir Frank Macfarlane Burnet |
| 1960 | Medicine   | Peter Madawar               |
| ...  | ...        | ...                         |
<br>

world table 

| name        | continent | area    | population | gdp          |
|-------------|-----------|---------|------------|--------------|
| Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
| Albania     | Europe    | 28748   | 2831741    | 12960000000  |
| Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
| Andorra     | Europe    | 468     | 78115      | 3712000000   |
| Angola      | Africa    | 1246700 | 20609294   | 100990000000 |
| ..          | ...       | ...     | ...        | ...          |
<br>

### 2) Aggregate functions (SUM & COUNT)

Table: world(name, continent, area, population, gdp)

[Aggregate functions (SUM & COUNT) Excersise](https://sqlzoo.net/wiki/SUM_and_COUNT)

[Aggregate functions (SUM & COUNT) Answer](https://github.com/TamayoLeivaJ/SQL-basics/blob/gh-pages/Queries/SQL_Aggregate_Functions.sql)


### 3) Subqueries (SELECT within SELECT)

Table: world(name, continent, area, population, gdp)

[subqueries Excersise](https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial)

[Subqueries Answer](https://github.com/TamayoLeivaJ/SQL-basics/blob/gh-pages/Queries/SQL_Subqueries.sql)