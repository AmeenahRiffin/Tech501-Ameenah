

- [Notes](#notes)
- [Environment variables](#environment-variables)
  - [Printing the value of an environment variable:](#printing-the-value-of-an-environment-variable)
  - [To print the value of a specific environment variable, type:](#to-print-the-value-of-a-specific-environment-variable-type)
- [Variables](#variables)
  - [Setting a new  variable:](#setting-a-new--variable)
  - [Printing a variable:](#printing-a-variable)
  - [Exporting a variable to environment variable:](#exporting-a-variable-to-environment-variable)

## Notes

- These variables are not permanent. They are only available for the current session.
- 
## Environment variables

### Printing the value of an environment variable:
To list all environment variables, type:
```
printenv
```

### To print the value of a specific environment variable, type:
```
printenv <variable_name>
```

IE:

```
printenv USER
```

This lists all the environment variables.

## Variables

### Setting a new  variable:
```
VARIABLE_NAME=value
```
### Printing a variable:

```
echo $VARIABLE_NAME
```

### Exporting a variable to environment variable:
```
EXPORT $VARIABLE_NAME
```



