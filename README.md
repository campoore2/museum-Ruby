# Museum Tracker
#### Using Ruby to Process Classes and SQL
#### How it Works

A curator can add, update or delete the museums they support. Add, delete, or update any artwork. Also able to see where a work of art is being showed.

## Setup/Installation Requirements

* Clone the repo from GitHub.com/campoore2/museum-Ruby
* In PSQL:
  * CREATE DATABASE museum_tracker;
  * CREATE TABLE museums (id serial PRIMARY KEY, name varchar);
  * CREATE TABLE artworks (id serial PRIMARY KEY, name varchar, museum_id int);
  * CREATE DATABASE museum_tracker_test WITH TEMPLATE museum_tracker;

## Support

Email Me!
<mailto:campoore2@gmail.com>

## Technologies Used
* Ruby
* SQL
* HTML
* CSS

###### Licence

License Copyright &copy; 2016 Cameron Poore
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACT
