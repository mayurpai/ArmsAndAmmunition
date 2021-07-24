from flask import Flask, render_template, request ,session,redirect,url_for,flash
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_login import UserMixin
from flask_login import login_user,logout_user,login_manager,LoginManager
from flask_login import login_required,current_user
from flask_mail import Mail                             
from pymsgbox import *
from werkzeug.security import generate_password_hash,check_password_hash
import json
import pymysql,json
pymysql.install_as_MySQLdb()

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

LocalServer = True
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
app.secret_key = 'armsandammunition'
db = SQLAlchemy(app)

login_manager=LoginManager(app)
login_manager.login_view='login'

app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail-user'],
    MAIL_PASSWORD=params['gmail-password']
)
mail = Mail(app)


@login_manager.user_loader
def load_user(user_id):
    return Users.query.get(int(user_id))

class Ammos(db.Model):
    __tablename__ = 'ammos'
    Aname = db.Column(db.String(20), nullable=False)
    Adiameter = db.Column(db.String(20), nullable=False)
    Alength = db.Column(db.String(20), nullable=False)
    Aweight = db.Column(db.String(20), nullable=False)
    Manufactid = db.Column(db.Integer, db.ForeignKey('manufacturers.Mid'),primary_key=True,nullable=False)
    # FKName = db.Column(db.Integer, db.ForeignKey('ParentTableName.AttrName'), nullable=False)

class Country(db.Model):
    __tablename__ = 'country'
    Cname = db.Column(db.String(50), primary_key=True)
    Clocation = db.Column(db.String(80), nullable=False)
    mancountryobj = db.relationship('Manufacturers',backref='country')

# class Equip(db.Model):
#     __tablename__ = 'equip'
#     Weaponid = db.Column(db.Integer, nullable=False)
#     Userid = db.Column(db.Integer, nullable=False)

equip = db.Table('equip',
db.Column('Weaponid',db.Integer, db.ForeignKey('weapons.Wid'), nullable=False),
db.Column('Userid',db.Integer, db.ForeignKey('users.Uid'), nullable=False)
)

class Manufacturers(db.Model):
    __tablename__ = 'manufacturers'
    Mid = db.Column(db.Integer, primary_key=True)
    Mname = db.Column(db.String(20), nullable=False)
    Maddress = db.Column(db.String(50), nullable=False)
    Memail = db.Column(db.String(50), nullable=False)
    Countryname = db.Column(db.String(50), db.ForeignKey('country.Cname'),nullable=True)
    ammomanobj = db.relationship('Ammos',backref='manufacturer')
    weaponmanobj = db.relationship('Weapons',backref='manufacturer')
    vendsellsobj = db.relationship('Vendors', secondary='sellsto', backref=db.backref('seller', lazy='dynamic'))
    # obj = db.relationship('ChildClass',backref='ParentTableName', uselist=Flase) # One-One Relationship
    # obj = db.relationship('ChildClass',backref='ParentTableName') # One-Many Relationship
    
sellsto = db.Table('sellsto',
db.Column('Manufactureid',db.Integer, db.ForeignKey('manufacturers.Mid'), nullable=False),
db.Column('Vendorid',db.Integer, db.ForeignKey('vendors.Vid'), nullable=False)
)

# class Sellsto(db.Model):
#     __tablename__ = 'sellsto'
#     Manufactureid = db.Column(db.Integer, nullable=False)
#     Vendorid = db.Column(db.Integer, nullable=False)

class Users(UserMixin, db.Model):
    __tablename__ = 'users'
    Uid = db.Column(db.Integer, primary_key=True)
    Uname = db.Column(db.String(100), nullable=False) 
    Uwing = db.Column(db.String(50), nullable=False)
    Upass = db.Column(db.String(100), nullable=False)
    Vendid = db.Column(db.Integer,db.ForeignKey('vendors.Vid'), nullable=False)
    def get_id(self):
           return (self.Uid)

class Vendors(db.Model):
    __tablename__ = 'vendors'
    Vid = db.Column(db.Integer, primary_key=True)
    Vname = db.Column(db.String(20), nullable=False)
    Vemail = db.Column(db.String(50), nullable=False)
    Vaddress = db.Column(db.String(50), nullable=False)
    uservendobj = db.relationship('Users',backref='vendors')

class Weapons(db.Model):
    __tablename__ = 'weapons'
    Wid = db.Column(db.Integer, primary_key=True)
    Wname = db.Column(db.String(20), nullable=False)
    Wtype = db.Column(db.String(40), nullable=False)
    Wlicense = db.Column(db.String(20), nullable=False)
    Manid = db.Column(db.Integer,db.ForeignKey('manufacturers.Mid'), nullable=True)
    userequipobj = db.relationship('Users', secondary='equip', backref=db.backref('equipper', lazy='dynamic'))

class Trig(db.Model):
    __tablename__ = 'trig'
    Triggerid=db.Column(db.Integer,primary_key=True)
    Wid=db.Column(db.Integer)
    Wname=db.Column(db.String(20))
    Wtype=db.Column(db.String(40))
    Wlicense=db.Column(db.Integer)
    Action=db.Column(db.String(30))
    Time=db.Column(db.String(50))

@app.route("/")
# @login_required
def home():
    return render_template('home.html', params=params)

@app.route("/home1")
# @login_required
def home1():
    return render_template('home1.html', params=params)

@app.route("/table")
# @login_required
def table():
    query=db.engine.execute("SELECT * FROM `weapons`")
    if request.method=="POST":
        Wname=request.form.get('Wname')
        Wtype=request.form.get('Wtype')
        Wlicense=request.form.get('Wlicense')
        Manid=request.form.get('Manid')
        query=db.engine.execute(f"INSERT INTO `weapons` (`Wid`,`Wname`,`Wtype`,`Wlicense`,`Manid`) VALUES (`Wname` = '{Wname}', `Wtype` = '{Wtype}', `Wlicense` = '{Wlicense}', `Manid` = '{Manid}' ")
        mail.send_message(subject='Something New Out Here!', sender=params['gmail-user'], recipients=params['gmail-user'],body=f"Thank You For Inserting A New Weapon Into The Database! \nYour Entered Details Are :\nWeapon Name: {Wname}\nWeapon type: {Wtype}")
       # alert(text='You\'ve Successfully Inserted!', title='Insertion Successful', button='OK')
    return render_template('table.html', query=query, params=params)

@app.route("/manufacturers")
# @login_required
def manufacturers():
    query=db.engine.execute("SELECT * FROM `manufacturers`")
    return render_template('manufacturers.html', query=query, params=params)

@app.route("/manufacturers1")
# @login_required
def manufacturers1():
    query=db.engine.execute("SELECT * FROM `manufacturers`")
    return render_template('manufacturers1.html', query=query, params=params)

@app.route("/weapons")
# @login_required
def weapons():
    query=db.engine.execute("SELECT * FROM `weapons`")
    # if request.method=="POST":
    #     Wname=request.form.get('Wname')
    #     Wtype=request.form.get('Wtype')
    #     Wlicense=request.form.get('Wlicense')
    #     Manid=request.form.get('Manid')
    #     query=db.engine.execute(f"INSERT INTO `weapons` (`Wid`,`Wname`,`Wtype`,`Wlicense`,`Manid`) VALUES (`Wname` = '{Wname}', `Wtype` = '{Wtype}', `Wlicense` = '{Wlicense}', `Manid` = '{Manid}' ")
    #     mail.send_message(subject='Something New Out Here!', sender=params['gmail-user'], recipients=params['gmail-user'],body=f"Thank You For Inserting A New Weapon Into The Database! \nYour Entered Details Are :\nWeapon Name: {Wname}\nWeapon type: {Wtype}")
    #     alert(text='You\'ve Successfully Inserted!', title='Insertion Successful', button='OK')
    return render_template('weapons.html', query=query, params=params)

@app.route("/weapons1")
# @login_required
def weapons1():
    query=db.engine.execute("SELECT * FROM `weapons`")
    return render_template('weapons1.html', query=query, params=params)

@app.route("/vendors")
# @login_required
def vendors():
    query=db.engine.execute("SELECT * FROM `vendors`")
    # if request.method=="POST":
    #     Vid=request.form.get('Wname')
    #     Vname=request.form.get('Wtype')
    #     Vemail=request.form.get('Wlicense')
    #     Vaddress=request.form.get('Manid')
    #     query=db.engine.execute(f"INSERT INTO `vendors` (`Vid`,`Vname`,`Vemail`,`Vaddress`) VALUES (`Vname` = '{Vname}', `Vemail` = '{Vemail}', `Vaddress` = '{Vaddress}' ")
    #     mail.send_message(subject='Something New Out Here!', sender=params['gmail-user'], recipients=params['gmail-user'],body=f"Thank You For Inserting A New Weapon Into The Database! \nYour Entered Details Are :\nWeapon Name: {Wname}\nWeapon type: {Wtype}")
    #     alert(text='You\'ve Successfully Inserted!', title='Insertion Successful', button='OK')
    return render_template('vendors.html',query=query, params=params)

@app.route("/vendors1")
# @login_required
def vendors1():
    query=db.engine.execute("SELECT * FROM `vendors`")
    return render_template('vendors1.html',query=query, params=params)

@app.route("/ammunition")
# @login_required
def ammunition():
    query=db.engine.execute("SELECT * FROM `ammos`")
    return render_template('ammunition.html', query=query, params=params)

@app.route("/ammunition1")
# @login_required
def ammunition1():
    query=db.engine.execute("SELECT * FROM `ammos`")
    return render_template('ammunition1.html', query=query, params=params)

@app.route("/order")
# @login_required
def order():
    return render_template('order.html', params=params)


@app.route("/edit/<string:Wid>",methods=['POST','GET'])
# @login_required
def edit(Wid):
    posts=Weapons.query.filter_by(Wid=Wid).first()
    if request.method=="POST":
        Wname=request.form.get('Wname')
        Wtype=request.form.get('Wtype')
        # Wlicense=request.form.get('Wlicense')
        # Manid=request.form.get('Manid')
        db.engine.execute(f"UPDATE `weapons` SET `Wname` = '{Wname}', `Wtype` = '{Wtype}' WHERE `weapons`.`Wid` = {Wid}")
        # alert(text='You\'ve Successfully Updated The Selected Tuple!', title='Updation Successful', button='OK')
        return redirect('/weapons')
    return render_template('editdb.html',posts=posts)

@app.route("/delete/<string:Wid>",methods=['POST','GET'])
# @login_required
def delete(Wid):
    db.engine.execute(f"DELETE FROM `weapons` WHERE `weapons`.`Wid`={Wid}")
   # alert(text='You\'ve Successfully Deleted The Selected Tuple!', title='Deletion Successful', button='OK')
    return redirect('/weapons')

@app.route('/details')
# @login_required
def details():
    # posts=Trigr.query.all()
    posts=db.engine.execute("SELECT * FROM `trig` ORDER BY `trig`.`Wlicense` ASC")
    return render_template('triggers.html',posts=posts)

@app.route('/search',methods=['POST','GET'])    
# @login_required
def search():
    if request.method=="POST":
        query=request.form.get('search')
        Wname=Weapons.query.filter_by(Wname=query).first()
        Wtype=Weapons.query.filter_by(Wtype=query).first()
        # Wlicense=Weapons.query.filter_by(Wlicense=query).first()
        if Wname:
            query=db.engine.execute(f"SELECT * FROM `weapons` WHERE `weapons`.`Wname`='{query}'")
            alert(text='We Got You Covered!', title='Found!', button='OK')
        elif Wtype:
            query=db.engine.execute(f"SELECT * FROM `weapons` WHERE `weapons`.`Wtype`='{query}'")
            alert(text='We Got You Covered!', title='Found!', button='OK')
        else:
            alert(text='Sorry, Stocks Unavailable Currently!', title='Missing!', button='OK')
            return redirect('/weapons')
    return render_template('weapons1.html',query=query) # return redirect(url_for('/weapons',posts=posts)) # render_template('weapons.html')



@app.route('/register',methods=['POST','GET'])
def register():
    if request.method == "POST":
        Uid=request.form.get('uid')
        Uname=request.form.get('uname')
        Uwing=request.form.get('uwing')
        Upass=request.form.get('upass')
        user=Users.query.filter_by(Uid=Uid).first()
        if user:
            alert(text='User ID Already Exists!', title='Message Alert', button='OK')
            # print("Email Already Exist","warning")
            return redirect(url_for('login'))
        encpassword=generate_password_hash(Upass)
        userVendID = 1
        new_user=db.engine.execute(f"INSERT INTO `users` (`Uid`,`Uname`,`Uwing`,`Upass`,`Vendid`) VALUES ('{Uid}','{Uname}','{Uwing}','{encpassword}','{userVendID}')")
        # newuser=User(username=username,email=email,password=encpassword)
        # db.session.add(newuser)
        # db.session.commit()
        # alert(text='Kindly Log-In Yourself Now!', title='Successfully Registered', button='OK')
        # print("Signup Success Please Login","success")
        return redirect(url_for('login')) # return redirect(url_for('login'))
    return render_template('register.html') # return redirect(url_for('register'))  

@app.route('/login',methods=['POST','GET'])
def login():
    if request.method == "POST":
        Uid=request.form.get('uid')
        Upass=request.form.get('upass')
        user=Users.query.filter_by(Uid=Uid).first()
        if user and check_password_hash(user.Upass,Upass) and Uid=='1': 
            login_user(user)
            # alert(text='Access Granted', title='Access Granted', button='OK')
            # print("Login Success","primary")
            return redirect(url_for('home'))
        elif user and check_password_hash(user.Upass,Upass) and Uid=='2': 
            login_user(user)
            # alert(text='Access Granted', title='Access Granted', button='OK')
            # print("Login Success","primary")
            return redirect(url_for('home1'))
        elif user and check_password_hash(user.Upass,Upass): 
            login_user(user)
            # alert(text='Access Granted', title='Access Granted', button='OK')
            # print("Login Success","primary")
            return redirect(url_for('home1'))
        else:
            alert(text='You Are Not Authorized To Access This System/Re-Enter Your Credentials', title='Access Denied', button='OK')
            # print("invalid credentials","danger")
            return render_template('login.html')    
    return render_template('login.html')

@app.route('/logout')
@login_required
def logout():
    logout_user()
   # alert(text='Thank You!', title='Successfully Logged-Out', button='OK')
    # print("Logout SuccessFul","warning")
    return redirect(url_for('login'))

app.run(debug=True)


