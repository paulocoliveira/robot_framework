from pymongo import MongoClient

##protocolo://user:password@host:port/databasename
client = MongoClient("mongodb://qaninja:qaninja123@ds155903.mlab.com:55903/bikelovdb")

db = client['bikelovdb']

def remove_bike(name):
    bikes = db['bikes']
    bikes.delete_many({'name': name})

remove_bike("Elleven")