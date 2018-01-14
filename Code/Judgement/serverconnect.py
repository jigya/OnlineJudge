import sqlite3

class Database:
    def __init__(self, rails_root):
    	db=rails_root+"db/development.sqlite3"
        self.conn = sqlite3.Connection(db)
        self.c = self.conn.cursor()


   



# conn = sqlite3.Connection('/Users/pratyushsharma/Downloads/second_trial 2/db/development.sqlite3')
# c = conn.cursor()
# arg=1

# tu = c.execute("SELECT * FROM submissions INNER JOIN problems ON problems.id=submissions.problem_id WHERE submissions.id=?",'1')


