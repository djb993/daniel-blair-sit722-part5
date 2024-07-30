from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import os

SQLALCHEMY_DATABASE_URL = "postgresql://oud_native_part4_db_user:sKEWK5pzBkVfxdqAyMuVAEhSzCPuiwi7@dpg-cqj41nggph6c7390up3g-a.singapore-postgres.render.com/cloud_native_part4_dbcl" #os.getenv("DATABASE_URL")

# postgresql://admin:E5OJuKRE14iotwfsvHwJeqsjaKK1eKmO@dpg-cq0nb2aju9rs73b0500g-a.oregon-postgres.render.com/part2

engine = create_engine(SQLALCHEMY_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()
