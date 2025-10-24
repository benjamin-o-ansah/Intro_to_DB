import mysql.connector as mysql_connect

# Replace with your connection details
mydb = mysql_connect.connect(
    host="localhost",
    user="root",
    password="sudoAdmin@2025",
    database="alx_book_store"
)

print(mydb.get_server_info())