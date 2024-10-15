import mysql
import mysql.connector


class Base:
    def __init__(self):
        self.write_cnx = self.write()
        self.read_cnx = self.read()
        self.config = None

    def write(self):
        write_config = self.config['Connection']['Write']
        connection = mysql.connector.connect(**write_config)
        return connection

    def read(self):
        read_config = self.config['Connection']['Read']
        connection = mysql.connector.connect(**read_config)
        return connection



    def call_procedure_return_id(self, procedure_name, args):
        cursor = self.connection.admin.cursor(dictionary=True)
        cursor.callproc(procedure_name, args)
        rows = cursor.stored_results()

        return_id = None
        for row in rows:
            result = row.fetchone()
            return_id = result['LAST_INSERT_ID()'] if 'LAST_INSERT_ID()' in result else None

        self.connection.admin.commit()
        cursor.close()
        return return_id

    def select_with_id_return_all(self, query, query_id):
        cursor = self.connection.admin.cursor(dictionary=True)
        cursor.execute(query, (query_id,))
        row = cursor.fetchall()
        cursor.close()
        return row