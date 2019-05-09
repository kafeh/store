# SNACK STORE
This an API for a Snack Store. If you are an Administrator you can manage the CRUD of the products. If you are a User you can buy Snacks, give a like to products, see the list available and sort them by name and likes and also search products by name.

# Prerequisite
This API currently works with:
* Ruby 2.6.0
* Rails 5.2.3
* PosgreSQL 10.6
# Installation
For running a copy of the API on a local machine you have to follow in order these steps.

Install the required gems
```
bundle
```
For test purpose I had upload the **_.env_** file (this file must be added on the .gitignore), you can modified the values of these variables with the info of you local PostgreSQL setup.
```
POSTGRES_USER='postgres'
POSTGRES_PASSWORD='1234'
POSTGRES_HOST='localhost'
POSTGRES_DB='store_development'
POSTGRES_TEST_DB='store_test'
```
The **_database.yml_** (only uploaded for test purpose, this file must be added on the .gitignore too) is setting with the variables of the .env.

After making the changes in the **_.env_** file for your local machine, execute the database creation
```
rake db:create
```
Now you have to run migrations
```
rake db:migrate
```

For making things easy, I create with Faker gem, a **collection of data** for testing purpose, this way you don’t have to waste your time creating records or restoring a .dump file. For adding the Collection execute:
```
rake db:seed
```
The previous command will add records for all the models in the API.

# Models

The list of models used are:

* **Admin**
* **User**
* **ProductType**
* **Product**
* **PriceProduct**
* **LikeProduct** 
* **Order**
* **OrderItem**.

# Deployment
Now that you have everything setup in your API is time for deployment, you have to execute the command:
```
rails s
```
