__author__ = 'pratyushsharma'


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
from cpp import *
from java import *



def judge(arg):
    rails_root = os.path.abspath(os.path.join(os.getcwd(), os.pardir))+'/'
    fileBase = os.path.abspath(os.path.join(os.getcwd(), os.pardir))+"/public/system/"
    print rails_root, fileBase
    db = serverconnect.Database(rails_root)
    args = arg.split()
    print "Client ", arg
    submission = db.c.execute(
        "SELECT problems.id, submissionFile, languageUsed, problems.title FROM submissions INNER JOIN problems ON problems.id=submissions.problem_id WHERE submissions.id=?", (args[0],))

    for row in submission:
        lang = row[2]
        submissionFile = row[1]
        problemId = row[0]
        problemTitle = row[3]
        print lang, submissionFile

    solutionFile = fileBase + "solution_files/" + \
        str(problemId) + '/' + str(problemId) + '.txt'
    testFile = fileBase + "test_files/" + \
        str(problemId) + '/' + str(problemId) + '.txt'

    print problemTitle
    if lang == ".cpp":
        ans = cpp(args[0], solutionFile, testFile,
                  submissionFile, problemId, problemTitle, fileBase, db)
    elif lang ==".java":
        ans = java(args[0], solutionFile, testFile,
                  submissionFile, problemId, problemTitle, fileBase, db)








# if __name__ == '__main__':
#     judge("cpp test.cpp")
