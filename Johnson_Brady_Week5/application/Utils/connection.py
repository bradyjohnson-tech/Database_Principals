import os

import mysql.connector
import json

class Connection:
    def __init__(self):
        current_file_path = os.path.abspath(__file__)
        current_directory = os.path.dirname(current_file_path)
        file_path = os.path.join(current_directory, 'config.json')

        with open(file_path, 'r') as f:
            config = json.load(f)

        self.config = config
        self.admin =  self.admin()

    def admin(self):
        admin_config = self.config['Connection']['Admin']
        connection = mysql.connector.connect(**admin_config)
        return connection
