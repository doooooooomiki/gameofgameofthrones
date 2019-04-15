from gotapp import app
from flask import render_template
from flask import redirect
from flask import url_for
from flask import request
from flask import flash
from gotapp.connectdb import fetchallscore
from gotapp.connectdb import fetchall_lod
from gotapp.connectdb import fetchall_cat
from gotapp.connectdb import fetchall_bonusq
from gotapp.connectdb import fetchall_user
from gotapp.connectdb import insert_user
from gotapp.connectdb import fetchone_userid
from gotapp.connectdb import insert_dietip
from gotapp.connectdb import insert_ddtip
from gotapp.connectdb import insert_yntip


@app.route('/')
def home():
    scores = fetchallscore()
    return render_template('index.html', scores=scores)

@app.route('/tipp', methods=['GET', 'POST'])
def tipp():
    categories = fetchall_cat()
    lod = fetchall_lod()
    bonus = fetchall_bonusq()
    if request.method == 'POST':
        username = request.form.get('username') 
        if username in fetchall_user():
            flash('dieser name existiert bereits')
            return render_template('tip.html', categories=categories, lod=lod, bonus=bonus)
        else:
            insert_user(username)
            user_id = fetchone_userid(username)
            r = request.form.to_dict()
            die_tip = [(user_id, int(i.replace('die-tip-', '')), int(r[i])) for i in r if 'die-tip-' in i]
            dd_tip = [(user_id, int(i.replace('bonus-dd-', '')), int(r[i])) for i in r if 'bonus-dd-' in i]
            yn_tip = [(user_id, int(i.replace('bonus-yn-', '')), int(r[i])) for i in r if 'bonus-yn-' in i]
           
            insert_dietip(die_tip)
            insert_ddtip(dd_tip)
            insert_yntip(yn_tip)
            
        return redirect(url_for('home'))

    
    return render_template('tip.html', categories=categories, lod=lod, bonus=bonus)

