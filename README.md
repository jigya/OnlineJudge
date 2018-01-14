# OnlineJudge
Online Code Judge
Software Platform used:

1.	Ruby on Rails
Ruby on Rails, often simply Rails, is an open source web application framework which runs via the Ruby programming language. It is a full-stack framework: it allows creating pages and applications that gather information from the web server, talk to or query the database, and render templates out of the box. As a result, Rails features a routing system that is independent of the web server.
Ruby on Rails emphasizes the use of well-known software engineering patterns and principles, such as active record pattern, convention over configuration (CoC), don't repeat yourself (DRY), and model-view-controller (MVC).

2.	SQLite
SQLite is a relational database management system contained in a C programming library. In contrast to other database management systems, SQLite is not a separate process that is accessed from the client application, but an integral part of it.
SQLite is ACID-compliant and implements most of the SQL standard, using a dynamically and weakly typed SQL syntax that does not guarantee the domain integrity.

3.	Python
	
Instructions to run the program:

1.	Install Ruby on Rails 
sudo apt-get ruby
gem install rails

2.	Install Python
sudo apt-get python

3.	To run the Online Judge
	a. In one terminal window/command prompt:
		cd (path of directory where OnlineJudge folder is saved)
	cd ./Judgement
	python server.py 50007
	b. In another terminal window/command prompt:
	cd (path of directory where OnlineJudge folder is saved)
	rails server
	This will fire up WEBrick, a web server distributed with Ruby by default. To see the application, open a browser 	window and navigate to http://localhost:3000.
