import mysql.connector
import json

class Connection:
    def __init__(self):
        with open('config.json', 'r') as f:
            config = json.load(f)

        self.config = config
        self.admin =  self.admin()

    def admin(self):
        admin_config = self.config['Connection']['Admin']
        connection = mysql.connector.connect(**admin_config)
        return connection
