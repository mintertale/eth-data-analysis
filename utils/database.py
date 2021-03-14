import psycopg2
from configparser import ConfigParser
import helper as h

def connection_details(filename='../database.ini',
                       section='database_connection_details'):
    parser = ConfigParser()
    parser.read(filename)

    db = {}
    if parser.has_section(section):
        params = parser.items(section)
        for param in params:
            db[param[0]] = param[1]
    else:
        raise Exception('No such section in database.ini file')

    return db

# Connect to the database
def connect_to_db():
    con = None
    try:
        # create connection to database
        print("Connecting to database")
        con = psycopg2.connect(**connection_details())
        # creating a cursor
        cur = con.cursor()
        return con,cur
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)

def disconnect_from_db(con, cur):
    try:
        # commit what has been done
        con.commit()
        # close cursor
        cur.close()

        # close the connection
        if con is not None:
            print("Closing connection to database...")
            con.close()
            print("done")
    # catch database errors
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
