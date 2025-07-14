import os
from dotenv import load_dotenv
from pymongo import MongoClient
from robot.api.deco import keyword, library

load_dotenv()

@library
class Mongo:
    def __init__(self):
        self.client = MongoClient(os.getenv("MONGO_URI"))
        self.db = self.client[os.getenv("DB_NAME")]
        self.users = self.db[os.getenv("COLLECTION_NAME", "users")]

    @keyword("Delete User")
    def delete_user(self, email):
        return self.users.delete_one({"email": email}).deleted_count > 0

    @keyword("Get User")
    def get_user(self, email):
        user = self.users.find_one({"email": email})
        return user if user else None

    @keyword("Delete All Users")
    def delete_all_users(self):
        return self.users.delete_many({}).deleted_count

    @keyword("Close Connection")
    def close_connection(self):
        self.client.close()
