import sqlite3
#from gotapp import DBPATH

DBPATH = 'db/gotdb'

def dbsitter_args (function):
  def wrapper(*args):
    conn = sqlite3.connect(DBPATH)
    result_set = function(conn, args)
    conn.commit()
    conn.close()
    return result_set
  return wrapper

def dbsitter (function):
  def wrapper():
    conn = sqlite3.connect(DBPATH)
    result_set = function(conn)
    conn.commit()
    conn.close()
    return result_set
  return wrapper


def scoreformat(function):
  def wrapper(conn):
    res = function(conn)
    result_set = [
      {
        'name': r[0],
        'points': r[1],
        'bonus': r[2],
        'total': r[3],
      } for r in res
    ]
    return result_set
  return wrapper


def lodformat(function):
    def wrapper(conn):
        res = function(conn)
        result = []
        
        return res
    return wrapper


@dbsitter
@scoreformat
def fetchallscore(conn):
  c = conn.cursor()
  c.execute('SELECT * FROM score')
  result_set = c.fetchall()
  return result_set


@dbsitter
def fetchall_lod(conn):
  c = conn.cursor()
  c.execute('SELECT * FROM lives_or_dies')
  result_set = c.fetchall()
  return result_set


@dbsitter
def fetchall_cat(conn):
  c = conn.cursor()
  c.execute('SELECT category FROM category')
  result_set = [i[0] for i in c.fetchall()]
  return result_set


@dbsitter
def fetchall_bonusq(conn):
  c = conn.cursor()
  c.execute('SELECT bonus_question_id , bonus_type, question FROM bonus_question')
  result_set = c.fetchall()
  return result_set


@dbsitter
def fetchall_user(conn):
  c = conn.cursor()
  c.execute('SELECT user_name FROM user')
  result_set = [i[0] for i in c.fetchall()]
  return result_set


@dbsitter_args
def fetchone_userid(conn, name):
  c = conn.cursor()
  c.execute('SELECT user_id FROM user where user_name = ?', name)
  result_set =  c.fetchone()[0]
  return result_set


@dbsitter_args
def insert_user(conn, name):
  c = conn.cursor()
  c.execute('INSERT INTO user (user_name) VALUES (?)', name)


@dbsitter_args
def insert_dietip(conn, many):
  c = conn.cursor()
  c.executemany('INSERT INTO die_tip (user, character, tip) VALUES (?, ?, ?)', *many)
  

@dbsitter_args
def insert_ddtip(conn, many):
  c = conn.cursor()
  c.executemany('INSERT INTO answer_dd (user, bonus_question, answer) VALUES (?, ?, ?)', *many)


@dbsitter_args
def insert_yntip(conn, many):
  c = conn.cursor()
  c.executemany('INSERT INTO answer_yn (user, bonus_question, answer) VALUES (?, ?, ?)', *many)


















