import mysql.connector 

def create_database(): 
    try:
        
        mysql_db = mysql.connector.connect(
            host="localhost",
            user="root", 
            password="sudoAdmin@2025",
            database="alx_book_store",
        )
        if mysql_db.is_connected():
            my_cursor = mysql_db.cursor()
            sql_statement = "CREATE DATABASE IF NOT EXISTS alx_book_store;"
            my_cursor.execute(sql_statement)
            print("'alx_book_store' created successfully!") 
    except mysql.connector.Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        if mysql_db.is_connected():
            my_cursor.close()
            mysql_db.close()
            print("MySQL connection is closed")
            
if __name__ == "__main__":
        
    create_database()