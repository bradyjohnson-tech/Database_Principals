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