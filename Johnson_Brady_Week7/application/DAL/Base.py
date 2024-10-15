import json

from mysql.connector import pooling


class Base:
    def __init__(self):
        self.CONFIG_FILE_PATH = 'config.json'
        self.config = self.load_config()
        self.write_cnx_pool = self.get_write_cxn_pool()
        self.read_cnx_pool = self.get_read_cxn_pool()


    def get_write_cxn_pool(self):
        write_config = self.config['Connection']['Write']
        return pooling.MySQLConnectionPool(pool_name="read", pool_size=10, **write_config)


    def get_read_cxn_pool(self):
        read_config = self.config['Connection']['Read']
        return pooling.MySQLConnectionPool(pool_name="read", pool_size=10, **read_config)


    def load_config(self):
        try:
            with open(self.CONFIG_FILE_PATH, 'r') as config_file:
                config = json.load(config_file)
            return config
        except FileNotFoundError:
            print(f"Configuration file {self.CONFIG_FILE_PATH} not found.")
            return None
        except json.JSONDecodeError:
            print(f"Error decoding JSON from the configuration file {self.CONFIG_FILE_PATH}.")
            return None


    def call_procedure_return_id(self, procedure_name, args):
        try:
            with self.write_cnx_pool.get_connection() as connection:
                with connection.cursor(dictionary=True) as cursor:
                    cursor.callproc(procedure_name, args)
                    rows = cursor.stored_results()
                    connection.commit()
                    for row in rows:
                        result = row.fetchone()
                        if 'LAST_INSERT_ID()' not in result:
                            continue
                        return result['LAST_INSERT_ID()']
                    return None
        except Exception as e:
            print(f"An error occurred: {e}")
            return None