# Converter

There are two scripts that do the exact same thing `convert.rb` and
`convert.py`. The python version requires no dependencies be installed,
the Ruby version requires [Nokogiri](http://www.nokogiri.org/tutorials/installing_nokogiri.html).

## Installation

This script uses [Ruby](https://www.ruby-lang.org) and needs [git](http://git-scm.com) to run.


* Clone or [download](https://github.com/waynegraham/vermont/archive/master.zip) the repository.

```
$ git clone https://github.com/waynegraham/vermont.git
$ cd vermont
```

### Python

Set the path in the script where you have the files downloaded:

```python
RECORDS_PATTERN = "./PT*.xml"
```

This will find all XML documents in that directory.


In the terminal, run the script:

```
$ python convert.py
```

This will create a file named `records.xml` of the flattend records in
the XML files that can be easily imported in to Access.

### Ruby

Set the path in the script where you have the files downloaded:

```ruby
RECORDS_PATTERN = "./PT*.xml"
```

This will find all XML documents in that directory.

In the terminal, run the script:

```
$ ruby convert.rb
```

This will create a file named `records.xml` of the flattend records in
the XML files that can be easily imported in to Access.


