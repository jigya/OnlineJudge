import os
import sys
import multiprocessing
import math
import subprocess
import re
import logging
import signal
import serverconnect
import traceback



class Alarm(Exception):
    print "Alarmed"


def alarm_handler(signum, frame):
    raise Alarm
    
class cpp:

    def compile(self):
        """


        """
        self.args = ["g++"] + [self.submission]
        self.args += ["-o"] + [
            self.fileBase + "submissions/" + self.problem + "/" + self.id + ".exe"] + ['-w']

        print self.args

        # try:
        comp = subprocess.Popen(self.args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)



        out, err = comp.communicate()

        

        if len(err)>0:
            
            print "Compile Err"
            query =" UPDATE submissions set status='4 %s' where id ='%s' "%(err,self.id)

            submission = self.db.c.execute(" UPDATE submissions set status=?  where id = ?  ",('4 '+err,str(self.id),) )
            self.db.conn.commit()
            print submission
            sys.exit()
            # Compilation Error
            # Run Query


        
    def execute(self):
        """=

        """
        myinput = open(self.testFile)
        myoutput = open(
            self.fileBase + 'submissions/' + self.problem + '/' + self.id + '.out', 'w')

        self.exece = self.fileBase + 'submissions/' + self.problem + '/' + \
            self.id + '.exe'
        self.call = [self.exece]
        logging.info(self.call)
        print self.call
        try:
            signal.alarm(3)
            s = subprocess.Popen(self.call, stdin=myinput, stdout=myoutput, stderr=subprocess.PIPE)
            s.wait()
            out, err = s.communicate()
            print "errr", out, err

            myoutput.flush()
            signal.alarm(0)
            myoutput.close()
            if err:
                print "Runtime Err"
                print err
                            
                submission = self.db.c.execute(" UPDATE submissions set status=?  where id = ?  ",('3 '+err,str(self.id),) )                           
                print submission
                self.db.conn.commit()
                sys.exit()
                # Runtime Error
                # Update

            myoutput = open(
                self.fileBase + 'submissions/' + self.problem + '/' + self.id + '.out', 'r')

            out = myoutput.read().split()
            print out
            test = open(self.solutionAddress, "r")
            tested = test.read().split()
            print tested
            if tested == out:
                print "Accepted"
                query =" UPDATE submissions set status='1' where id =%s "%(self.id)
                print query
                submission = self.db.c.execute(query)
                self.db.conn.commit()

                print submission
                sys.exit()
            else:
                print "WA"
                query =" UPDATE submissions set status='2' where id =%s "%(self.id)
                print query
                submission = self.db.c.execute(query)
                self.db.conn.commit()
                print submission
                sys.exit()

        except OSError as e:
            # print "OS error"
            # print str(e)
            # print "I/O error({0}): {1}".format(e.errno, e.strerror)
            traceback.print_exc()

        except Alarm as e:
            print "TimeOut"
            s.kill()
            myoutput.flush()
            myoutput.close()
            
            query =" UPDATE submissions set status='5' where id =%s "%(self.id)
            print query
            submission = self.db.c.execute(query)
            self.db.conn.commit()

            print submission
            sys.exit()

        except Exception as e:
            print "Error"
            traceback.print_exc()

        finally:
            os.remove(self.exece)

    def __init__(self, id, solutionFile, testFile, submissionFile, problemId, problemTitle, fileBase, db):
        self.fileBase = fileBase
        signal.signal(signal.SIGALRM, alarm_handler)

        self.id = id
        self.problem_id = str(problemId)
        self.submission = submissionFile
        self.solutionAddress = solutionFile
        self.testFile = testFile
        self.problem = problemTitle
        self.db=db
        self.time = 3

        self.compile()
        self.execute()
        logging.info("Compiled Executed")
