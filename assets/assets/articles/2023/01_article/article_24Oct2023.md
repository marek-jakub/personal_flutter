## Flutter Error: Could not find the correct Provider…

2023-10-24

200 words

## Situation

Building a mobile application focused on data management, some of the logic has been based on a local SQLite database operations (allowing local data editing and management prior to being sent off…).

## Task

The provider has offered a single Facade to several forms (collecting data), but has served as a Pipeline (e.g. for sorting or transforming data) as well. The task has been simple, on filling a form, the data has been sent to the provider, which in turn called the right method (any one of the CRUD methods...) in the single instance of the database. The access to the database has been supplied by the Provider package. During the update of the database class name, error in the Figure 1 has been encountered:

![Figure 1: An error shown on accessing nonexistent resource.](assets/articles/2023/01_article/Error.png "Figure 1: An error shown on accessing nonexistent resource.")

## Action

This has been a simple error, caused by the change in the name of the database class the provider has been supposed to access. Once this error has been corrected (the name of the class given at provider initialization has been adjusted to mirror that of the database), the error has been resolved.

The first code sample is the simple start of the database class with its name and schema version:

.dart

~~~dart
class DataBase extends _$DataBase{

DataBase() : super(_openConnection());

@override
int get schemaVersion => 1;

...
}
~~~

The second code sample is the provider set at the application initialization in the main.dart file, it should seek to access the right class name of the database:

.dart

~~~dart
...

Provider<DataBase>(
create: (context) => _dataBase,
dispose: (context, db) => db.close(),
)

...
~~~

## Result

Corrective action has had the expected effect. The data Pipeline and Facade access to the database has been renewed and no further ‘Could not find the correct Provider’ errors have been encountered.

***

_The use of the STAR method outline is deliberate (used in behavioral assessment). It is a way of training, documenting not only errors but possibly my behaviour as well._
