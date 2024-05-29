from flask import Flask, render_template, jsonify 
from sqlalchemy import create_engine
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
import json 


app = Flask(__name__)

engine = create_engine('postgresql://postgres:postgress@localhost:5432/air_qual')

Base = automap_base()

Base.prepare(autoload_with = engine)


@app.route("/")
def home():
    return render_template('index.html')



@app.route('/carbon')
def get_carbon():
    
    carbon = Base.classes.carbon

    session = Session(engine)

    carbon_query = session.query(carbon.city, carbon.carbon_max, carbon.carbon_month).all()


    carbon_list = []

    for row in carbon_query:
        carbon_dictionary = {}
        carbon_dictionary['city'] = row[0]
        carbon_dictionary['carbon_max'] = row[1]
        carbon_dictionary['carbon_month'] = row[2]
        carbon_list.append(carbon_dictionary)
    
    session.close()
    
    return jsonify(carbon_list) 



@app.route('/nitrogen')
def get_nitrogen():
    
    nitrogen = Base.classes.nitrogen

    session = Session(engine)

    nitrogen_query = session.query(nitrogen.city, nitrogen.nitrogen_max, nitrogen.nitrogen_month).all()


    nitrogen_list = []

    for row in nitrogen_query:
        nitrogen_dictionary = {}
        nitrogen_dictionary['city'] = row[0]
        nitrogen_dictionary['nitrogen_max'] = row[1]
        nitrogen_dictionary['nitrogen_month'] = row[2]
        nitrogen_list.append(nitrogen_dictionary)
    
    session.close()
    
    return jsonify(nitrogen_list) 



@app.route('/ozone')
def get_ozone():
    
    ozone = Base.classes.ozone

    session = Session(engine)

    ozone_query = session.query(ozone.city, ozone.ozone_max, ozone.ozone_month).all()


    ozone_list = []

    for row in ozone_query:
        ozone_dictionary = {}
        ozone_dictionary['city'] = row[0]
        ozone_dictionary['ozone_max'] = row[1]
        ozone_dictionary['ozone_month'] = row[2]
        ozone_list.append(ozone_dictionary)
    
    session.close()

    return jsonify(ozone_list) 





@app.route('/pm10')
def get_pm10():
    
    pm10 = Base.classes.pm10

    session = Session(engine)

    pm10_query = session.query(pm10.city, pm10.pm10_max, pm10.pm10_month).all()


    pm10_list = []

    for row in pm10_query:
        pm10_dictionary = {}
        pm10_dictionary['city'] = row[0]
        pm10_dictionary['pm10_max'] = row[1]
        pm10_dictionary['pm10_month'] = row[2]
        pm10_list.append(pm10_dictionary)
    
    session.close()
    
    return jsonify(pm10_list) 




@app.route('/pm25')
def get_pm25():
    
    pm25 = Base.classes.pm25

    session = Session(engine)

    pm25_query = session.query(pm25.city, pm25.pm25_max, pm25.pm25_month).all()


    pm25_list = []

    for row in pm25_query:
        pm25_dictionary = {}
        pm25_dictionary['city'] = row[0]
        pm25_dictionary['pm25_max'] = row[1]
        pm25_dictionary['pm25_month'] = row[2]
        pm25_list.append(pm25_dictionary)
    
    session.close()
    
    return jsonify(pm25_list) 




@app.route('/visualizations')
def view_graphs():
    return render_template('index2.html')





if __name__  == "__main__":
    app.run(debug = True)