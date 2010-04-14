#!/usr/bin/env python

import os
""" Python OS """

import sys
""" Python System """

import subprocess as sub
""" Python Subprocess """

import difflib
""" Python Diff Module """

import smtplib
""" Python SMTP Module """

import pprint
""" Python Pretty Print Module """

# Mail Server Variables
MAIL_USERNAME = None
MAIL_PASSWORD = None
MAIL_SERVER   = "localhost"
MAIL_PORT     = 25

# Git Email Variables
GIT_MAIL_TO             = "gitops@yammer-inc.com"
GIT_MAIL_FROM           = "no-reply@yammer-inc.com"
GIT_MAIL_SUBJECT_PREFIX = "[GIT] "


class GitEmail(object):
    """
    This class handles all the Git related email construction and
    sending.
    """
    
    def __init__(self, to=None, fro=None, subj=None, body=None):
        """

        Arguments:
        - `to`: To address.
        - `fro`: From Address.
        - `subj`: Subject of email.
        - `body`: Body of email.
        """
        self._to = to
        self._fro = fro
        self._subj = subj
        self._body = body
        

    def display_email(self):
        """ Display the attributes for this email.
        
        Arguments:
        - `self`:
        """
        print "TO: %s" % (self._to)
        print "From: %s" % (self._fro)
        print "Subject: %s" % (self._subj)
        print "Body: %s" % (self._body)

    

class GitPushEmail(object):
    """
    This class handles grabbing what's being passed from stdin and
    building content and related objects (ie email)
    """
    
    def __init__(self, content):
        """ 
        
        Arguments:
        - `content`: Content from git being passed to the script
        """
        self._content = content[0].strip()

        # Get the appropriate information we need from self._content regarding
        # previous commit, current commit, and branch.
        self._prev_commit_hash = self._content[0]
        self._curr_commit_hash = self._content[1]
        self._curr_commit_branch = self._content[2]
        
        # Building email object without body content
        self._git_email = GitEmail(GIT_MAIL_TO,
                                   GIT_MAIL_FROM,
                                   GIT_MAIL_SUBJECT_PREFIX)


    def git_log(self, prev_commit, curr_commit):
        """ Get a Git Log between last commit and current commit
        
        Arguments:
        - `self`:
        - `prev_commit`:
        - `curr_commit`:
        """
        sub.Popen

        

# Run This First
if __name__ == "__main__":
    # Build a Git Push Email Object from information being passed in
    git_push_email_obj = GitPushEmail(sys.stdin.readlines())

    # Debug output
    pprint.pprint(git_push_email_obj._content)
